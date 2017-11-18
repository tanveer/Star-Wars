//
//  ReusableCell.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/4/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class ReusableCell: UITableViewCell {
    var name: String? {
        didSet{
            if let name = name {
                nameLabel.text = name
            }
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
}

extension ReusableCell {
    static var id: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
