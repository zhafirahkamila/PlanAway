//
//  AuthViewModel.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/13/25.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class AuthViewModel : ObservableObject {
    @Published var currentUser: FirebaseAuth.User? = nil
    @Published var authError: String = ""
    @Published var isLoading = false
    
    @Published var didRegister = false
    
    init() {
        currentUser = Auth.auth().currentUser
    }
    
    // REGISTER
    func register(email: String, password: String) async {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.authError = error.localizedDescription
                } else {
                    self.currentUser = result?.user
                    self.didRegister = true
                }
            }
        }
    }
    
    // LOGIN
    func login(email: String, password: String){
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.authError = error.localizedDescription
                } else {
                    self.currentUser = result?.user
                }
            }
        }
    }
    
    // LOGOUT
    func logout() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
        } catch {
            authError = error.localizedDescription
        }
    }
}
