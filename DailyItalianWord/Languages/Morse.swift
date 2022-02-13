//
//  Morse.swift
//  DailyItalianWord
//
//  Created by Josh Spicer on 02/13/2022
//

import Foundation

class French : LanguageBase {
    
    let words: [Word] = [
        Word(native: "A", foreign:  ".-"),
        Word(native: "B", foreign:  "-..."),
        Word(native: "C", foreign:  "-.-."),
        Word(native: "D", foreign:  "-.."),
        Word(native: "E", foreign:  "."),
        Word(native: "F", foreign:  "..-."),
        Word(native: "G", foreign:  "--."),
        Word(native: "H", foreign:  "...."),
        Word(native: "I", foreign:  ".."),
        Word(native: "J", foreign:  ".---"),
        Word(native: "K", foreign:  "-.-"),
        Word(native: "L", foreign:  ".-.."),
        Word(native: "M", foreign:  "--"),
        Word(native: "N", foreign:  "-."),
        Word(native: "O", foreign:  "---"),
        Word(native: "P", foreign:  ".--."),
        Word(native: "Q", foreign:  "--.-"),
        Word(native: "R", foreign:  ".-."),
        Word(native: "S", foreign:  "..."),
        Word(native: "T", foreign:  "-"),
        Word(native: "U", foreign:  "..-"),
        Word(native: "V", foreign:  "...-"),
        Word(native: "W", foreign:  ".--"),
        Word(native: "X", foreign:  "-..-"),
        Word(native: "Y", foreign:  "-.--"),
        Word(native: "Z", foreign:  "--.."),
        Word(native: "1", foreign:  ".----"),
        Word(native: "2", foreign:  "..---"),
        Word(native: "3", foreign:  "...--"),
        Word(native: "4", foreign:  "....-"),
        Word(native: "5", foreign:  "....."),
        Word(native: "6", foreign:  "-...."),
        Word(native: "7", foreign:  "--..."),
        Word(native: "8", foreign:  "---.."),
        Word(native: "9", foreign:  "----."),
        Word(native: "0", foreign:  "-----")
    ]
    
    func getRandom() -> Word {
        let number = Int.random(in: 0..<words.count)
        return words[number]
    }

    func getAll() -> [Word] {
        return words
    }
    
    func getFlag() -> String {
        return "🖥️"
    }
}
