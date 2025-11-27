//
//  ProfileView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        NavigationStack {
                ZStack {
                    Color("background").ignoresSafeArea()
                        
                ScrollView {
                    VStack(spacing: 0) {
                        Text("Profile").font(.custom("Poppins-Medium", size: 20)).multilineTextAlignment(.center).padding(.bottom, 20).padding(.top, 15)
                                
                        Image("jerome").resizable().frame(width: 180, height: 220).scaledToFit().clipShape(.circle)
                                
                        NavigationLink(destination: ContentView()){
                            Text("Change").font(.custom("Poppins-Medium", size: 18)).multilineTextAlignment(.center).foregroundStyle(Color("blue"))
                        }
                            
                        VStack (alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Personal Info").font(.custom("Poppins-SemiBold", size: 18))
                                    
                                Spacer()
                                    
                                NavigationLink(destination: ContentView()) {
                                    Text("Edit").font(.custom("Poppins-Medium", size: 15)).foregroundStyle(Color("blue"))
                                }
                            }.padding(.horizontal, 25).padding(.top, 20).padding(.bottom, 20)
                                
                            //Username
                            HStack(spacing: 20) {
                                Image(systemName: "person").font(.system(size: 30))
                                        .foregroundColor(.black)
                                    
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Username").font(.custom("Poppins-Medium", size: 13)).foregroundStyle(Color("font"))
                                        
                                    Text("Jerome").font(.custom("Poppins-Medium", size: 14))
                                }
                                Spacer()
                            }.padding(.horizontal, 25).padding(.bottom, 20)
                                
                            //Email
                            HStack(spacing: 20) {
                                Image(systemName: "envelope").font(.system(size: 28)).foregroundColor(.black)
                                    
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Email").font(.custom("Poppins-Medium", size: 13)).foregroundStyle(Color("font"))
                                        
                                    Text("jeromepolin@gmail.com").font(.custom("Poppins-Medium", size: 14))
                                }
                                Spacer()
                            }.padding(.horizontal, 25).padding(.bottom, 20)
                                
                            //Role
                            HStack(spacing: 20) {
                                Image(systemName: "person.text.rectangle").font(.system(size: 28)).foregroundColor(.black)
                                    
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Role").font(.custom("Poppins-Medium", size: 13)).foregroundStyle(Color("font"))
                                        
                                    Text("User").font(.custom("Poppins-Medium", size: 14))
                                }
                                Spacer()
                            }.padding(.horizontal, 25).padding(.bottom, 20)
                        }.clipShape(RoundedRectangle(cornerRadius: 20)).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("blue"), lineWidth: 1)).padding(.top, 50)
                            
                        NavigationLink(destination: ContentView()) {
                            Text("Log Out").font(.custom("Poppins-SemiBold", size: 18)).multilineTextAlignment(.center).padding().frame(maxWidth: 355).background(Color("blue")).foregroundStyle(.white).cornerRadius(16)
                        }.padding(.top, 40).padding(.bottom, 100)
                            
                    }.padding(.horizontal, 25)/*.padding(.bottom, 100)*/
                }
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ProfileView()
}
