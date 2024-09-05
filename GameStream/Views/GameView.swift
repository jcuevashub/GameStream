//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 4/9/24.
//

import SwiftUI
import AVKit

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
                video(url: url).frame(height: 300)
                ScrollView {
                    videoInfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags)
                }.frame(maxWidth: .infinity)
            }
        }
        
    }
}

struct video: View {
    var url: String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo: View {
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
            
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id: \.self) {
                    tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 5)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    GameView(url: "ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis", tags: ["",""], imgsUrl: ["",""])
}
