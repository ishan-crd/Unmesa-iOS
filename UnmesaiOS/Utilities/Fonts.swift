//
//  Fonts.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

extension Font {
    static func geistSemiBold(size: CGFloat) -> Font {
        // Try actual PostScript name first (will be printed in console)
        // Then try common variations
        let fontNames = [
            FontLoader.getFontName(for: "Geist-SemiBold") ?? "",
            "Geist-SemiBold",
            "Geist SemiBold",
            "GeistSemiBold",
            "GeistVF",
            "Geist"
        ].filter { !$0.isEmpty }
        
        for fontName in fontNames {
            if let font = UIFont(name: fontName, size: size) {
                return Font(font)
            }
        }
        
        // Fallback
        return .system(size: size, weight: .semibold)
    }
    
    static func montserratSemiBold(size: CGFloat) -> Font {
        let fontNames = [
            FontLoader.getFontName(for: "Montserrat-SemiBold") ?? "",
            "Montserrat-SemiBold",
            "Montserrat SemiBold",
            "MontserratSemiBold",
            "Montserrat"
        ].filter { !$0.isEmpty }
        
        for fontName in fontNames {
            if let font = UIFont(name: fontName, size: size) {
                return Font(font)
            }
        }
        
        // Fallback
        return .system(size: size, weight: .semibold)
    }
    
    static func montserratRegular(size: CGFloat) -> Font {
        let fontNames = [
            FontLoader.getFontName(for: "Montserrat-Regular") ?? "",
            "Montserrat-Regular",
            "Montserrat Regular",
            "Montserrat"
        ].filter { !$0.isEmpty }
        
        for fontName in fontNames {
            if let font = UIFont(name: fontName, size: size) {
                return Font(font)
            }
        }
        
        // Fallback
        return .system(size: size)
    }
}

