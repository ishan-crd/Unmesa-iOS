//
//  LoginView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 24) {
                    titleView
                    buttonsView
                    legalText
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
    
    private var titleView: some View {
        VStack(spacing: 0) {
            Text("The AI")
                .font(.geistSemiBold(size: 32))
            Text("Growth Companion")
                .font(.geistSemiBold(size: 32))
        }
        .foregroundColor(.white)
        .padding(.bottom, 40)
    }
    
    private var buttonsView: some View {
        VStack(spacing: 16) {
            authButton(
                title: "Continue with Email",
                icon: "envelope.fill",
                backgroundColor: Color(white: 0.15),
                foregroundColor: .white
            )
            
            authButton(
                title: "Continue with Apple",
                icon: "apple.logo",
                backgroundColor: .white,
                foregroundColor: .black
            )
            
            authButton(
                title: "Continue with Google",
                icon: "globe",
                backgroundColor: .white,
                foregroundColor: .black
            )
        }
    }
    
    private func authButton(
        title: String,
        icon: String,
        backgroundColor: Color,
        foregroundColor: Color
    ) -> some View {
        Button(action: {
            authManager.login()
        }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                Text(title)
                    .font(.montserratSemiBold(size: 16))
            }
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(backgroundColor)
            .cornerRadius(12)
        }
    }
    
    private var legalText: some View {
        (Text("By continuing, you agree to Unmesa's ") +
         Text("Terms of Use").fontWeight(.bold) +
         Text(" and ") +
         Text("Privacy Policy").fontWeight(.bold))
            .font(.system(size: 12))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.top, 24)
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}

