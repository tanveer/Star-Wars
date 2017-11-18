//
//  VeihcleDetailViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/1/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class VeihcleDetailViewController: UIViewController {

    var vehicle: Vehicle?

    @IBOutlet private weak var model: UILabel!
    @IBOutlet private weak var manufacture: UILabel!
    @IBOutlet private weak var costInCredits: UILabel!
    @IBOutlet private weak var length: UILabel!
    @IBOutlet private weak var maxAtmospheringSpeed: UILabel!
    @IBOutlet private weak var crew: UILabel!
    @IBOutlet private weak var passenger: UILabel!
    @IBOutlet private weak var cargoCapacity: UILabel!
    @IBOutlet private weak var consumables: UILabel!
    @IBOutlet private weak var vechileClass: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    private func updateUI() {
        if let vehicle = self.vehicle {
            nameLabel.text = vehicle.name.uppercased()
            model.text = vehicle.model
            manufacture.text = vehicle.manufacturer
            costInCredits.text = vehicle.cost != nil ? "\(vehicle.cost ?? "0") Galactic Credit" : "N/A"
            length.text = "\(vehicle.length) meters"
            maxAtmospheringSpeed.text = vehicle.speed
            crew.text = vehicle.crew > "1" ? "\(vehicle.crew) Crew members" : "\(vehicle.crew) Crew member"
            cargoCapacity.text = vehicle.capacity != nil ? "\(vehicle.capacity ?? "") kg" : "unknown"
            vechileClass.text = "\(vehicle.vechileClass)".capitalized
            consumables.text = "\(vehicle.consumables)"
            passenger.text = "\(vehicle.passengers)"
        }
    }
}
