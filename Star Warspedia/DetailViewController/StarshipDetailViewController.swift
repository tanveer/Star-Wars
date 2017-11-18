//
//  StarshipDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class StarshipDetailViewController: UIViewController {

    var starship: Starship?

    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var model: UILabel!
    @IBOutlet private weak var manufacture: UILabel!
    @IBOutlet private weak var costInCredits: UILabel!
    @IBOutlet private weak var length: UILabel!
    @IBOutlet private weak var maxAtmospheringSpeed: UILabel!
    @IBOutlet private weak var crew: UILabel!
    @IBOutlet private weak var passenger: UILabel!
    @IBOutlet private weak var cargoCapacity: UILabel!
    @IBOutlet private weak var consumables: UILabel!
    @IBOutlet private weak var hyperdruveRating: UILabel!
    @IBOutlet private weak var MGLT: UILabel!
    @IBOutlet private weak var starshipClass: UILabel!
    @IBOutlet private weak var pilots: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    private func updateUI() {
        if let starship = starship {
            name.text = starship.name.uppercased()
            model.text = starship.model
            manufacture.text = starship.manufacturer
            costInCredits.text = starship.cost != nil ? "\(starship.cost ?? "0") Galactic Credit" : "N/A"
            length.text = "\(starship.length) Meters"
            maxAtmospheringSpeed.text = starship.speed
            crew.text = starship.crew > "1" ? "\(starship.crew) Crew members" : "\(starship.crew) Crew member"
            cargoCapacity.text = starship.capacity != nil ? "\(starship.capacity ?? "") kg" : "unknown"
            MGLT.text = starship.MGLT.uppercased()
            passenger.text = starship.passengers
            consumables.text = starship.consumables
            starshipClass.text = starship.starshipClass
            hyperdruveRating.text = starship.hyperdriveRating
        }
    }
}
