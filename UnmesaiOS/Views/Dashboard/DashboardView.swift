//
//  DashboardView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var selectedTab = 0
    @State private var timeRemaining = ""
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    
    init() {
        // Load tasks on init
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                let navBarHeight: CGFloat = 60
                let contentHeight = geometry.size.height - navBarHeight
                let topHeight = contentHeight * (1.0 / 2.75)
                let bottomHeight = contentHeight * (1.75 / 2.75)
                
                VStack(spacing: 0) {
                    topSection(height: topHeight)
                    bottomSection(height: bottomHeight)
                    bottomNavBar
                }
            }
        }
        .onAppear {
            updateCountdown()
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                updateCountdown()
            }
        }
    }
    
    private func topSection(height: CGFloat) -> some View {
        ZStack {
            VStack(spacing: 0) {
                Color.black
                    .frame(height: height / 2)
                Color(hex: "171717")
                    .frame(height: height / 2)
            }
            
            ZStack {
                Image("lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                
                VStack(spacing: 4) {
                    // Text("Closes in")
                    //     .font(.system(size: 12))
                    //     .foregroundColor(.white)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text("\(hours)")
                            .font(.geistSemiBold(size: 26.5))
                            .foregroundColor(.white)
                        Text("h")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                        Text("\(minutes)")
                            .font(.geistSemiBold(size: 26.5))
                            .foregroundColor(.white)
                        Text("m")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(hex: "1F1F1F"))
                .overlay(
                    RoundedRectangle(cornerRadius: 19)
                        .stroke(Color(hex: "373737"), lineWidth: 1)
                )
                .cornerRadius(19)
                .offset(y: 80)
            }
        }
        .frame(height: height)
    }
    
    private func bottomSection(height: CGFloat) -> some View {
        ZStack {
            Color.black
                .cornerRadius(33, corners: [.topLeft, .topRight])
            
            ScrollView {
                VStack(spacing: 0) {
                    Text("TODAY'S RULE")
                        .font(.neuePlakExtendedSemiBold(size: 14))
                        .foregroundColor(Color(hex: "4A9EFF"))
                        .padding(.top, 27)
                    
                    Text("Focus on the essential.")
                        .font(.geistSemiBold(size: 28.24))
                        .tracking(-1.05) 
                        .foregroundColor(.white)
                        .padding(.top, 8)
                    
                    Text("Why this day matters")
                        .font(.montserratRegular(size: 14))
                        .foregroundColor(Color(hex: "B6B6B6"))
                        .padding(.top, 4)
                    
                    VStack(spacing: 12) {
                        ForEach(Array(taskManager.todayTasks.enumerated()), id: \.offset) { index, task in
                            taskRow(task: task)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 32)
                    
                    Text("Tonight you'll receive your verdict")
                        .font(.montserratRegular(size: 13))
                        .foregroundColor(Color(hex: "B6B6B6"))
                        .padding(.top, 24)
                        .padding(.bottom, 20)
                }
            }
        }
        .frame(height: height)
    }
    
    private func taskRow(task: String) -> some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color(hex: "1F2937"))
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(task)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                Text("Complete by 10pm")
                    .font(.montserratRegular(size: 12))
                    .foregroundColor(Color(hex: "B6B6B6"))
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color(hex: "121212"))
        .overlay(
            RoundedRectangle(cornerRadius: 21)
                .stroke(Color(hex: "1F2937"), lineWidth: 1)
        )
        .cornerRadius(21)
    }
    
    private var bottomNavBar: some View {
        HStack(spacing: 0) {
            navItem(icon: "home", isSelected: selectedTab == 0, action: { selectedTab = 0 })
            navItem(icon: "cal", isSelected: selectedTab == 1, action: { selectedTab = 1 })
            navItem(icon: "shield", isSelected: selectedTab == 2, action: { selectedTab = 2 })
            navItem(icon: "profile", isSelected: selectedTab == 3, action: { selectedTab = 3 })
        }
        .frame(height: 60)
        .background(Color.black)
    }
    
    private func navItem(icon: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                if isSelected {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "4A9EFF"), Color(hex: "2B71FA")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)
                }
                
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private func updateCountdown() {
        let calendar = Calendar.current
        let now = Date()
        var components = calendar.dateComponents([.year, .month, .day], from: now)
        components.hour = 22
        components.minute = 0
        components.second = 0
        
        guard let targetDate = calendar.date(from: components) else { return }
        
        if targetDate < now {
            components.day = (components.day ?? 0) + 1
            guard let nextTarget = calendar.date(from: components) else { return }
            setTimeRemaining(to: nextTarget)
        } else {
            setTimeRemaining(to: targetDate)
        }
    }
    
    private func setTimeRemaining(to date: Date) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date(), to: date)
        hours = components.hour ?? 0
        minutes = components.minute ?? 0
        timeRemaining = "\(hours)h \(minutes)m"
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    DashboardView()
}

