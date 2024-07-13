//
//  UnderlineTextField.swift
//  Banking
//
//  Created by Всеволод Оплачко on 13.07.2024.
//

import SwiftUI

struct UnderlineTextFieldView<TextFieldView>: View where TextFieldView: View {
    
    @Binding var text: String
    let textFieldView: TextFieldView
    let placeholder: String
    var imageName: String? = nil
    
    private var isTextFieldWithIcon: Bool {
        return imageName != nil
    }
    
    var body: some View {
        HStack {
            if isTextFieldWithIcon {
                iconImageView
            }
            underlineTextFieldView
        }
        underlineView
    }
}

extension UnderlineTextFieldView {
    private var iconImageView: some View {
        Image(imageName ?? "")
            .frame(width: 22, height: 22)
            .padding(.leading, 16)
            .padding(.trailing, 16)
    }
    
    private var underlineTextFieldView: some View {
        VStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeholderView
                }
                
                textFieldView
                    .padding(.trailing, 16)
                    .padding(.leading, isTextFieldWithIcon ? 0 : 16)
            }
        }
    }
    
    private var underlineViewLine: some View {
        underlineView
    }
    
    private var placeholderView: some View {
        Text(placeholder)
            .font(.custom("Poppins", size: 14))
            .fontWeight(.regular)
            .foregroundColor(.white)
            .padding(.leading, isTextFieldWithIcon ? 0 : 16)
            .opacity(0.5)
    }
    
    private var underlineView: some View {
        Rectangle().frame(height: 0.5)
            .foregroundColor(.white)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .opacity(0.5)
    }
}
