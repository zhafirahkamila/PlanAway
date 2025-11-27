//
//  ItineraryCard.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import SwiftUI

struct ItineraryCard: View {
    let dayPlan: DayPlan

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            HStack(alignment: .top) {
                // DAY LABEL
                Text("Day \(dayPlan.day)")
                    .font(.headline)
                    .foregroundColor(.black)

                Divider()
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.4))

                VStack(alignment: .leading, spacing: 10) {

                    ForEach(dayPlan.activities) { activity in
                        HStack(spacing: 8) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                                .font(.system(size: 12))

                            Text(activity.location)
                                .font(.subheadline)
                                .foregroundColor(.blue)

                            Spacer()

                            Image(systemName: "creditcard")
                                .foregroundColor(.blue)
                                .font(.system(size: 12))

                            Text(formatCurrency(activity.budget))
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color(red: 1, green: 0.98, blue: 0.96))
        .cornerRadius(12)
        .shadow(radius: 1, y: 1)
    }

    func formatCurrency(_ amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

struct ItineraryResultView: View {
    let text: String   // raw JSON text

    var body: some View {
        ScrollView {
            Text(prettyPrinted(jsonString: text))
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(white: 0.96))
                .cornerRadius(12)
        }
        .frame(maxHeight: 300)
    }

    func prettyPrinted(jsonString: String) -> String {
        guard
            let data = jsonString.data(using: .utf8),
            let object = try? JSONSerialization.jsonObject(with: data),
            let pretty = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
        else {
            return text  // return raw if parsing fails
        }

        return String(decoding: pretty, as: UTF8.self)
    }
}
