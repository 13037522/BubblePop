//
//  ReadWriteFile.swift
//  BubblePop
//
//  Created by user135601 on 5/6/18.
//  Copyright © 2018 Abdol Vatandoust. All rights reserved.
//

import Foundation
class ReadWriteFile{
    var DocumentDirURL:URL{
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return url
    }
    func fileURL(fileName:String,fileExtension:String) -> URL {
        return DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    func writeFile(writeString:String, to fileName:String, fileExtension:String = "txt"){
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do{
            try writeString.write(to: url,atomically: true, encoding: .utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(url), Error: " + error.localizedDescription)
        }
    }
    func readFile(from fileName:String, fileExtension:String = "txt") ->String{
        var readString = ""
        let url = fileURL(fileName: fileName, fileExtension: fileExtension)
        do{
            readString = try String(contentsOf: url)
        } catch let error as NSError {
            print("Failed reading to URL: \(url), Error: " + error.localizedDescription)
        }
        return readString
    }
}
