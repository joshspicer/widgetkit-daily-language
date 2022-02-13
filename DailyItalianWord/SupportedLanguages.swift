//
//  SupportedLanguages.swift
//  DailyItalianWord
//
//  Created by Josh Spicer on 10/19/20.
//

import Foundation

enum SupportedLanguages: String, Equatable, CaseIterable, Identifiable {
    var id: SupportedLanguages { self }
    
    case Italian
    case French
    case Japanese
    case Morse
}
