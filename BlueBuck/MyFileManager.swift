//
//  Save.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/16/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

internal struct MyFileManager {
    
    static func writeJsonFile(filename: String, input: [String: String]) -> Error? {
      
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileUrl = documentDirectoryUrl.appendingPathComponent(filename + ".json")
        
        do {
            let data = try JSONSerialization.data(withJSONObject: input, options: [])
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
            return error
        }
        return nil
    }
    
    static func readJsonFile(named filename: String) -> [String: String]? {
  
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileUrl = documentsDirectoryUrl.appendingPathComponent(filename + ".json")
        
        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] else { return nil}
            print(dictionary)
            return dictionary
        } catch {
            print(error)
        }
        return nil
    }
    
}
