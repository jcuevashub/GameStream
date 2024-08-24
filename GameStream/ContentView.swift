//
//  ContentView.swift
//  GameStream
//
//  Created by Jackson Cuevas on 22/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                InicioYRegistroView()
            }
        }
    }
}


struct InicioYRegistroView: View {
    @State var tipoInicioSesion = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla inicio sesion")
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla inicio sesion")
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroView()
            }
        }
    }
}

func iniciarSesion() {
    print("Estoy iniciando sesión")
}

func registrate() {
    print("Te registraste")
}

struct InicioSesionView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico").foregroundColor(Color("dark-cian"))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing).foregroundColor(Color("dark-cian"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("dark-cian")
                                    ,lineWidth: 1.0)
                                .shadow(color: .white, radius: 6))
                })
            }.padding(.horizontal, 77.0)
        }
        
    }
}

func tomarFoto() {
    
}

struct RegistroView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                
                Button(action: tomarFoto, label: {
                    ZStack {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                }).padding()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Correo Electrónico*").foregroundColor(Color("dark-cian"))
                        
                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            
                            TextField("", text: $email)
                        }
                        
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                        
                        Text("Contraseña").foregroundColor(.white)
                        
                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $password)
                        }
                        
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                        
                        Text("Confirmar contraseña").foregroundColor(.white)
                        
                        ZStack(alignment: .leading) {
                            if email.isEmpty {
                                Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $confirmPassword)
                        }.padding(.bottom)
                        Text("Olvidaste tu contraseña?")
                            .font(.footnote)
                            .frame(width: 300, alignment: .trailing).foregroundColor(Color("dark-cian"))
                            .padding(.bottom)
                    }
                    
                    Button(action: iniciarSesion, label: {
                        Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("dark-cian")
                                        ,lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                    }).padding(.bottom)
                    
                    Text("Iniciar sesión con redes sociales").frame(maxWidth: .infinity, alignment: .center).foregroundColor(.white)
                    
                    HStack {
                        Button(action: {print("Inicio de sesión con Twitter")}, label: {
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color(.systemBlue))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }).padding()
                        
                        Button(action: {print("Inicio de sesión con Twitter")}, label: {
                            Text("Twitter")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color(.systemBlue))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }).padding()
                    }
                }.padding(.horizontal, 77.0)
            }
        }
    }
}
#Preview {
    ContentView()
}
