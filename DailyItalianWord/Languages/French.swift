//
//  French.swift
//  DailyItalianWord
//
//  Created by Josh Spicer on 10/19/20.
//

import Foundation

class French : LanguageBase {
    
    let words: [Word] = [
        Word(native: "first", foreign: "first!"),
        Word(native: "second", foreign: "second!")
    ]
    
    func getRandom() -> Word {
        let number = Int.random(in: 0..<words.count)
        return words[number]
    }

    func getAll() -> [Word] {
        return words
    }
    
    func getFlag() -> String {
        return "🇫🇷"
    }    
}
