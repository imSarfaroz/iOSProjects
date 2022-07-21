//
//  Dictionary.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.
//

import Foundation

struct Dictionary: Comparable {
    static func < (lhs: Dictionary, rhs: Dictionary) -> Bool {
        return lhs.word_id > rhs.word_id
    }
    
    let word_id: Int
    let word: String
    let article: String
    let dictionary: Int
}

