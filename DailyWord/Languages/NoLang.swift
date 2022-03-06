//
//  NoLang.swift
//  DailyItalianWord
//
//  Created by Josh Spicer on 10/19/20.
//

import Foundation

class NoLang : LanguageBase {
    
    let words: [Word] = [Word(native: "Err", foreign: "Err")]
    
    func getRandom() -> Word {
        let number = Int.random(in: 0..<words.count)
        return words[number]
    }
    
    func getAll() -> [Word] {
        return words
    }
    
    func getFlag() -> String {
        return "⚠️"
    }
}
