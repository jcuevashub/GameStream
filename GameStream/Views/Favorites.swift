//
//  Favorites.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI
import AVKit

struct Favorites: View {
    
    @ObservedObject var todosLosVideoJuegos = GameViewModel()
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9.0)
                
                ScrollView{
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self) {
                         juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)
                            
                            Text("\(juego.title)")
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                    }
                    
                }.padding(.bottom, 8)
                
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Favorites()
}
