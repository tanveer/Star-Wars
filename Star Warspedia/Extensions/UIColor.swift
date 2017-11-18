//
//  UIColor.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 7/9/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

extension UIColor {
    class var SWOrange: UIColor {
        return RGB(255, 128, 0)
    }

    class var SWBlack: UIColor {
        return RGB(0)
    }

    class var SWGray: UIColor {
        return RGB(85)
    }

    class var SWOffBlack: UIColor {
        return RGB(28)
    }
}


// MARK: - Functions

func RGB(_ white: CGFloat) -> UIColor {
    return UIColor(white: white/255, alpha: 1)
}

func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    return RGBA(red, green, blue, 1)
}

func RGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}
