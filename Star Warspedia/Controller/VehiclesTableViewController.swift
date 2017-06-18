//
//  VehiclesTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya

private let startPageNumber = 1
private let maxPageNumber = 4
class VehiclesTableViewController: UITableViewController {

    private var vehicles: [Vehicle.Result] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fethVehicle()

    }

    private func fethVehicle(_ page: Int = startPageNumber) {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()
        fetch.request(.vehicles(page)) { response in
            guard let data = response.value?.data else {return}
            do {
                let results = try decoder.decode(Vehicle.self, from: data)
                self.vehicles += results.vehicles
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell", for: indexPath)
        cell.textLabel?.text = vehicles[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == vehicles.count - startPageNumber && page < maxPageNumber {
            fethVehicle(page)
            page += startPageNumber
        }
    }
}
