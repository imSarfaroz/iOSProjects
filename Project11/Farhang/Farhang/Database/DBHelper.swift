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
