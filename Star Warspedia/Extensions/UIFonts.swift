//
//  UIFonts.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 7/9/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

extension UIFont {
    class func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }

    class func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)!
    }

    class func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
}
