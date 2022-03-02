//
//  DailyWidget.swift
//  DailyWidget
//
//  Created by Joshua Spicer on 10/10/20.
//

import WidgetKit
import SwiftUI

struct WordEntry: TimelineEntry {
    var date: Date
    let word: Word
    let flag: String
    let language: SupportedLanguages
}

struct Provider: TimelineProvider {
    
    @AppStorage("language", store: UserDefaults(suiteName: "group.com.joshspicer.dailyword"))
    var language: SupportedLanguages = SupportedLanguages.Italian
    
    func placeholder(in context: Context) -> WordEntry {
        return WordEntry(date: Date(), word: Word(native: "Hello", foreign: "Hello"), flag: "🇺🇸", language: .Italian)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WordEntry) -> Void) {
        
        let entry = WordEntry(date: Date(), word: Word(native: "Hello", foreign: "Hello"), flag: "🇺🇸", language: .Italian)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WordEntry>) -> Void) {
        
        // Time of creation
        let now: Date = Date()
        
        // The earliest moment we'd be ok with the widget refreshing
        let calendar = Calendar.current
        let future = calendar.date(byAdding: .hour, value: 24, to: now)!
        
        let lang = LanguageFactory.Create(lang: language)
        let randWord = lang.getRandom()
        
        let entry = WordEntry(date: now, word: randWord, flag: lang.getFlag(), language: language)
        let timeline = Timeline(entries: [entry], policy: .after(future))
        
        completion(timeline)
    }
    
    typealias Entry = WordEntry
}

struct WidgetEntryView: View {
    //let entry: Provider.Entry
    let word: Word
    let date: Date
    let flag: String
    let language: SupportedLanguages

    var body: some View {
        let isMorse = language == .Morse
        let isNatlFlags = language == .NationalFlags
        GeometryReader { g in
            
            VStack(alignment: .leading, spacing: 0, content: {
                if (!isMorse && !isNatlFlags) {
                // Flag
                HStack {
                    Text(flag)
                        .font(.system(size: 40))
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                }
                // Words
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack {
                        Text(word.foreign)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .font(isMorse || isNatlFlags ? .system(size: 70) : .largeTitle)
                            .minimumScaleFactor(0.2)
                    }
                    HStack {
                        Text(word.native)
                            .fontWeight(.bold)
                            .font(isMorse ? .system(size: 50) : .system(.body))
                            .foregroundColor(.gray)
                    }
                })
                .padding(.trailing, 10)
                .padding(.horizontal, 10)
                Spacer ()
            })
            
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.black]),
                    startPoint: .top,
                    endPoint: .bottomLeading)
                    .opacity(0.90)
                    .shadow(radius: 10.0))
        }
    }
}

@main
struct DailyWidget: Widget {
    private let kind =  "DailyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: {
            entry in WidgetEntryView(word: entry.word, date: entry.date, flag: entry.flag, language: entry.language)
        }).supportedFamilies([.systemSmall])
    }
}

struct DailyWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView (word: Word(native: "Bye", foreign: "Arrivederci"), date: Date(), flag: "🇮🇹", language: .Italian)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        WidgetEntryView (word: Word(native: "v", foreign: "...-"), date: Date(), flag: "🤖", language: .Morse)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        WidgetEntryView (word: Word(native: "United States", foreign: "🇺🇸"), date: Date(), flag: "", language: .NationalFlags)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
