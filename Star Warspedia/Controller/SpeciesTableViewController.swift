//
//  SpeciesTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

private let maxPageNumber = 4

class SpeciesTableViewController: UIViewController {

    private var species: [Species] = []
    private var page: Int = startPageNumber
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.register(ReusableCell.nib, forCellReuseIdentifier: ReusableCell.id)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchSpecies()
        self.title = "SPECIES"
    }

    private func fetchSpecies() {
        Progress.show
        SWAPI.requestSpecies(with: .species(self.page)) { species in
            self.species = species
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                Progress.dismiss
            }
        }
    }

    private func loadMoreData() {
        if page < maxPageNumber {
            page += startPageNumber
            SWAPI.requestSpecies(with: .species(self.page)) { species in
                self.species += species
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        } else {
            Message.loadError(in: (String(describing: type(of: self))))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpeciesDetailViewController" {
            if let dvc = segue.destination as? SpeciesDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    dvc.species = species[indexPath.row]
                }
            }
        }
    }
}
extension SpeciesTableViewController: UITableViewDataSource {


    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return species.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.id, for: indexPath) as! ReusableCell
        cell.name = species[indexPath.row].name
        return cell
    }
}

extension SpeciesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = species.count-1
        if indexPath.row == lastElement {
            loadMoreData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SpeciesDetailViewController", sender: nil)
    }
}
