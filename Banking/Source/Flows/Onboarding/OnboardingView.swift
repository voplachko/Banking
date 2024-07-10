//
//  OnboardingView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        
        VStack(spacing:36) {
            Image("onboarding_1")
                .resizable()
                .frame(width: 335, height: 249)
            
            Text("Fastest Payment in\nthe world")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
            
            Spacer()
            
            Button("Bordered Prominent Button") {
                
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity)
        .background(.gray)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    OnboardingView()
}
