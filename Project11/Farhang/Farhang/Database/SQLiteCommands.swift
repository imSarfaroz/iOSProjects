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
    
//    // Expresssions
//    static let dictionary_id = Expression<Int>("dictionary_id")
//    static let from_language = Expression<String>("from_language")
//    static let to_language = Expression<String>("to_language")
    
    // Expresssions
    static let word_id = Expression<Int>("word_id")
    static let word = Expression<String>("word")
    static let article = Expression<String>("article")
    static let dictionaryNumber = Expression<Int>("dictionary")
    
    // Creating Table
//    static func createTable() {
//        guard let database = DBHelper.sharedInstance.database
//        else {
//            print("Datastore Connection Error")
//            return
//        }
//        
//        do {
//            try database.run(table.create(ifNotExists: true){ table in
//                table.column(word_id, primaryKey: true)
//                table.column(word)
//                table.column(article)
//            })
//        } catch {
//            print("Table already exists: \(error)")
//            
//        }
//    }
    
    // Inserting Row
//    static func insertRow(_ dictionaryValues:Dictionary)  -> Bool? {
//        guard let database = DBHelper.sharedInstance.database
//        else {
//            print("DataStore Connection Error")
//            return nil
//        }
//        do {
//            try database.run(word.insert(word <- dictionaryValues.word, article <- dictionaryValues.article))
//            return true
//        } catch let Result.error(message, code, statement) where
//                    code == SQLITE_CONSTRAINT {
//            print("Insert now failed: \(message), in \(String(describing: statement))")
//            return false
//        } catch _ {
//            return false
//        }
//    }
//    
    // Present rows
//search: String = "", id: Int
    static func presentRows() -> [Dictionary]? {
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
          //  database.prepare(wordTable.where(word.like(search, escape: nil), word_id == 2))
            for dictionary in try database.prepare(wordTable){
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
