//
//  DBHelper.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.
//

import Foundation
import SQLite3
import SQLite

class DBHelper {
    static let sharedInstance = DBHelper()
    var database: Connection?
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("myDB").appendingPathExtension("sqlite3")
            
            database = try Connection(fileUrl.path)
        } catch {
            print("Connecting connection to database error: \(error)")
        }
    }
    
    func createTable() {
        SQLiteCommands.createTable()
    }
}
