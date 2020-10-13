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
            HStack {
                
                Text("🇮🇹")
                Text(word.foreign)
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .minimumScaleFactor(0.001)
                    .lineLimit(1)
                
            }
            HStack {
                Text("🇬🇧")
                Text(word.native)
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
            }
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: Word(native: "English", foreign: "Italian"))
    }
}
