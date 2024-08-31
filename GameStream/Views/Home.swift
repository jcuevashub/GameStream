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
            
            GameView()
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
                    
                    HStack {
                        Button(action: busqueda, label: {
                            Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))                .font(.title3)
                            
                        })
                        
                        ZStack(alignment: .leading) {
                            if textoBusqueda.isEmpty {
                                Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))                .font(.title3)
                                
                            }
                            
                            TextField("", text: $textoBusqueda).foregroundColor(.white)
                        }
                    }.padding([.top, .leading, .bottom], 11.0).background(Color("blue-gray")).clipShape(Capsule())
                    SubModuloHome()
                }.padding(.horizontal, 18)
            }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
    
    func busqueda() {
        print("buscando.. \(textoBusqueda)")
    }
}


struct SubModuloHome: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
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
                    Button(action: {print("Pulsé categoria de FPS")}, label: {
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
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("Abzu").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("Crash Bandicoot").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Image("DEATH STRANDING").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                }
            }
            
            
        }
    }
}
#Preview {
    Home()
}
