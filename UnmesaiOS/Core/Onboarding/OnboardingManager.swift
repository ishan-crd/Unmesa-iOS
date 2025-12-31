//
//  OnboardingManager.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import Foundation

@MainActor
final class OnboardingManager: ObservableObject {
    @Published var isOnboardingComplete = false
    @Published var selectedImprovements: Set<String> = []
    @Published var selectedDescriptions: Set<String> = []
    @Published var selectedTime: String?
    
    init() {
        checkOnboardingStatus()
    }
    
    private func checkOnboardingStatus() {
        isOnboardingComplete = UserDefaults.standard.bool(forKey: "onboardingComplete")
    }
    
    func completeOnboarding() {
        isOnboardingComplete = true
        UserDefaults.standard.set(true, forKey: "onboardingComplete")
    }
    
    func toggleImprovement(_ improvement: String) {
        if selectedImprovements.contains(improvement) {
            selectedImprovements.remove(improvement)
        } else {
            selectedImprovements.insert(improvement)
        }
    }
    
    func toggleDescription(_ description: String) {
        if selectedDescriptions.contains(description) {
            selectedDescriptions.remove(description)
        } else {
            selectedDescriptions.insert(description)
        }
    }
}

