//
//  SearchGame.swift
//  GameStream
//
//  Created by Jackson Cuevas on 7/9/24.
//

import Foundation

class SearchGame: ObservableObject {
    @Published var gameInfo = [Game]()
    
    func search(gameName: String) {
        
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        guard let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")") else {
            print("URL inválida")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                if let jsonData = data {
                    
                    let decodeData = try
                    JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            } catch {
                print("Error: \(error)")
            }
            
        }.resume()
    }
}
