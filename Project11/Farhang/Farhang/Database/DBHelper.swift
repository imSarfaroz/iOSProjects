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
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            let sourcePath = Bundle.main.path(forResource: "data", ofType: "db")!
            let fileManager = FileManager.default
            let doumentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
            let destinationPath = doumentDirectoryPath.appendingPathComponent("mydb.db")
            
            print(destinationPath)
            if !fileManager.fileExists(atPath: destinationPath) {
                try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
            }
            
            database = try Connection("\(path)/mydb.db")
        }
        catch {
        }
    }
}

//    func openDatabase()  {
//        do {
//        let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            .appendingPathComponent("database.db")
//
//        guard let bundlePath = Bundle.main.url(forResource: "data", withExtension: "db") else {
//            return
//        }
//        try FileManager.default.copyItem(at: bundlePath, to: fileURL)
//        } catch {
//            print("error during file copy:")
//    }
//}
//    var database: Connection?
//
//    init() {
//        openDatabase()
//        print("you have a connection")
//    }
//
//    func openDatabase() -> Bool {
//        do {
//            let path = Bundle.main.path(forResource: "data", ofType: "db")!
//
//             database = try Connection(path, readonly: true)
//
//
//        } catch {
//            print(error)
//            return false
//        }
//        return true
//    }
//}
