//
//  Profile.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct Profile: View {
    @State var nombreUsuario = "Lorem"
    @State var imagenPerfil: UIImage = UIImage(named: "profile")!
    
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
                    Image(uiImage: imagenPerfil).resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0, alignment: .center)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    
                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 32, trailing: 0))
                
                
                Text("Ajustes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                ModuloAjustes()
                Spacer()
            }
        }.onAppear(
            perform: {
                //Metodo de recuperacion de imagenes
                
                if returnUIImage(named: "profile") != nil {
                    imagenPerfil = returnUIImage(named: "profile")!
                } else {
                    print("No encontré foto de perfil guardad en el dispositivo")
                }
                
                print("Revisando si tengo datos de usuario en mis UserDefaults")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                } else {
                    print("No encontré informacion del usuario" )
                }
            }
        )
    }
    
    func returnUIImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        
        return nil
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
