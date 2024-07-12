//
//  AuthorizationView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 12.07.2024.
//

import SwiftUI

struct AuthorizationView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        Button("Close Screen") {
            dismiss()
        }
        Text("Hello, Enter Login!")
    }
}

#Preview {
    AuthorizationView()
}
