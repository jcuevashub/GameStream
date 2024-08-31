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
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
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
            
        }
    }
}
