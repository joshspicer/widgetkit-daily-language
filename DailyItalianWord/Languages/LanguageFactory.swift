//
//  LanaguageFactory.swift
//  DailyItalianWord
//
//  Created by Josh Spicer on 10/19/20.
//

import Foundation

protocol LanguageBase {
    func getAll() -> [Word]
    func getRandom() -> Word
    func getFlag() -> String
}

class LanguageFactory {
    
    public static func Create(lang: SupportedLanguages) -> LanguageBase {
        switch lang {
        case .Italian:
            return Italian()
        case .French:
            return French()
        case .Japanese:
            return Japanese()
        case .Morse:
            return Morse()
        default:
            return NoLang()
        
        }
    }
}
