//
//  Film.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Films: Codable {
    let films: [Film]
    private enum CodingKeys: String, CodingKey {
        case films = "results"
    }
}

struct Film: Codable {
    let title: String
    let director: String
    let episode_id: Int
    let opening_crawl: String
    let producer: String
    let release_date: String
    let url: String
    let species: [String]?
    let starships: [String]?
    let poeples: [String]?
    let vehicles: [String]?
    let planets: [String]?

    var releaseDate: String {
        let calender = Calendar.current
        let componants = release_date.components(separatedBy: "-")
        var calanderComponants = DateComponents()
        calanderComponants.year = Int(componants[0])
        calanderComponants.month = Int(componants[1])
        calanderComponants.day = Int(componants[2])
        let dateString = calender.date(from: calanderComponants)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: dateString!)
    }

    init(jsonData: [String: Any]) {
        self.title = jsonData["title"] as! String
        self.director = jsonData["director"] as! String
        self.episode_id = jsonData["episode_id"] as! Int
        self.opening_crawl = jsonData["opening_crawl"] as! String
        self.producer = jsonData["producer"] as! String
        self.release_date = jsonData["release_date"] as! String
        self.url = jsonData["url"] as! String
        self.planets = []
        self.poeples = []
        self.species = []
        self.vehicles = []
        self.starships = []
    }
}
