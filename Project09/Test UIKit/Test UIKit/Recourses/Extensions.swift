//
//  Extensions.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/2/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
