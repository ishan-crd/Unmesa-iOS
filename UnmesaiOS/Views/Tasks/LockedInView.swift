//
//  LockedInView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct LockedInView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var taskManager: TaskManager
    let tasks: [String]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 20) {
                    Image("lockedIn")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    
                    VStack(spacing: 12) {
                        (Text("You're ")
                            .tracking(-1.05)
                            .font(.geistSemiBold(size: 26.24)) +
                         Text("LOCKED IN.")
                            .font(.geistSemiBold(size: 37)))
                            .tracking(-1.05)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("These are the only things that matter today.")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "B6B6B6"))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                VStack(spacing: 16) {
                    ForEach(Array(tasks.enumerated()), id: \.offset) { index, task in
                        if !task.isEmpty {
                            taskBox(task: task)
                        }
                    }
                    
                    Text("Come back tonight at 10pm to answer for them.")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                }
                .padding(.horizontal, 24)
                .padding(.top, 40)
                
                Spacer()
                
                gotItButton
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
            }
        }
    }
    
    private func taskBox(task: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(task)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
        }
        .background(Color(white: 0.15))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 1, dash: [5]))
        )
    }
    
    private var gotItButton: some View {
        Button {
            taskManager.setTasks(tasks)
            authManager.showWelcomeTasks = false
            authManager.showDashboard = true
        } label: {
            Text("Got it")
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
    LockedInView(tasks: ["Study linear algebra for 60 min", "Ship landing page draft", "Apply to 3 roles"])
        .environmentObject(AuthManager())
}

