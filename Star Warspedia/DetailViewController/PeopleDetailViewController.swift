//
//  PeopleDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {

    var people: People?

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
        if let people = people {
            poepleLabel.text = people.name.uppercased()
            genderLabel.text = people.gender.capitalized
            birthYearLabel.text = people.birthYear
            heightLabel.text = people.height.capitalized
            skinColorLabel.text = people.skinColor.capitalized
            eyeColorLabel.text = people.eyeColor.capitalized
            hairColorLabel.text = people.hairColor.capitalized
            massLabel.text = people.mass.capitalized
            poepleSpeciesLabel.text = people.id
        }
    }
}
