//
//  ItineraryViewModel.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/6/25.
//

import SwiftUI
import Combine

@MainActor
class ItineraryViewModel: ObservableObject {

    @Published var destination: String = "no destination"
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var budget: String = "-"

    @Published var itinerary: [DayPlan] = []
    @Published var selectedDay: Int? = 1
    @Published var showAllDays = false

    @Published var jsonResult = "{}"
    @Published var isLoading = false

    // VALIDATE DATES
    func validateDates() {
        if endDate < startDate {
            endDate = startDate
        }
    }

    // GENERATE ITINERARY (AI LOGIC)
    func generateItinerary() {
        isLoading = true
        selectedDay = 1
        showAllDays = false
        itinerary = []

        Task {
            let days = max(1, Calendar.current.dateComponents([.day], from: startDate, to: endDate).day! + 1)

            let totalBudget = Int(budget) ?? 0
            let perDayBudget = totalBudget / days

            let prompt = """
            You are an AI travel planner.

            Create a concise itinerary without long paragraphs.
            Distribute the budget evenly for \(days) days: \(perDayBudget) IDR/day.

            Required JSON format:
            {
              "itinerary": [
                {
                  "day": 1,
                  "activities": [
                    { "location": "Kuta Beach", "budget": 150000 }
                  ]
                }
              ]
            }

            Destination: \(destination)
            Total days: \(days)
            Per-day budget: \(perDayBudget)
            """

            do {
                let response = try await GroqService.generateItinerary(prompt: prompt)

                self.itinerary = response.itinerary
                self.selectedDay = response.itinerary.first?.day
                self.jsonResult = (try? self.encodeJSON(response)) ?? "{}"

            } catch {
                self.jsonResult = "{ \"error\": \"\(error.localizedDescription)\" }"
            }

            self.isLoading = false
        }
    }

    private func encodeJSON<T: Encodable>(_ value: T) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(value)
        return String(data: data, encoding: .utf8) ?? "{}"
    }
}
