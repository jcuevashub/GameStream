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
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                
                VStack{
                    Image("profile").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0, alignment: .center)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 32, trailing: 0))
                
                
                Text("Ajustes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                ModuloAjustes()
                Spacer()
            }
        }
    }
}

struct ModuloAjustes: View {
    @State var areNotificationesEnabled = false
    @State var isEditProfileViewActive = false

    var body: some View {
        VStack(spacing: 3){
            SettingButton(label: "Cuenta", rightModifier: Text(">").foregroundColor(.white), action: {})
            SettingButton(label: "Notificaciones", rightModifier: Toggle("", isOn: $areNotificationesEnabled ), action: {})
            SettingButton(label: "Editar perfil", rightModifier: Text(">").foregroundColor(.white), action: {isEditProfileViewActive = true})
            SettingButton(label: "Califica esta aplicación", rightModifier: Text(">").foregroundColor(.white), action: {})
        }
        
        NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive, label: {
            EmptyView()
        })
    }
}

struct SettingButton<Content: View>: View {
    var label: String
    var rightModifier: Content?
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            HStack{
                Text(label)
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
                rightModifier
            }.padding()
        })
        .frame(width: .infinity, height: 60, alignment: .leading)
        .background(Color("blue-gray"))
        .clipShape(RoundedRectangle(cornerRadius: 1))
        
    }
}

#Preview {
    Profile()
}
