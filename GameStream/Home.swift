//
//  Home.swift
//  GameStream
//
//  Created by Jackson Cuevas on 26/8/24.
//

import SwiftUI

struct Home: View {
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado) {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            
            PantallaHome()
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
        }.accentColor(.white)
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBar-color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray

        print("Iniciando las vistar de home")
    }
}

struct PantallaHome: View {
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()

            VStack {
                Text("Iniciando las vistar de home")
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
      
    }
}

#Preview {
    Home()
}
