//
//  HamiltonCityViewModel.swift
//  HamiltonCity
//
//  Created by Tassos Fergadiotis on 2025-02-09.
//

import Foundation
import SwiftUI

class HamiltonCityViewModel: ObservableObject {
    @Published var clues: [Clue] = []
    @Published var foundCount: Int = 0
    
    func loadClues() {
        clues = [
            Clue(businessName: "Hamilton Gardens",
                 text: "Find a statue in the Italian Renaissance Garden",
                 found: false,
                 latitude: -37.8387,
                 longitude: 175.3052,
                 image: nil,
                 businessAddress: "Gate 2, Cobham Drive",
                 businessHours: "Daily 7:00 AM - 8:00 PM",
                 businessCategory: .park),
                 
            Clue(businessName: "Waikato Museum",
                 text: "Locate the ancient Māori artifact display",
                 found: false,
                 latitude: -37.7870,
                 longitude: 175.2793,
                 image: nil,
                 businessAddress: "1 Grantham Street",
                 businessHours: "10:00 AM - 5:00 PM",
                 businessCategory: .history),
                 
            Clue(businessName: "SkyCity Hamilton",
                 text: "Find the lucky fountain near the entrance",
                 found: false,
                 latitude: -37.7875,
                 longitude: 175.2819,
                 image: nil,
                 businessAddress: "346 Victoria Street",
                 businessHours: "24/7",
                 businessCategory: .entertainment)
            // Add more clues as needed
        ]
    }
    
    func markClueFound(_ clue: Clue, with imageData: Data) {
        if let index = clues.firstIndex(where: { $0.id == clue.id }) {
            clues[index].found = true
            clues[index].image = imageData
            foundCount += 1
        }
    }
    
    func getDiscount() -> String {
        switch foundCount {
            case 7...9:
                return "You've earned a 20% discount! 🎉"
            case 5...6:
                return "You've earned a 10% discount! 🎉"
            case 10:
                return "You've earned a 20% discount and entered the $5000 grand prize draw! 🎉"
            default:
                return "Find more items to earn discounts!"
        }
    }
    
    func checkUltimatePrize() -> Bool {
        return foundCount == 10
    }
    
    func resetClues() {
        clues.indices.forEach {
            clues[$0].found = false
            clues[$0].image = nil
        }
        foundCount = 0
    }
}
