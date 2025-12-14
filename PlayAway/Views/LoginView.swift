//
//  LoginView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var goToMain = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("background").ignoresSafeArea()

                VStack(spacing: 85) {

                    // HEADER
                    VStack(spacing: 10) {
                        Text("Welcome Back")
                            .font(.custom("Poppins-SemiBold", size: 22))
                            .foregroundColor(.black)

                        Text("Continue exploring destinations and crafting your next adventure")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 30)

                    // INPUT FIELDS
                    VStack(spacing: 16) {
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
                    }

                    // BUTTONS
                    VStack(spacing: 15) {

                        // SIGN IN BUTTON (Login + redirect)
                        Button {
                            Task {
                                await authVM.login(email: email, password: password)

                                if authVM.currentUser != nil {
                                    goToMain = true
                                }
                            }
                        } label: {
                            Text("Sign In")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                        }

                        // ERROR MESSAGE (if any)
                        if !authVM.authError.isEmpty {
                            Text(authVM.authError)
                                .foregroundColor(.red)
                                .font(.custom("Poppins-Regular", size: 12))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }

                        // NAVIGATE TO REGISTER
                        HStack {
                            Text("Don't have an account?")
                                .font(.custom("Poppins-Regular", size: 12))
                                .foregroundColor(.black)

                            NavigationLink(destination: RegisterView()) {
                                Text("Create Account")
                                    .font(.custom("Poppins-SemiBold", size: 12))
                            }
                        }
                    }
                }
                .padding(.horizontal, 25)
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden()
            
            // 🔥 Redirect otomatis ke MainTabView saat login sukses
            .navigationDestination(isPresented: $goToMain) {
                MainTabView()
                    .environmentObject(authVM)
            }
        }
    }
}

#Preview {
    LoginView().environmentObject(AuthViewModel())
}
