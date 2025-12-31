//
//  UnmesaiOSApp.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

@main
struct UnmesaiOSApp: App {
    @StateObject private var authManager = AuthManager()
    
    init() {
        // Register fonts programmatically
        FontLoader.registerFonts()
        
        // Debug font loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            FontHelper.printAvailableFonts()
            FontHelper.loadFontNames()
            
            // Print actual font names
            if let geistName = FontLoader.getFontName(for: "Geist-SemiBold") {
                print("Geist-SemiBold actual name: \(geistName)")
            }
            if let montserratSemiBoldName = FontLoader.getFontName(for: "Montserrat-SemiBold") {
                print("Montserrat-SemiBold actual name: \(montserratSemiBoldName)")
            }
            if let montserratRegularName = FontLoader.getFontName(for: "Montserrat-Regular") {
                print("Montserrat-Regular actual name: \(montserratRegularName)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(authManager)
                .preferredColorScheme(.dark)
        }
    }
}
