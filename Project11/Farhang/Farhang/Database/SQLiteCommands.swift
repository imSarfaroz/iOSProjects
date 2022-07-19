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
    static var historyTable = Table("history")
    
    // Expresssions
    static let word_id = Expression<Int>("word_id")
    static let word = Expression<String>("word")
    static let article = Expression<String>("article")
    static let dictionaryNumber = Expression<Int>("dictionary")
    
    // Func for presenting Rows
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
            for dictionary in try database.prepare(wordTable.where(dictionaryNumber == id && word.like("%\(searchText)%", escape: .none)).limit(150)){
                let idValue = dictionary[word_id]
                let wordValue = dictionary[word]
                let descriptionValue = dictionary[article]
                let dictionaryValue = dictionary[dictionaryNumber]
                
                let createObject = Dictionary(word_id: idValue, word: wordValue, article: descriptionValue, dictionary: dictionaryValue)
                
                dictionaryArray.append(createObject)
                
              //  print("id \(dictionary[word_id]), word: \(dictionary[word]), description: \(dictionary[article]), dictionary: \(dictionary[dictionaryNumber])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return dictionaryArray
    }
    
    // func for inserting a Row in Database
    static func insertRow(_ dictionaryValues:Dictionary)  -> Bool? {
            guard let database = DBHelper.sharedInstance.database
            else {
                print("DataStore Connection Error")
                return nil
            }
            do {
                let rowid =  try database.run(historyTable.insert( word_id <- dictionaryValues.word_id))
                print("successfully inserted")
                print("inserted id: \(rowid)")
                return true
            } catch let Result.error(message, code, statement) where
                        code == SQLITE_CONSTRAINT {
                print("Insert now failed: \(message), in \(String(describing: statement))")
                return false
            } catch _ {
                print("could not insert")
                return false
            }
        }
}
