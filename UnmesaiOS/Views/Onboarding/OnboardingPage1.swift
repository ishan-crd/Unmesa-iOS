//
//  OnboardingPage1.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct OnboardingPage1: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @Binding var currentPage: Int
    
    private let options = [
        "Reduce mindless scrolling",
        "Focus better during work / study",
        "Build self-discipline",
        "End my days without regret"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 24) {
                titleSection
                optionsList
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)
            
            Spacer()
            
            nextButton
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("What do you want to improve first?")
                .font(.system(size: 26.24, weight: .semibold))
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
        let isSelected = onboardingManager.selectedImprovements.contains(option)
        
        return Button {
            onboardingManager.toggleImprovement(option)
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
                currentPage = 1
            }
        }) {
            Text("Next")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(onboardingManager.selectedImprovements.isEmpty ? Color.gray : Color.white)
                .cornerRadius(12)
        }
        .disabled(onboardingManager.selectedImprovements.isEmpty)
    }
}

#Preview {
    OnboardingPage1(currentPage: .constant(0))
        .environmentObject(OnboardingManager())
}

