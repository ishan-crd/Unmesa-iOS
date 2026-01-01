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
                
                Image("meditation")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 650)
                    .padding(.bottom, 20)
                
                VStack(spacing: 12) {
                    buttonsView
                    legalText
                }
                .padding(.horizontal, 24)
                .padding(.top, 0)
                .padding(.bottom, 10)
            }
        }
    }
    
    private var buttonsView: some View {
        VStack(spacing: 16) {
            titleView
            
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
    
    private var titleView: some View {
        VStack(spacing: -(38.19 - 36.3)) {
            Text("The AI")
                .font(.geistSemiBold(size: 38.19))
                .tracking(-1.53)
                .foregroundColor(.white)
            
            Text("Growth Companion")
                .font(.geistSemiBold(size: 38.19))
                .tracking(-1.53)
                .foregroundColor(.white)
        }
        .padding(.bottom, 5)
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
            .padding(.top, 8)
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}

