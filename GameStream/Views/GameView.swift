//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var todosLosVideoJuegos = GameViewModel()

    
    var body: some View {
        Text("Hola desde pantalla GamesView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer element del json: \(todosLosVideoJuegos.gamesInfo)")
                    
                    print("Titulo del primer videojuego del json \(todosLosVideoJuegos.gamesInfo)")
                }
            )
    }
}

#Preview {
    GameView()
}
