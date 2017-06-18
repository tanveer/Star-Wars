//
//  PlanetsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya
import SVProgressHUD

private let maxPageNumber = 7
private let startingPageNumber = 1
class PlanetsTableViewController: UITableViewController {

    private var planets: [Planet.Result] = []
    private var page: Int = startingPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPlanet()
    }

    private func fetchPlanet(_ page: Int = startingPageNumber) {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()
        SVProgressHUD.show()
        fetch.request(.planets(page)) { response in
            guard let data = response.value?.data else {return}
            do {
                let planets = try decoder.decode(Planet.self, from: data)
                self.planets += planets.planets
                self.tableView.reloadData()
                SVProgressHUD.popActivity()
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath)
        cell.textLabel?.text = planets[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == planets.count - startingPageNumber && page < maxPageNumber {
            page += startingPageNumber
            fetchPlanet(page)
        }
    }
}
