//
//  Config.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import Foundation

struct Config {
    static var groqAPIKey: String {
        Bundle.main.object(forInfoDictionaryKey: "GROQ_API_KEY") as? String ?? ""
    }
}

