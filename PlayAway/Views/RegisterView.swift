//
//  RegisterView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("background").ignoresSafeArea()
                
                VStack(spacing: 85) {
                    VStack(spacing: 10){
                        Text("Create Your Account").font(.custom("Poppins-SemiBold", size: 22)).foregroundColor(.black)
                        
                        Text("Start building your travel bucket list and get your dream itineraries").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.black).multilineTextAlignment(.center)
                    }.padding(.horizontal, 30)
                    
                    VStack(spacing: 16){
                        HStack {
                            Image(systemName: "person").foregroundColor(.gray)
                            TextField("Email", text: $email).textFieldStyle(PlainTextFieldStyle()).autocapitalization(.none).font(.custom("Poppins-Regular", size: 14))
                        }.padding().background(Color("cream")).cornerRadius(15)
                        
                        PasswordField(icon: "lock", placeholder: "Password", text: $password)
                        
                        PasswordField(icon: "lock", placeholder: "Confirm password", text: $confirmPassword)
                    }
                    VStack(spacing: 15) {
                        NavigationLink(destination: LoginView()) {
                            Text("Create Account").font(.custom("Poppins-Regular", size: 14)).foregroundColor(Color.white).frame(maxWidth:.infinity).padding().background(Color.blue).cornerRadius(15)
                        }
                                            
                        HStack{
                            Text("Already have an account?").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.black)
                                                
                            NavigationLink(destination: LoginView()) {
                                Text("Sign In Here").font(.custom("Poppins-SemiBold", size: 12))
                            }
                        }
                    }
                                        
                }
                .padding(.horizontal, 25).navigationBarBackButtonHidden(true)
            }.navigationBarBackButtonHidden()
        }
    }
}


#Preview {
    RegisterView()
}
