//
//  SpeciesDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class SpeciesDetailViewController: UIViewController {

    var species: Species?

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var classificationLabel: UILabel!
    @IBOutlet private weak var designationLabel: UILabel!
    @IBOutlet private weak var averageHeightLabel: UILabel!
    @IBOutlet private weak var skinColorsLabel: UILabel!
    @IBOutlet private weak var hairColorsLabel: UILabel!
    @IBOutlet private weak var eyeColorsLabel: UILabel!
    @IBOutlet private weak var averageLifespanLabel: UILabel!
    @IBOutlet private weak var homeworldLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    private func updateUI() {
        if let species = species {
            nameLabel.text = species.name.uppercased()
            classificationLabel.text = species.classification.capitalized
            designationLabel.text = species.designation.capitalized
            averageHeightLabel.text = "\(species.averageHeight) CM"
            skinColorsLabel.text = species.skinColors.capitalized
            hairColorsLabel.text = species.hairColors.capitalized
            eyeColorsLabel.text = species.eyeColors.capitalized
            averageLifespanLabel.text = species.averageLifespan
            // homeworldLabel.text = species.homeworld?.capitalized
            languageLabel.text = species.language.capitalized
        }
    }
}
