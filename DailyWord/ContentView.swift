//
//  ContentView.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/10/20.
//

import SwiftUI
import WidgetKit


struct ContentView: View {
    
    @State private var selection = SupportedLanguages.Italian
    
    @AppStorage("language", store: UserDefaults(suiteName: "group.com.joshspicer.dailyword"))
    var language: SupportedLanguages = SupportedLanguages.Italian
    
    var body: some View {
        
        VStack {
            Text("Daily Word")
                .font(.largeTitle)
                .padding()
            Text("Language: \(language.rawValue)")
                .font(.subheadline)
            
            Picker(selection: $selection, label: Text("Choose Language"), content: /*@START_MENU_TOKEN@*/{
                
                ForEach(SupportedLanguages.allCases) { lang in
                    Text(lang.rawValue)
                }
            }/*@END_MENU_TOKEN@*/)
            .onChange(of: $selection.wrappedValue, perform: { value in
                language = selection
                WidgetCenter.shared.reloadAllTimelines()
                print("updated language var!")
            })
            
            Button(action: {
                WidgetCenter.shared.reloadAllTimelines()
                print("clicked update button")
            }) {
                HStack {
                    Text("Refresh Word")
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
