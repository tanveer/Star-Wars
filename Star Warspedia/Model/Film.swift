//
//  Film.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Result: Codable {
    struct Film: Codable {
        let title: String
        let director: String
        let episode_id: Int
        let opening_crawl: String
        let producer: String
        let release_date: String
        let url: String
        let species: [String]
        let starships: [String]
        let characters: [String]
        let vehicles: [String]
        let planets: [String]
    }
    let films: [Film]

    private enum CodingKeys: String, CodingKey {
        case films = "results"
    }
}


/*
 {
 "characters": [
 "http://swapi.co/api/people/1/",
 ...
 ],
 "created": "2014-12-10T14:23:31.880000Z",
 "director": "George Lucas",
 "edited": "2014-12-12T11:24:39.858000Z",
 "episode_id": 4,
 "opening_crawl": "It is a period of civil war.\n\nRebel spaceships, striking\n\nfrom a hidden base, have won\n\ntheir first victory against\n\nthe evil Galactic Empire.\n\n\n\nDuring the battle, Rebel\n\nspies managed to steal secret\r\nplans to the Empire's\n\nultimate weapon, the DEATH\n\nSTAR, an armored space\n\nstation with enough power\n\nto destroy an entire planet.\n\n\n\nPursued by the Empire's\n\nsinister agents, Princess\n\nLeia races home aboard her\n\nstarship, custodian of the\n\nstolen plans that can save her\n\npeople and restore\n\nfreedom to the galaxy....",
 "planets": [
 "http://swapi.co/api/planets/1/",
 ...
 ],
 "producer": "Gary Kurtz, Rick McCallum",
 "release_date": "1977-05-25",
 "species": [
 "http://swapi.co/api/species/1/",
 ...
 ],
 "starships": [
 "http://swapi.co/api/starships/2/",
 ...
 ],
 "title": "A New Hope",
 "url": "http://swapi.co/api/films/1/",
 "vehicles": [
 "http://swapi.co/api/vehicles/4/",
 ...
 ]
 }

 */

