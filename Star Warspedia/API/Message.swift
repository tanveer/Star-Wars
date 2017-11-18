//
//  Message.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation


class Message {

    class func log(_ error: Error?){
        var message = "Error downloading: "
        if let error = error {
            message.append(error.localizedDescription)
        }
        print(message)
    }

    class func loadError(in vc: String) {
        print("Error loading more data in \(vc)")
    }

    static var invalidUrl: String {
        return "invalid URL! 'unable to get url from path' "
    }
}
