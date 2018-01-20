//
//  PlanetsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

private let maxPageNumber = 7

class PlanetsTableViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.register(ReusableCell.nib, forCellReuseIdentifier: ReusableCell.id)
        }
    }

    private var planets: [Planet] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPlanets()
        self.title = "planets".uppercased()
    }

    private func fetchPlanets() {
        Progress.show
        SWAPI.requestPlanets(from: .planets(self.page)) { planets in
            self.planets = planets
            OperationQueue.main.addOperation {[unowned self] in
                self.tableView.reloadData()
                Progress.dismiss
            }
        }
    }
    
    private func loadMoreData() {
        if page < maxPageNumber {
            page += startPageNumber
            SWAPI.requestPlanets(from: .planets(self.page)) { planets in
                self.planets += planets
                OperationQueue.main.addOperation { [unowned self] in
                    self.tableView.reloadData()
                }
            }
        } else {
            Message.loadError(in: (String(describing: type(of: self))))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlanetDetailViewController" {
            if let dvc = segue.destination as? PlanetDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    dvc.planet = planets[indexPath.row]
                }
            }
        }
    }
}

extension PlanetsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.id, for: indexPath) as! ReusableCell
        cell.name = planets[indexPath.row].name
        return cell
    }
}

extension PlanetsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = planets.count-1
        if indexPath.row == lastElement {
            loadMoreData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PlanetDetailViewController", sender: nil)
    }
}
