//
//  StartshipsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya

private let maxPageNumber = 4
private let startPageNumber = 1

class StartshipsTableViewController: UITableViewController {

    private var starships: [Starship.Result] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchStarships()
    }

    private func fetchStarships(_ page: Int = startPageNumber) {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()

        fetch.request(.starships(page)) { response in
            guard let data = response.value?.data else { return }
            do {
                let results = try decoder.decode(Starship.self, from: data)
                self.starships += results.starships
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starships.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath)
        cell.textLabel?.text = starships[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == starships.count - startPageNumber && page < maxPageNumber {
            fetchStarships(page)
            page += startPageNumber
        }
    }
}
