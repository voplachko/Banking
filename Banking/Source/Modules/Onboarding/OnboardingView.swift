//
//  OnboardingView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    
    private let onboardingData: [(imageName: String, title: String, description: String)] = [
        ("onboarding_1", "Fastest Payment in\nthe world", "Integrate multiple payment methods\nto help you up the process quickly"),
        ("onboarding_2", "The most Secoure\nPlatfrom for Customer", "Built-in Fingerprint, face\nrecognition and more, keeping you\ncompletely safe"),
        ("onboarding_3", "Paying for Everything is\nEasy and Convenient", "Built-in Fingerprint, face recognition\nand more, keeping you completely safe")
    ]
    
var body: some View {
    VStack {
        Spacer().frame(height: 145)
            
        Image(onboardingData[currentIndex].imageName)
            .resizable()
            .frame(width: 335, height: 249)
            
        Spacer().frame(height: 72)
            
        HStack {
            ForEach(0..<onboardingData.count, id: \.self) { index in
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(index == currentIndex ? .blue : .gray)
                    .padding(4)
            }
        }
            
        Spacer().frame(height: 36)
            
        Text(onboardingData[currentIndex].title)
            .font(.custom("Poppins", size: 26))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            
        Spacer().frame(height: 10)
            
        Text(onboardingData[currentIndex].description)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(UIColor(red: 126 / 255, green: 132 / 255, blue: 141 / 255, alpha: 1.0)))
            
        Spacer()
            
        Button(action: {
            withAnimation {
                self.currentIndex = min(self.currentIndex + 1, self.onboardingData.count - 1)
            }
        }) {
            Text("Next")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 335, height: 56)
                .background(Color.blue)
                .cornerRadius(16)
        }
        .padding(.bottom, 80)
    }
    .frame(maxWidth: .infinity)
    .background(Color(UIColor(red: 22 / 255, green: 22 / 255, blue: 34 / 255, alpha: 1.0)))
    .ignoresSafeArea(.all)
    }
}

#Preview {
    OnboardingView()
}
