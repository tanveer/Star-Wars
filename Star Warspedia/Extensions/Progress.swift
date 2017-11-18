//
//  Progress.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/14/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import SVProgressHUD

class Progress {

    static var show: Void {
        return SVProgressHUD.show()
    }
    static var dismiss: Void {
        return SVProgressHUD.dismiss()
    }
}
