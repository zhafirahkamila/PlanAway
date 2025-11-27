//
//  PasswordField.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct PasswordField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    @State private var isVisible = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            
            if isVisible {
                TextField(placeholder, text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none).font(.custom("Poppins-Regular", size: 14))
            } else {
                SecureField(placeholder, text: $text).font(.custom("Poppins-Regular", size: 14))
            }
            
            Button(action: {
                isVisible.toggle()
            }) {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color("cream"))
        .cornerRadius(15)
    }
}

#Preview {
    @State var test = ""
    
    PasswordField(icon: "lock", placeholder: "Password", text: $test)
}
