//
//  WordView.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/10/20.
//

import Foundation
import SwiftUI

struct WordView: View {
    
    let word: Word
    
    var body: some View {
        VStack {
            Text(word.foreign)
                .foregroundColor(.red)
            Text(word.native)
                .foregroundColor(.green)

            }
    }
}
