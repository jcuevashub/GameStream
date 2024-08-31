//
//  GameViewModel.swift
//  GameStream
//
//  Created by Jackson Cuevas on 30/8/24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init() {
        guard let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games") else {
            print("URL inválida")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                if let jsonData = data {
                    print("tamaño del json \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            } catch {
                print("Error: \(error)")
            }
            
        }.resume()
    }
}
