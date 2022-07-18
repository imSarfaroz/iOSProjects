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
    
    init() {
        openDatabase()
        print("you have a connection")
    }
    
    func openDatabase() -> Bool {
        do {
            let path = Bundle.main.path(forResource: "data", ofType: "db")!

             database = try Connection(path, readonly: true)
        } catch {
            print(error)
            return false
        }
        return true
    }
}
