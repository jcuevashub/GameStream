//
//  Profile.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct Profile: View {
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack {
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                
                VStack{
                    Image("profile").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0, alignment: .center)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                
                ModuloAjustes()
                
            }
        }
    }
}

struct ModuloAjustes: View {
    var body: some View {
      Text("Hola")
    }
}

#Preview {
    Profile()
}
