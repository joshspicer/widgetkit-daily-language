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
        
        // This is where u need to set `date:` to change every day!
        
        let now: Date = Date()
        
        let calendar = Calendar.current
        let future = calendar.date(byAdding: .minute, value: 20, to: now)!
        
        QueryAPI.shared.getWord {
            response in
            
            let entry = WordEntry(date: now, word: response ?? Word(native: "oops", foreign: "oops"))
            // let entry2 = WordEntry(date: Date(), word: Word(native: "bye", foreign: "arrividerci"))
                    
            let timeline = Timeline(entries: [entry], policy: .after(future))
            completion(timeline)
        }
    }
    
    typealias Entry = WordEntry
}
    
struct WidgetEntryView: View {
    let entry: Provider.Entry
    
    var body: some View {
        VStack {
            WordView(word: entry.word)
            Text("\(entry.date, style: .relative) ago")
                           .font(.caption)
                           .foregroundColor(.purple)
        }
    }
}

@main
struct DailyWidget: Widget {
    private let kind =  "DailyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: {
            entry in WidgetEntryView(entry: entry)
        }).supportedFamilies([.systemSmall])
    }
    
}
    
