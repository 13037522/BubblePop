//
//  ReadWriteJson.swift
//  BubblePop
//
//  Created by user135601 on 5/7/18.
//  Copyright © 2018 Abdol Vatandoust. All rights reserved.
//

import UIKit
var gameJSON = """
{
    "playerName":"Your name",
    "maxBubbles": 15,
    "timeLimit": 60,
    "highScore": 1
    }
""".data(using: .utf8)

struct  scoreRecord : Codable {
    var playerName: String
    var maxBubbles: Int
    var timeLimit: Int
    var highScore: Int
}
let decoder = JSONDecoder()
let ScoreRecord  = try? decoder.decode(scoreRecord.self , from: gameJSON!)


class ReadWriteJson{
    
        func saveData(records: [ScoreRecord]) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,  in: .userDomainMask).first!
        let archiveURL =    documentsDirectory.appendingPathComponent("high_scores").appendingPathExtension("json")
        do {
            let data = try JSONEncoder().encode(records)
            try data.write(to: archiveURL, options: .noFileProtection)
        }
        catch {
            print("Error saving data")
        }
    }

    func loadData() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,  in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("high_scores").appendingPathExtension("json")
        let jsonDecoder = JSONDecoder()
        if let highScoresData = try? Data(contentsOf: archiveURL),
            let decodedHighScores = try? jsonDecoder.decode([ScoreRecord].self, from: highScoresData){
              self.records = decodedHighScores
              self.tableView.reloadData()
        }
      }
}
