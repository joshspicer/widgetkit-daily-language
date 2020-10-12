//
//  QueryAPI.swift
//  DailyItalianWord
//
//  Created by Joshua Spicer on 10/12/20.
//
//

import Foundation
import Combine


public class QueryAPI : ObservableObject {
    
    var cancellable : Set<AnyCancellable> = Set()
    static let shared = QueryAPI()
    
    func getWord(completion: @escaping (Word?) -> Void) {
        
        let endpoint = Secrets.URI
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
              print("error with api request")
              print(error!)
              return
            }
            
            var word: Word
            do {
                let decoder = JSONDecoder()
                word = try decoder.decode(Word.self, from: data!)
            } catch {
                print("unable to unwrap api response")
                word = Word(native: "ERROR", foreign: "ERROR")
            }
            
            // We were successful
            completion(word)
        }
        task.resume()
    }
}


