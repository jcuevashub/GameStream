//
//  GameView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var todosLosVideoJuegos = GameViewModel()
    
    @State var gameviewIsActive: Bool = false;
    @State var url: String = "";
    @State var titulo: String = "";
    @State var studio: String = "";
    @State var calificacion: String = "";
    @State var anoPublicacion: String = "";
    @State var descripcion: String = "";
    @State var tags: [String] = [""];
    @State var imgsUrl: String = "";
    
    let formaGrid = [GridItem(.flexible()), GridItem(.flexible())]

    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    LazyVGrid(columns: formaGrid,spacing: 8) {
                        
                        ForEach(todosLosVideoJuegos.gamesInfo, id: \.self) { juego in

                            
                            Button(action: {
                                
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                descripcion = juego.description
                       
                            }, label: {
                                Text(juego.title) // Usando el título del juego en el botón
                            })
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(
            perform: {
                print("Primer element del json: \(todosLosVideoJuegos.gamesInfo[0].contentRaiting)")
                
                print("Titulo del primer videojuego del json \(todosLosVideoJuegos.gamesInfo[0].title)")
            }
        )
    }
}

#Preview {
    GameView()
}
