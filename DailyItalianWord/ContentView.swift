//
//  ContentView.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("word", store: UserDefaults(suiteName: "group.com.joshspicer.DailyItalianWord"))
    
    var wordData: Data = Data()
    
    let Words = [
        Word(native: "library", foreign: "biblioteca"),
        Word(native: "cat", foreign: "gatto"),
        Word(native: "boat", foreign: "imbarcazione")
    ]
    
    
    var body: some View {
        VStack {
            WordView(word: Word(native: "blah", foreign: "bahaa"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
