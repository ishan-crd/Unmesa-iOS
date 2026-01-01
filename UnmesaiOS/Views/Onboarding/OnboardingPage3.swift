//
//  OnboardingPage3.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct OnboardingPage3: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @Binding var currentPage: Int
    @ObservedObject var authManager: AuthManager
    @State private var selectedTime: String? = "9PM"
    
    private let timeOptions = ["9PM", "10PM", "11PM", "Other"]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 24) {
                titleSection
                optionsList
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)
            
            Spacer()
            
            finishButton
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("When should your day be judged?")
                .font(.system(size: 26.24, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text("Select only one option")
                .font(.system(size: 13))
                .foregroundColor(Color(hex: "B6B6B6"))
                .multilineTextAlignment(.center)
        }
    }
    
    private var optionsList: some View {
        VStack(spacing: 12) {
            ForEach(timeOptions, id: \.self) { option in
                optionButton(option)
            }
        }
    }
    
    private func optionButton(_ option: String) -> some View {
        let isSelected = selectedTime == option
        
        return Button {
            selectedTime = option
            onboardingManager.selectedTime = option
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
    
    private var finishButton: some View {
        Button(action: {
            // Onboarding completion commented out for now
            // onboardingManager.completeOnboarding()
            authManager.showOnboarding = false
            authManager.showWelcomeTasks = true
        }) {
            Text("Finish")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.white)
                .cornerRadius(12)
        }
    }
}

#Preview {
    OnboardingPage3(currentPage: .constant(2), authManager: AuthManager())
        .environmentObject(OnboardingManager())
}
