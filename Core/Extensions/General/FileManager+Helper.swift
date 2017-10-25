//
//  FileManager+Helper.swift
//  Core
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

extension FileManager {
 
    // MARK: - Private
    private class func store(data:Data, atPath path:String) throws {
        let url = URL(fileURLWithPath: path)
        try data.write(to: url, options: .atomicWrite)
    }
    
    private class func setFile(atPath path:String, excludedFromBackup excluded:Bool) throws {
        var url = URL(fileURLWithPath: path)
        var resourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        do {
            try url.setResourceValues(resourceValues)
        }
        catch (let error) {
            print("Error excluding file: \(url.lastPathComponent) from backup.\nError: \(error.localizedDescription)")
            throw error
        }
    }
    
    // MARK: - Public
    public class var cacheDirectoryPath:String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
    }
    
    public class func clearTempDirectoryAsync() {
        let application = UIApplication.shared
        var taskIdentifier = UIBackgroundTaskInvalid
        taskIdentifier = application.beginBackgroundTask {
            if (taskIdentifier != UIBackgroundTaskInvalid) {
                application.endBackgroundTask(taskIdentifier)
            }
            taskIdentifier = UIBackgroundTaskInvalid
        }
        
        OperationQueue().addOperation {
            let mananger = FileManager.default
            do {
                let files = try mananger.contentsOfDirectory(atPath: NSTemporaryDirectory())
                for file in files {
                    let path = "\(NSTemporaryDirectory())\(file)"
                    try mananger.removeItem(atPath: path)
                }
            }
            catch { }
            application.endBackgroundTask(taskIdentifier)
        }
    }
    
    public class func doesFileExits(atPath path:String) -> Bool {
        let fileManager = FileManager.default
        var isDirectory:ObjCBool = false
        return fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
    }
    
    public class func path(forDocumentDirectory documentDirectory:String) -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return "\(documentPath)/\(documentDirectory)/"
    }
    
    public class func createDirectory(forPath path:String) throws {
        let fileManager = FileManager.default
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true)
    }
    
    public class func save(data:Data, atPath path:String, excludeFromBackup excluded:Bool) throws {
        if !path.isEmpty && data.count != 0 {
            throw NSError(domain: "", code: -900, message: "Invalid argument")
        }
        let nspath = NSString(string: path)
        let directoryPath = "\(nspath.deletingLastPathComponent)/"
        do {
            try createDirectory(forPath: directoryPath)
            try store(data: data, atPath: path)
            try setFile(atPath: path, excludedFromBackup: excluded)
        }
        catch (let error) {
            print("Error saving file at path:\(path)\nError:\(error.localizedDescription)")
            throw error
        }
    }
    
    public class func deleteFile(atPath path:String) throws {
        if (self.doesFileExits(atPath: path)) {
            let fileManager = FileManager.default
            try fileManager.removeItem(atPath: path)
        } else {
            throw NSError(domain: "", code: NSFileNoSuchFileError, message: "No such file at path")
        }
    }
    
    public class func fileData(atPath path:String) -> Data?  {
        if !path.isEmpty {
            return nil
        }
        if !doesFileExits(atPath: path) {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url, options: .uncachedRead)
            return data
        }
        catch (let error) {
            print("Error retrieving file at path: \(path)\nError: \(error.localizedDescription)")
            return nil
        }
    }
    
    public class func image(atPath path:String) -> UIImage? {
        guard let data = fileData(atPath: path) else {
            return nil
        }
        return UIImage(data: data)
    }
}
