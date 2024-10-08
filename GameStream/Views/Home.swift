//
//  Home.swift
//  GameStream
//
//  Created by Jackson Cuevas on 26/8/24.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado) {
            Profile()
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            PantallaHome()
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Favorites()
                .font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
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
    @State var textoBusqueda = ""
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 11.0)
                    SubModuloHome()
                }.padding(.horizontal, 18)
            }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
    
}


struct SubModuloHome: View {
    @State var isGameInfoEmpty = false
    @State var textoBusqueda = ""
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var gameviewIsActive: Bool = false;
    @State var url: String = "";
    @State var titulo: String = "";
    @State var studio: String = "";
    @State var calificacion: String = "";
    @State var anoPublicacion: String = "";
    @State var descripcion: String = "";
    @State var tags: [String] = [""];
    @State var imgsUrl: [String] = [""];
    

    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    watchGame(name: textoBusqueda)
                }, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))                .font(.title3)
                    
                }).alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                }
                
                ZStack(alignment: .leading) {
                    if textoBusqueda.isEmpty {
                        Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))                .font(.title3)
                        
                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                }
            }.padding([.top, .leading, .bottom], 11.0).background(Color("blue-gray")).clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                   watchGame(name: "The Witcher 3")
                }, label: {
                    VStack(spacing: 0) {
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("blue-gray")).font(.title3)
                    }
                })
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
            }.frame(minWidth: 0,    maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
             
            
            Text("CATEGORÍA SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(action: {isGameViewActive = true}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                            
                        }
                    })
                    
                    Button(action: {print("Pulsé categoria de RPG")}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                            
                        }
                    })
                    
                    Button(action: {print("Pulsé categoria de OpenWorld")}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                            
                        }
                    })
                }
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    Button(action: {
                        watchGame(name: "Abzu")
                    }, label: {
                        Image("Abzu").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(name: "Crash Bandicoot")
                    }, label: {
                        Image("Crash Bandicoot").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(name: "DEATH STRANDING")
                    }, label: {
                        Image("DEATH STRANDING").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                }
            }
        }
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
    }
    
    func watchGame(name: String) {
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            } else {
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true

            }
        }
    }

}


#Preview {
    Home()
}
