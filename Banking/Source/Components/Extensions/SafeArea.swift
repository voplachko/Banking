//
//  SafeArea.swift
//  Banking
//
//  Created by Всеволод Оплачко on 13.07.2024.
//

import SwiftUI

extension View {
    func safeAreaInsets() -> UIEdgeInsets {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return .zero
        }
        return window.safeAreaInsets
    }
}
