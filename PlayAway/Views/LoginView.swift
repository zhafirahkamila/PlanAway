//
//  LoginView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background").ignoresSafeArea()
                
                VStack (spacing: 85) {
                    VStack(spacing: 10){
                        Text("Welcome Back").font(.custom("Poppins-SemiBold", size: 22)).foregroundColor(.black)
                        
                        Text("Continue exploring destinations and crafting your next adventure").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.black).multilineTextAlignment(.center)
                    }.padding(.horizontal, 30)
                    
                    VStack(spacing: 16){
                        HStack {
                            Image(systemName: "person").foregroundColor(.gray)
                            TextField("Email", text: $email).textFieldStyle(PlainTextFieldStyle()).autocapitalization(.none).font(.custom("Poppins-Regular", size: 14))
                        }.padding().background(Color("cream")).cornerRadius(15)
                        
                        PasswordField(icon: "lock", placeholder: "Password", text: $password)
                    }
                    VStack(spacing: 15) {
                        NavigationLink(destination: MainTabView()){
                            Text("Sign In").font(.custom("Poppins-Regular", size: 14)).foregroundColor(Color.white).frame(maxWidth:.infinity).padding().background(Color.blue).cornerRadius(15)
                        }
                        
                        HStack{
                            Text("Don't have an account?").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.black)
                            
                            NavigationLink(destination: RegisterView()) {
                                Text("Create Account").font(.custom("Poppins-SemiBold", size: 12))
                            }
                        }
                    }
                }.padding(.horizontal, 25).navigationBarBackButtonHidden(true)
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginView()
}
