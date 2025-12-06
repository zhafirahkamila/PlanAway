//
//  ItineraryView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct ItineraryView: View {

    @StateObject private var vm = ItineraryViewModel()
    
    init(destination: String = "no destination") {
            let viewModel = ItineraryViewModel()
            viewModel.destination = destination
            _vm = StateObject(wrappedValue: viewModel)
        }

    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .top) {
                Color("background").ignoresSafeArea()
                
                Color("blue")
                    .clipShape(
                        RoundedCorners(
                            radius: geo.size.width * 0.08,
                            corners: [.bottomLeft, .bottomRight]
                        )
                    )
                    .ignoresSafeArea()
                    .frame(height: min(geo.size.height * 0.15, 420))
                    .shadow(
                        color: Color("blue").opacity(0.50),
                        radius: geo.size.width * 0.05,
                        x: 0,
                        y: geo.size.height * 0.015
                    )
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    ItineraryInputCard(
                        destination: $vm.destination,
                        startDate: $vm.startDate,
                        endDate: $vm.endDate,
                        budget: $vm.budget,
                        onGenerate: vm.generateItinerary,
                        isLoading: vm.isLoading
                    )
                    .padding(.horizontal, 25)
                    .padding(.top, 20)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            
                            if !vm.itinerary.isEmpty {
                                DaySelectorView(vm: vm)
                            }
                            
                            if !vm.itinerary.isEmpty {
                                if vm.showAllDays {
                                    ForEach(vm.itinerary) { day in
                                        ForEach(day.activities) { activity in
                                            ItineraryCard(day: day.day, activity: activity)
                                        }
                                    }
                                } else if let day = vm.selectedDay,
                                          let dayData = vm.itinerary.first(where: { $0.day == day }) {
                                    
                                    ForEach(dayData.activities) { activity in
                                        ItineraryCard(day: dayData.day, activity: activity)
                                    }
                                }
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 25)
                    }
                }.padding(.top, 20).padding(.bottom, 60)
            }
            .onChange(of: vm.startDate) { _ in vm.validateDates() }
            .onChange(of: vm.endDate) { _ in vm.validateDates() }
            .onAppear { vm.validateDates() }
        }
    }
}


#Preview {
    ItineraryView()
}
