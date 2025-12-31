//
//  FontHelper.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI
import CoreText

struct FontHelper {
    static func printAvailableFonts() {
        #if DEBUG
        let fontFamilies = UIFont.familyNames.sorted()
        print("=== Available Font Families ===")
        for family in fontFamilies {
            print("Family: \(family)")
            let fonts = UIFont.fontNames(forFamilyName: family)
            for font in fonts {
                print("  - \(font)")
            }
        }
        #endif
    }
    
    static func loadFontNames() {
        #if DEBUG
        if let geistPath = Bundle.main.path(forResource: "Geist-SemiBold", ofType: "ttf"),
           let geistData = NSData(contentsOfFile: geistPath) as Data?,
           let provider = CGDataProvider(data: geistData as CFData),
           let font = CGFont(provider),
           let postScriptName = font.postScriptName {
            let fontName = postScriptName as String
            print("Geist font name: \(fontName)")
        }
        
        if let montserratPath = Bundle.main.path(forResource: "Montserrat-SemiBold", ofType: "ttf"),
           let montserratData = NSData(contentsOfFile: montserratPath) as Data?,
           let provider = CGDataProvider(data: montserratData as CFData),
           let font = CGFont(provider),
           let postScriptName = font.postScriptName {
            let fontName = postScriptName as String
            print("Montserrat font name: \(fontName)")
        }
        #endif
    }
}

