//
//  ContentView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            FirstScreen()
                .tabItem {
                    Text("Первый экран")
                }
            ScreenSecond()
                .tabItem {
                    Text("Второй экран")
                }
        }
    }
}

#Preview {
    ContentView()
}
