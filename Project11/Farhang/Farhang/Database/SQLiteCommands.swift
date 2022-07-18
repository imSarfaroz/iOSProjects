//
//  SQLiteCommands.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.

import Foundation
import SQLite
import SQLite3

class SQLiteCommands {
    //    static var table = Table("dictionary")
    static var wordTable = Table("word")
    
    // Expresssions
    static let word_id = Expression<Int>("word_id")
    static let word = Expression<String>("word")
    static let article = Expression<String>("article")
    static let dictionaryNumber = Expression<Int>("dictionary")
    
    static func presentRows(id: Int, searchText: String = "") -> [Dictionary]? {
        guard let database = DBHelper.sharedInstance.database
        else {
            print("datastore connection error")
            return nil
        }
        // Dictionary Array
        var dictionaryArray = [Dictionary]()
        
        // sorting data in descending order by ID
        wordTable = wordTable.order(word_id.asc)
        
        do {
            for dictionary in try database.prepare(wordTable.where(dictionaryNumber == id && word.like("%\(searchText)%", escape: .none)).limit(100)){
                let idValue = dictionary[word_id]
                let wordValue = dictionary[word]
                let descriptionValue = dictionary[article]
                let dictionaryValue = dictionary[dictionaryNumber]
                
                let createObject = Dictionary(word_id: idValue, word: wordValue, article: descriptionValue, dictionary: dictionaryValue)
                
                dictionaryArray.append(createObject)
                
                print("id \(dictionary[word_id]), word: \(dictionary[word]), description: \(dictionary[article]), dictionary: \(dictionary[dictionaryNumber])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return dictionaryArray
    }
}
