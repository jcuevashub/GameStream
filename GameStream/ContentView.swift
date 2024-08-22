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
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                InicioYRegistroView()
            }
        }
    }
}


struct InicioYRegistroView: View {
    var body: some View {
        VStack {
            HStack {
                Text("INICIA SESION")
                Text("REGÍSTRATE")
            }
        }
    }
}

#Preview {
    ContentView()
}
