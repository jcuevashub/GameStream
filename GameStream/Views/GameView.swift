//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 4/9/24.
//

import SwiftUI
import AVKit
import Kingfisher

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
                    
                    Gallery(imgsUrl: imgsUrl)
                    Comments()
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

struct Gallery: View {
    var imgsUrl: [String]
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: formaGrid, spacing: 8) {
                    ForEach(imgsUrl, id: \.self){
                        imgUrl in
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Comments: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("COMENTARIOS").foregroundColor(.white).font(.title).padding(.leading)
            
            VStack {
                HStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                    
                    VStack {
                        Text("Enrique Ramos").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading)
                        
                        Text("Hace 7 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)

                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.top, 10)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(maxWidth: 340, alignment: .leading).padding(.bottom, 15)
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color("blue-gray")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
        }
        VStack {
            HStack {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                
                VStack {
                    Text("Enrique Ramos").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading)
                    
                    Text("Hace 7 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)

                }
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.top, 10)
            
            Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(maxWidth: 340, alignment: .leading).padding(.bottom, 15)
            
        }.frame(maxWidth: .infinity, alignment: .leading).background(Color("blue-gray")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
    }
}

#Preview {
    GameView(url: "ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis", tags: ["",""], imgsUrl: ["",""])
}
