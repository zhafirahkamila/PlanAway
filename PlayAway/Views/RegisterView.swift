//
//  RegisterView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @State private var goToLogin = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("background").ignoresSafeArea()

                VStack(spacing: 85) {
                    
                    // HEADER
                    VStack(spacing: 10){
                        Text("Create Your Account")
                            .font(.custom("Poppins-SemiBold", size: 22))
                            .foregroundColor(.black)

                        Text("Start building your travel bucket list and get your dream itineraries")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 30)

                    // INPUTS
                    VStack(spacing: 16){
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocapitalization(.none)
                                .font(.custom("Poppins-Regular", size: 14))
                        }
                        .padding()
                        .background(Color("cream"))
                        .cornerRadius(15)

                        PasswordField(icon: "lock", placeholder: "Password", text: $password)

                        PasswordField(icon: "lock", placeholder: "Confirm password", text: $confirmPassword)
                    }

                    // BUTTONS
                    VStack(spacing: 15) {
                        
                        // CREATE ACCOUNT BUTTON → Register + redirect
                        Button {
                            Task {
                                guard password == confirmPassword else {
                                    authVM.authError = "Passwords do not match"
                                    return
                                }

                                await authVM.register(email: email, password: password)

                                if authVM.didRegister {
                                    goToLogin = true
                                }
                            }
                        } label: {
                            Text("Create Account")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                        }

                        // Already have account?
                        HStack {
                            Text("Already have an account?")
                                .font(.custom("Poppins-Regular", size: 12))
                                .foregroundColor(.black)

                            NavigationLink(destination: LoginView()) {
                                Text("Sign In Here")
                                    .font(.custom("Poppins-SemiBold", size: 12))
                            }
                        }
                    }
                }
                .padding(.horizontal, 25)
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden()
            
            // 🔥 Redirect otomatis setelah register sukses
            .navigationDestination(isPresented: $goToLogin) {
                LoginView()
                    .environmentObject(authVM)
            }
        }
    }
}

#Preview {
    RegisterView().environmentObject(AuthViewModel())
}
