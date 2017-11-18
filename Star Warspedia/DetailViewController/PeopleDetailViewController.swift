//
//  PeopleDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {

    var poeple: People?

    @IBOutlet private weak var poepleLabel: UILabel!
    @IBOutlet private weak var poepleSpeciesLabel: UILabel!
    @IBOutlet private weak var birthYearLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var skinColorLabel: UILabel!
    @IBOutlet private weak var hairColorLabel: UILabel!
    @IBOutlet private weak var eyeColorLabel: UILabel!
    @IBOutlet private weak var massLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    private func updateUI() {
        if let poeple = poeple {
            poepleLabel.text = poeple.name.uppercased()
            genderLabel.text = poeple.gender.capitalized
            birthYearLabel.text = poeple.birthYear
            heightLabel.text = poeple.height.capitalized
            skinColorLabel.text = poeple.skinColor.capitalized
            eyeColorLabel.text = poeple.eyeColor.capitalized
            hairColorLabel.text = poeple.hairColor.capitalized
            massLabel.text = poeple.mass.capitalized
            poepleSpeciesLabel.text = poeple.id
        }
    }
}
