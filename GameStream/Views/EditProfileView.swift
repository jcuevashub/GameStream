//
//  EditProfileView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 8/9/24.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack {
                            Image("profile").resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118.0, height: 118.0, alignment: .center)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    })
                }.padding(.bottom, 18.0)
                
                ModuloEditar()
            }
        }
    }
}

struct ModuloEditar: View {
    
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var nombre: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Correo electrónico").foregroundColor(Color("dark-cian"))
            
            ZStack(alignment: .leading) {
                if correo.isEmpty {
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                TextField("",text: $correo)
            }
            
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
            
            Text("Contrasena").foregroundColor(.white)

            
            ZStack(alignment: .leading) {
                if contrasena.isEmpty {
                    Text("Introduce tu contrasena")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                SecureField("",text: $correo).foregroundColor(.white)
            }
            
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
            
            Text("Nombre").foregroundColor(.white)

            
            ZStack(alignment: .leading) {
                if nombre.isEmpty {
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                }
                
                TextField("",text: $correo).foregroundColor(.white)
            }
            
            
            Divider()
                .frame(height: 1.0)
                .background(Color("dark-cian"))
                .padding(.bottom, 32)
            
            Button(action: actualizarDatos, label: {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("dark-cian")
                                ,lineWidth: 1.0)
                            .shadow(color: .white, radius: 6))
            })
            
        }.padding(.horizontal, 42.0)
    }
    
    func actualizarDatos() {
        print("Guardando y recuperando datos del usuario")
    }
}

#Preview {
    EditProfileView()
}
