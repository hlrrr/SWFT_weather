//
//  WeathereButton.swift
//  proj.ONE
//
//  Created by hylee on 2023/10/01.
//
 import SwiftUI

struct WeathereButton: View {
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
            Text(title)
                .frame(width: 222, height: 55)
                .background(backgroundColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 22, weight: .medium, design: .default))
                .cornerRadius(11)
    }
}
