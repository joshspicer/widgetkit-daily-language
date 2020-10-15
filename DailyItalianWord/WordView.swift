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


    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: Word(native: "English", foreign: "Italian"))
    }
}
