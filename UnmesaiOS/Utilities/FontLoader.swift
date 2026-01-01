//
//  FontLoader.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import UIKit
import CoreText

struct FontLoader {
    static func registerFonts() {
        registerFont(named: "Geist-SemiBold")
        registerFont(named: "Montserrat-SemiBold")
        registerFont(named: "Montserrat-Regular")
        registerFont(named: "Neue Plak Extended SemiBold")
    }
    
    private static func registerFont(named fontName: String) {
        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf"),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Failed to load font: \(fontName)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let error = error {
                print("Failed to register font \(fontName): \(error.takeUnretainedValue())")
            }
        } else {
            if let postScriptName = font.postScriptName {
                print("Successfully registered font: \(fontName) -> \(postScriptName as String)")
            }
        }
    }
    
    static func getFontName(for filename: String) -> String? {
        guard let fontURL = Bundle.main.url(forResource: filename, withExtension: "ttf"),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider),
              let postScriptName = font.postScriptName else {
            return nil
        }
        return postScriptName as String
    }
}

