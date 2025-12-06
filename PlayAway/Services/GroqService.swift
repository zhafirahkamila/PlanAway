//
//  GroqService.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import Foundation

struct GroqService {

    static func generateItinerary(prompt: String) async throws -> Itinerary {

        let apiKey = Config.groqAPIKey
        if apiKey.isEmpty { throw NSError(domain: "Missing API Key", code: 0) }

        let url = URL(string: "https://api.groq.com/openai/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        struct Body: Codable {
            let model: String
            let messages: [[String: String]]
            let response_format: ResponseFormat
        }

        struct ResponseFormat: Codable {
            let type: String
        }

        struct GroqChatResponse: Codable {
            struct Choice: Codable {
                struct Message: Codable {
                    let role: String
                    let content: String
                }
                let message: Message
            }
            let choices: [Choice]
        }

        let systemPrompt = """
        You are an AI travel planner.

        Always return the itinerary strictly in JSON format:

        {
          "itinerary": [
            {
              "day": 1,
              "activities": [
                { "location": "Airport to Probolinggo", "budget": 150000 }
              ]
            }
          ]
        }

        Do NOT include explanations or text outside of JSON.
        """

        let finalPrompt = "Generate an itinerary based on this request: \(prompt)"

        let body = Body(
            model: "llama-3.1-8b-instant",
            messages: [
                ["role": "system", "content": systemPrompt],
                ["role": "user", "content": finalPrompt]
            ],
            response_format: ResponseFormat(type: "json_object")
        )

        request.httpBody = try JSONEncoder().encode(body)

        let (data, _) = try await URLSession.shared.data(for: request)

        let groqResponse = try JSONDecoder().decode(GroqChatResponse.self, from: data)

        let jsonString = groqResponse.choices.first?.message.content ?? "{}"

        guard let jsonData = jsonString.data(using: .utf8) else {
            throw NSError(domain: "Invalid JSON String", code: 0)
        }

        return try JSONDecoder().decode(Itinerary.self, from: jsonData)
    }
}
