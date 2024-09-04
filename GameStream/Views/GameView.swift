//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 4/9/24.
//

import SwiftUI

struct GameView: View {
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var imgsUrl: [String]
    
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
   
    }
}

#Preview {
    GameView(url: "ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis", tags: ["",""], imgsUrl: ["",""])
}
