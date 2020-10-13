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
}

struct Provider: TimelineProvider {
    
    @AppStorage("word", store: UserDefaults(suiteName: "group.com.joshspicer.DailyItalianWord"))
    var wordData: Data = Data()
    
    func placeholder(in context: Context) -> WordEntry {
        return WordEntry(date: Date(), word: Word(native: "placeholder", foreign: "placeholder"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WordEntry) -> Void) {
        
        let entry = WordEntry(date: Date(), word: Word(native: "getsnapshot", foreign: "getsnapshot"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WordEntry>) -> Void) {
        
        // Time of creation
        let now: Date = Date()
        
        // The earliest moment we'd be ok with the widget refreshing
        let calendar = Calendar.current
        let future = calendar.date(byAdding: .hour, value: 24, to: now)!
        
        QueryAPI.shared.getWord {
            response in
            
            // WordEntry(date: Date(), word: Word(native: "Bye", foreign: "Arrivederci"))
            let entry = WordEntry(date: now, word: response ?? Word(native: "oops", foreign: "oops"))
            
            let timeline = Timeline(entries: [entry], policy: .after(future))
            completion(timeline)
        }
    }
    
    typealias Entry = WordEntry
}

struct WidgetEntryView: View {
    //let entry: Provider.Entry
    let word: Word
    let date: Date
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0, content: {
            // Flags
            HStack {
                Text("🇮🇹")
                    .font(.system(size: 45))
                //                Text("->")
                //                    .font(.system(size: 20))
                //                Text("🇬🇧")
                //                    .font(.system(size: 45))
            }
            .padding(.leading, 10)
            .foregroundColor(.white)
            // Words
            WordView(word: word)
                .padding(.leading, 10)
            Spacer ()
            Spacer ()
            // Created Timer
            VStack(alignment: .trailing, spacing: nil, content: {
                Text("\(date, style: .relative) ago")
                    .font(.system(size: 8))
                    .foregroundColor(.white)
            })
            .padding(.bottom, 10)
            .padding(.leading, 10)
        })
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.black]),
                startPoint: .top,
                endPoint: .bottomLeading)
                .opacity(0.90)
                .shadow(radius: 10.0))
        
        
    }
    
}

@main
struct DailyWidget: Widget {
    private let kind =  "DailyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: {
            entry in WidgetEntryView(word: entry.word, date: entry.date)
        }).supportedFamilies([.systemSmall])
    }
}

struct DailyWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView (word: Word(native: "Bye", foreign: "Arrivederci"), date: Date())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
