//
//  ContentView.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/10/20.
//

import SwiftUI
import WidgetKit


struct ContentView: View {
    
//    @AppStorage("word", store: UserDefaults(suiteName: "group.com.joshspicer.DailyItalianWord"))
    
    
    var body: some View {
        VStack {
            Button(action: {
                WidgetCenter.shared.reloadAllTimelines()
            }) {
                HStack {
                    Text("New Word!")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
