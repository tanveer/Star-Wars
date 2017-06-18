//
//  SpeciesTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya

private let maxPageNumber = 4
private let startPageNumber = 1

class SpeciesTableViewController: UITableViewController {

    private var species: [Species.Result] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fethSpecies()
    }

    private func fethSpecies(_ page: Int = startPageNumber) {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()
        fetch.request(.species(page)) { response in
            guard let data = response.value?.data else {return}
            do {
                let results = try decoder.decode(Species.self, from: data)
                self.species += results.species
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return species.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeciesCell", for: indexPath)
        cell.textLabel?.text = species[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == species.count - startPageNumber && page < maxPageNumber {
            fethSpecies(page)
            page += startPageNumber
        }
    }
}
