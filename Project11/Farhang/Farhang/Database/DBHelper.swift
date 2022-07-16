//
//  DBHelper.swift
//  Farhang
//
//  Created by Sarfaroz on 7/15/22.
//

import Foundation

import SQLite

class DBHelper {
    static let sharedInstance = DBHelper()
    var database: Connection?
    
    //    init() {
    //        do {
    //            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    //
    //            let fileUrl = documentDirectory.appendingPathComponent("database.db").appendingPathExtension("sqlite3")
    //
    //
    //            print("You got a connection with a database")
    //        } catch {
    //            print("Connecting connection to database error: \(error)")
    //        }
    //    }
    
    init() {
        openDatabase()
        print("you have a connection")
    }
    
    func openDatabase() -> Bool {
//        let applicationSupportURL = try! FileManager.default
//            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            .appendingPathComponent("database.db")
//
//        guard let bundleURL = Bundle.main.url(forResource: "data", withExtension: "db") else {
//            print("Cannot locate database file.")
//            return false
//        }
        
        do {
            let path = Bundle.main.path(forResource: "data", ofType: "db")!

             database = try Connection(path, readonly: true)
//            self.database = db
//            try FileManager.default.copyItem(at: bundleURL, to: applicationSupportURL)
        } catch {
            print(error)
            return false
        }
        
//        do {
//            let database = try Connection(applicationSupportURL.path)
//            self.database = database
//        } catch {
//
//        }
        return true
    }
    
//    func createTable() {
//        SQLiteCommands.createTable()
//    }
}
