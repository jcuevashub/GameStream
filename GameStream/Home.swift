//
//  Home.swift
//  GameStream
//
//  Created by Jackson Cuevas on 26/8/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }
            Text("Pantalla Home").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }
        }
    }
}

#Preview {
    Home()
}
