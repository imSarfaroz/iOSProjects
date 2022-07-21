//
//  wordHistory.swift
//  Farhang
//
//  Created by Sarfaroz on 7/21/22.
//

import Foundation

struct WordHistory: Decodable, Encodable {
//    static func < (lhs: WordHistory, rhs: WordHistory) -> Bool {
//        return lhs.id > rhs.word_id
//    }
    
    let id: Int
    let word_id: Int
}
