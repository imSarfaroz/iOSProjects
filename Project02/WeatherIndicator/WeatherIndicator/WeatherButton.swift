//
//  WeatherButton.swift
//  Project02(IOS app)
//
//  Created by Sarfaroz on 3/4/22.
//
import SwiftUI

struct WeatherButton: View {
    var title: String = ""
    var textColor: Color = .white
    var backgroundColor: Color = .white
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(20)
    }
}

