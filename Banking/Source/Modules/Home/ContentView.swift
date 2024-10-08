//
//  ContentView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage("kIsUserAuthorized") var isUserAuthorized: Bool = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.toolbarColor)
        }
    
    var body: some View {
        
        if isUserAuthorized {
            // open home screen
            
            VStack {
                TabView {
                    
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
                    MyCardsView(transactions: [])
                        .tabItem {
                            Image(systemName: "creditcard")
                            Text("My Cards")
                        }
                    
                    StatsView()
                        .tabItem {
                            Image(systemName: "chart.bar")
                            Text("Statistics")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gearshape")
                            Text("Settings")
                        }
                
                }
            }
            
            
            
        } else {
            // open onboarding
            if UserDefaultsWrapper.isSeenOnboarding {
                OnboardingView()
            } else {
                AuthorizationView()
            }
            
        }
    }
        
}

#Preview {
    ContentView()
}
