//
//  SQLiteCommands.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.

import Foundation
import SQLite
import SQLite3

class SQLiteCommands {
    static var table = Table("dictionary")
    
    
    // Expresssions
    static let id = Expression<Int>("id")
    static let word = Expression<String>("word")
    static let description = Expression<String>("description")
    
    // Creating Table
    static func createTable() {
        guard let database = DBHelper.sharedInstance.database
        else {
            print("Datastore Connection Error")
            return
        }
        
        do {
            try database.run(table.create(ifNotExists: true){ table in
                table.column(id, primaryKey: true)
                table.column(word)
                table.column(description)
            })
        } catch {
            print("Table already exists: \(error)")
            
        }
    }
    
    // Inserting Row
    static func insertRow(_ dictionaryValues:Dictionary)  -> Bool? {
        guard let database = DBHelper.sharedInstance.database
        else {
            print("DataStore Connection Error")
            return nil
        }
        do {
            try database.run(table.insert(word <- dictionaryValues.word, description <- dictionaryValues.description))
            return true
        } catch let Result.error(message, code, statement) where
                    code == SQLITE_CONSTRAINT {
            print("Insert now failed: \(message), in \(String(describing: statement))")
            return false
        } catch _ {
            return false
        }
    }
    
    // Present rows
    static func presentRows() -> [Dictionary]? {
        guard let database = DBHelper.sharedInstance.database
        else {
            print("datastore connection error")
            return nil
        }
        // Dictionary Array
        var dictionaryArray = [Dictionary]()
        
        // sorting data in descending order by ID
        table = table.order(id.desc)
        
        do {
            for dictionary in try database.prepare(table) {
                let idValue = dictionary[id]
                let wordValue = dictionary[word]
                let descriptionValue = dictionary[description]
                
                let createObject = Dictionary(id: idValue, word: wordValue, description: descriptionValue)
                
                dictionaryArray.append(createObject)
                
                print("id \(dictionary[id]), word: \(dictionary[word]), description: \(dictionary[description])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return dictionaryArray
    }
}
