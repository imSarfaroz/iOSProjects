//
//  SQLiteCommands.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.

import Foundation
import SQLite
import SQLite3

class SQLiteCommands {
    static var wordTable = Table("word")
    static var historyTable = Table("history")
    
    static let word_id = Expression<Int>("word_id")
    static let word = Expression<String>("word")
    static let article = Expression<String>("article")
    static let dictionaryNumber = Expression<Int>("dictionary")
    static let id = Expression<Int>("id")
    
    static func presentRows(id: Int, searchText: String = "") -> [Dictionary] {
        guard let database = DBHelper.sharedInstance.database
        else {
            return []
        }
        var dictionaryArray = [Dictionary]()
        wordTable = wordTable.order(word_id.asc)
        
        do {
            for dictionary in try database.prepare(wordTable.where(dictionaryNumber == id && word.like("\(searchText)%", escape: .none)).limit(80)){
                let idValue = dictionary[word_id]
                let wordValue = dictionary[word]
                let descriptionValue = dictionary[article]
                let dictionaryValue = dictionary[dictionaryNumber]
                let createObject = Dictionary(word_id: idValue, word: wordValue, article: descriptionValue, dictionary: dictionaryValue)
                dictionaryArray.append(createObject)
            }
        } catch {
        
        }
        return dictionaryArray
    }
    
    static func getAllHistories() -> [WordHistory]?{
        guard let database = DBHelper.sharedInstance.database
        else {
            print("datastore connection error")
            return nil
        }
        var historyArray = [WordHistory]()
        do {
            for history in try database.prepare(historyTable){
                let hisId = history[id]
                let wordId = history[word_id]
                let createObject = WordHistory(id: hisId, word_id: wordId)
                print("id \(history[id]), word: \(history[word_id])")
                
                historyArray.append(createObject)
            }
        } catch {
            print("Present row error: \(error)")
        }
        print(historyArray)
        return historyArray
    }
    
    static func presentHistoryRows() -> [Dictionary]? {
        guard let database = DBHelper.sharedInstance.database
        else {
            print("datastore connection error")
            return nil
        }
        var dictionaryArray = [Dictionary]()
        
        do {
            let words = try database.prepare("SELECT * FROM word w JOIN history h on h.word_id = w.word_id ORDER BY h.id DESC")
            for dictionary in words {
                let idValue = dictionary[0] as! Int64
                let wordValue = dictionary[1] as! String
                let descriptionValue = dictionary[2] as! String
                let dictionaryValue = dictionary[3] as! Int64
                let createObject = Dictionary(word_id: Int(idValue), word: wordValue, article: descriptionValue, dictionary: Int(dictionaryValue))
                dictionaryArray.append(createObject)
            }
        } catch {
            print("Present row error: \(error)")
        }
        return dictionaryArray
    }
    
    static func insertRow(_ dictionaryValues:Dictionary){
        guard let database = DBHelper.sharedInstance.database
        else {
            print("DataStore Connection Error")
            return
        }
        do {
            let word = WordHistory(word_id: dictionaryValues.word_id)
            try database.run(historyTable.insert(word))
            print("successfully inserted")
            
        } catch let Result.error(message, code, statement) where
                    code == SQLITE_CONSTRAINT {
            print("Insert now failed: \(message), in \(String(describing: statement))")
        } catch _ {
            print("could not insert")
        }
    }
}
