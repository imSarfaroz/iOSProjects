//
//  Extensions.swift
//  ChatApp
//
//  Created by Sarfaroz on 7/4/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
