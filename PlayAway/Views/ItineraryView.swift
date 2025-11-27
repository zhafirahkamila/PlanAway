//
//  ItineraryView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct ItineraryView: View {

    @State private var destination = "Kuta Beach"
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var budget = "900000"

    @State private var itinerary: [DayPlan] = []
    @State private var selectedDay: Int? = 1
    @State private var showAllDays: Bool = false

    @State private var jsonResult = "{}"
    @State private var isLoading = false

    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ItineraryInputCard(
                        destination: $destination,
                        startDate: $startDate,
                        endDate: $endDate,
                        budget: $budget,
                        onGenerate: generateItinerary,
                        isLoading: isLoading
                    )

                    if !itinerary.isEmpty {
                        daySelectorSection
                    }

                    if !itinerary.isEmpty {
                        if showAllDays {
                            ForEach(itinerary) { day in
                                ItineraryCard(dayPlan: day)
                            }
                        } else if let day = selectedDay,
                                  let dayData = itinerary.first(where: { $0.day == day }) {

                            ItineraryCard(dayPlan: dayData)
                        }
                    }
                }
                .padding(.horizontal, 25).padding(.top, 20)
            }
        }.navigationBarBackButtonHidden()
        .onChange(of: startDate) { _ in validateDates() }
        .onChange(of: endDate) { _ in validateDates() }
        .onAppear { validateDates() }
    }

    var daySelectorSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {

                ForEach(itinerary) { day in
                    Button {
                        showAllDays = false
                        selectedDay = day.day
                    } label: {
                        Text("Day \(day.day)")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedDay == day.day && !showAllDays ? Color.blue.opacity(0.8) : Color.gray.opacity(0.15))
                            .foregroundColor(selectedDay == day.day ? .white : .black)
                            .cornerRadius(10)
                    }
                }
                Button {
                    showAllDays = true
                    selectedDay = nil
                } label: {
                    Text("Lihat Semua")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(showAllDays ? Color.blue.opacity(0.8) : Color.gray.opacity(0.15))
                        .foregroundColor(showAllDays ? .white : .black)
                        .cornerRadius(10)
                }
            }
        }
    }

    func validateDates() {
        if endDate < startDate {
            endDate = startDate
        }
    }

    func generateItinerary() {
        isLoading = true
        selectedDay = 1
        showAllDays = false
        itinerary = []

        Task {
            let days = max(1, Calendar.current.dateComponents([.day], from: startDate, to: endDate).day! + 1)

            // Hitung budget harian
            let totalBudget = Int(budget) ?? 0
            let perDayBudget = totalBudget / days

            let prompt = """
            Kamu adalah travel planner AI.

            Buat itinerary ringkas **tanpa paragraf panjang**.
            Bagi budget **rata** untuk \(days) hari: \(perDayBudget) IDR/hari.

            Format WAJIB JSON:
            {
              "itinerary": [
                {
                  "day": 1,
                  "activities": [
                    { "location": "Pantai Kuta", "budget": 150000 }
                  ]
                }
              ]
            }

            Destination: \(destination)
            Total days: \(days)
            Budget per day: \(perDayBudget)
            """

            do {
                let response = try await GroqService.generateItinerary(prompt: prompt)

                await MainActor.run {
                    self.itinerary = response.itinerary
                    self.selectedDay = response.itinerary.first?.day
                    self.jsonResult = (try? encodeJSON(response)) ?? "{}"
                }

            } catch {
                await MainActor.run {
                    jsonResult = "{ \"error\": \"\(error.localizedDescription)\" }"
                }
            }

            isLoading = false
        }
    }

    func encodeJSON<T: Encodable>(_ value: T) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(value)
        return String(data: data, encoding: .utf8) ?? "{}"
    }
}

#Preview {
    ItineraryView()
}
