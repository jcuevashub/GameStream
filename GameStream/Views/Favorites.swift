//
//  Favorites.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        Text("Hola desde pantalla Favoritos")
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
    Favorites()
}
