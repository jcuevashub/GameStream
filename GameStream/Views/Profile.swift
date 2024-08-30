//
//  Profile.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        Text("Hola desde pantalla Perfil")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer element del json:")
                    print("Titulo del primer videojuego del json")
                }
            )
    }
}

#Preview {
    Profile()
}
