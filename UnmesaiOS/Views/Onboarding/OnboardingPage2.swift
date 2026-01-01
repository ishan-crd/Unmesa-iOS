//
//  OnboardingPage2.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct OnboardingPage2: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @Binding var currentPage: Int
    
    private let options = [
        "Student preparing for something important",
        "Early-career professional",
        "Freelancer / self-employed",
        "Just trying to regain control of my time"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 24) {
                titleSection
                optionsList
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
            
            Spacer()
            
            nextButton
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("Which describes you best right now?")
                .font(.geistSemiBold(size: 30.5))
                .tracking(-1.05)
                .lineSpacing(29 - 29)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text("You can select multiple options")
                .font(.system(size: 13))
                .foregroundColor(Color(hex: "B6B6B6"))
                .multilineTextAlignment(.center)
        }
    }
    
    private var optionsList: some View {
        VStack(spacing: 12) {
            ForEach(options, id: \.self) { option in
                optionButton(option)
            }
        }
    }
    
    private func optionButton(_ option: String) -> some View {
        let isSelected = onboardingManager.selectedDescriptions.contains(option)
        
        return Button {
            onboardingManager.toggleDescription(option)
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                    }
                }
                
                Text(option)
                    .font(.system(size: 12.76))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(isSelected ? Color.white.opacity(0.2) : Color(white: 0.15))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
    
    private var nextButton: some View {
        Button(action: {
            withAnimation {
                currentPage = 2
            }
        }) {
            Text("Next")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(onboardingManager.selectedDescriptions.isEmpty ? Color.gray : Color.white)
                .cornerRadius(12)
        }
        .disabled(onboardingManager.selectedDescriptions.isEmpty)
    }
}

#Preview {
    OnboardingPage2(currentPage: .constant(1))
        .environmentObject(OnboardingManager())
}
