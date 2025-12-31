//
//  AuthManager.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import Foundation

@MainActor
final class AuthManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var showOnboarding = false
    
    init() {
        checkLoginStatus()
    }
    
    private func checkLoginStatus() {
        // Check UserDefaults or keychain for login status
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func login() {
        isLoggedIn = true
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        
        // Check if onboarding is complete
        let onboardingComplete = UserDefaults.standard.bool(forKey: "onboardingComplete")
        if !onboardingComplete {
            showOnboarding = true
        }
    }
    
    func logout() {
        isLoggedIn = false
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
}

