//
//  Word.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/10/20.
//

import Foundation

struct Word: Identifiable, Codable {
    let native: String   // English (for now)
    let foreign: String  // Italian (etc..)
    
    var id: String { native }
}
