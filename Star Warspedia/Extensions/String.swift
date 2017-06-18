//
//  String.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

extension String {
    var url: URL {
       return URL(string: self)!
    }
}
