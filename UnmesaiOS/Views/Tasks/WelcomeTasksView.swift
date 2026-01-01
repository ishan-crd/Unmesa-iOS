//
//  WelcomeTasksView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct WelcomeTasksView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var showTaskInputs = false
    @State private var showLockedIn = false
    @State private var task1 = ""
    @State private var task2 = ""
    @State private var task3 = ""
    
    var body: some View {
        Group {
            if showLockedIn {
                LockedInView(tasks: [task1, task2, task3].filter { !$0.isEmpty })
                    .environmentObject(authManager)
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 32) {
                    Image("boywithcrown")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .offset(y: showTaskInputs ? 0 : 40)
                    
                    VStack(spacing: 12) {
                        Text("What will make today a win?")
                            .font(.system(size: 26.24, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(y: showTaskInputs ? 0 : 40)
                        
                        Text("Choose 3 tasks. No more. No edits later.")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "B6B6B6"))
                            .multilineTextAlignment(.center)
                            .offset(y: showTaskInputs ? 0 : 40)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, showTaskInputs ? 20 : 0)
                
                if showTaskInputs {
                    VStack(spacing: 16) {
                        taskInputField(number: 1, text: $task1)
                        taskInputField(number: 2, text: $task2)
                        taskInputField(number: 3, text: $task3)
                        
                        Text("Don't over commit.")
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
                
                Spacer()
                
                continueButton
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                    }
                }
            }
        }
    }
    
    private func taskInputField(number: Int, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Task \(number)")
                .font(.system(size: 12))
                .foregroundColor(.white)
            
            TextField("", text: text)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color(white: 0.15))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "B6B6B6"), style: StrokeStyle(lineWidth: 1, dash: [5]))
                )
        }
    }
    
    private var continueButton: some View {
        Button {
            if !showTaskInputs {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showTaskInputs = true
                }
            } else {
                // Show locked in page
                withAnimation(.easeInOut(duration: 0.5)) {
                    showLockedIn = true
                }
            }
        } label: {
            Text("Continue")
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
    WelcomeTasksView()
        .environmentObject(AuthManager())
}

