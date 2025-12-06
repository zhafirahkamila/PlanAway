//
//  DaySelectorView.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/6/25.
//

import SwiftUI

struct DaySelectorView: View {

    @ObservedObject var vm: ItineraryViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {

                ForEach(vm.itinerary) { day in
                    Button {
                        vm.showAllDays = false
                        vm.selectedDay = day.day
                    } label: {
                        Text("Day \(day.day)")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(vm.selectedDay == day.day && !vm.showAllDays
                                        ? Color("blue") : Color.clear)
                            .foregroundColor(vm.selectedDay == day.day ? .white : .black)
                            .cornerRadius(20)
                            .font(.custom("Poppins-SemiBold", size: 12))
                    }
                }

                Button {
                    vm.showAllDays = true
                    vm.selectedDay = nil
                } label: {
                    Text("See All Days")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(vm.showAllDays ? Color("blue")
                                                   : Color.clear)
                        .foregroundColor(vm.showAllDays ? .white : .black)
                        .cornerRadius(20)
                        .font(.custom("Poppins-SemiBold", size: 12))
                }
            }
        }
    }
}
