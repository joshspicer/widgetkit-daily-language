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
        VStack(alignment: .leading, spacing: nil, content: {
            HStack {
                Text(word.foreign)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.leading)
                    .scaledToFit()
            }
            HStack {
                Text(word.native)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        })
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: Word(native: "English", foreign: "Italian"))
    }
}
