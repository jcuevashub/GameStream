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
            }
        }
    }
}

struct ModuloEditar: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    EditProfileView()
}
