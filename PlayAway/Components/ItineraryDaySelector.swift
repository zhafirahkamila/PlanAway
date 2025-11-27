//
//  ItineraryCardSelector.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import SwiftUI

struct ItineraryDaySelector: View {
    @Binding var selectedDay: Int
    let totalDays: [Int]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(totalDays, id: \.self) { day in
                    Button {
                        selectedDay = day
                    } label: {
                        Text("Day \(day)")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedDay == day ? Color.blue : Color.clear)
                            .foregroundColor(selectedDay == day ? Color.white : Color.gray)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}
