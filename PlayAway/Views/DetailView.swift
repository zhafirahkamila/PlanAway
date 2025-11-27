//
//  DetailView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct DetailView: View {
    let data: Destination
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    
                    ZStack(alignment: .topTrailing) {
                        Image(data.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 350)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.3)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            )
                        
                        // Wish Button
                        Circle()
                            .fill(Color.white)
                            .frame(width: 42, height: 42)
                            .shadow(radius: 3)
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                            )
                            .padding([.top, .trailing], 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(data.name)
                            .font(.custom("Poppins-SemiBold", size: 26))
                        
                        HStack(spacing: 4) {
                            ForEach(0..<5) { i in
                                Image(systemName: i < Int(data.rating) ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 14))
                            }
                            
                            Text(String(format: "%.1f", data.rating))
                                .font(.custom("Poppins-Bold", size: 12))
                        }
                    }
                    
                    Text(data.location)
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(.gray)
                    
                    Text(data.description)
                        .font(.custom("Poppins-Regular", size: 14))
                        .lineLimit(isExpanded ? nil : 4)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isExpanded.toggle()
                        }
                    }) {
                        Text(isExpanded ? "Read less" : "Read more")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 24)
            }
            
            VStack {
                Spacer()
                
                Button(action: {}) {
                    Text("Add to Bucket List")
                        .font(.custom("Poppins-Medium", size: 16))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
        }/*.navigationBarBackButtonHidden()*/
    }
}

#Preview {
    DetailView(
        data: Destination(
            name: "Kuta Beach",
            location: "Bali, Indonesia",
            rating: 4.8,
            image: "kuta",
            description: "Kuta Beach is one of Bali’s most iconic coastlines, known for its soft sand, steady waves, and beautiful sunsets. The lively area around it offers cafés, shops, and entertainment, making it a perfect spot for both relaxation and adventure."
        )
    )
}
