//
//  PlanetDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    var planet: Planet?

    @IBOutlet private weak var planetLabel: UILabel!
    @IBOutlet private weak var rotationPeriodLabel: UILabel!
    @IBOutlet private weak var orbitalPeriodLabel: UILabel!
    @IBOutlet private weak var diameterLabel: UILabel!
    @IBOutlet private weak var climateLabel: UILabel!
    @IBOutlet private weak var gravityLabel: UILabel!
    @IBOutlet private weak var terrainLabel: UILabel!
    @IBOutlet private weak var surfaceWaterLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()

    }

    func updateUI() {
        if let planet = planet {
            planetLabel.text = planet.name
            rotationPeriodLabel.text = "\(planet.rotation ?? "") Hrs"
            orbitalPeriodLabel.text = planet.timeInOrbit ?? "unknown"
            diameterLabel.text = planet.diameter != nil ? "\(planet.diameter ?? "") km" : ""
            climateLabel.text = planet.climate
            gravityLabel.text = "\(planet.gravity) G"
            terrainLabel.text = planet.terrain.capitalized
            surfaceWaterLabel.text = planet.water
            populationLabel.text = planet.population != nil ? planet.population!.convertedToShortString : "N/A"
        }
    }
}
