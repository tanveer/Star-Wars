//
//  Path.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

enum Path {
    case films
    case people(Int)
    case planets(Int)
    case species(Int)
    case starships(Int)
    case vehicles(Int)
    case speciesId(String)
}
