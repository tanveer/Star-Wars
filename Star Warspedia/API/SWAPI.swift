//
//  SWAPI.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation
import Moya

enum SWAPI {
    case films
    case people(Int)
    case planets(Int)
    case species(Int)
    case starships(Int)
    case vehicles(Int)
}

extension SWAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .films:
            return Root.films
        case .people:
            return Root.people
        case .planets:
            return Root.planets
        case .species:
            return Root.species
        case .starships:
            return Root.starships
        case .vehicles:
            return Root.vehicles
        }
    }

    var path: String {
        switch self {
        case .films: break
        case .people: break
        case .planets: break
        case .species: break
        case .starships: break
        case .vehicles: break
        }
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String : Any]? {

        switch self {
        case .people(let page):
            return ["page": "\(page)"]
        case .films: break
        case .planets(let page):
            return ["page": "\(page)"]
        case .species(let page):
             return ["page": "\(page)"]
        case .starships(let page):
             return ["page": "\(page)"]
        case .vehicles(let page):
            return ["page": "\(page)"]
        }
        return [:]
    }

    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var sampleData: Data {
        return """
                {
                "error": "Failed to fetch from SWAPI server"
                }
                """.data(using: .utf8)!
    }

    var task: Task {
        return .request
    }

}
