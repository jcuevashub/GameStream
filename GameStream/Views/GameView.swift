//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        Text("Hola desde pantalla GamesView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer element del json:")
                    print("Titulo del primer videojuego del json")
                }
            )
    }
}

#Preview {
    GameView()
}
