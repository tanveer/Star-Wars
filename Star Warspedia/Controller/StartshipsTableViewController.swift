//
//  StartshipsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

private let maxPageNumber = 4

class StartshipsTableViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.register(ReusableCell.nib, forCellReuseIdentifier: ReusableCell.id)
        }
    }

    private var starships: [Starship] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchStarships()

        self.title = "STARSHIPS"
    }

    private func fetchStarships() {
        Progress.show
        SWAPI.requestStartships(with: .starships(self.page)) { starships in
            self.starships = starships
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                Progress.dismiss
            }
        }
    }

    private func loadMoreData() {
        if page < maxPageNumber {
            page += startPageNumber
            SWAPI.requestStartships(with: .starships(self.page)) { starships in
                self.starships += starships
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        } else {
            Message.loadError(in: (String(describing: type(of: self))))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StarshipDetailViewController" {
            if let dvc = segue.destination as? StarshipDetailViewController {
                if let indexPath =  tableView.indexPathForSelectedRow {
                    dvc.starship = starships[indexPath.row]
                }
            }
        }
    }
}

 // MARK: - UITableViewDataSource

extension StartshipsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starships.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.id, for: indexPath) as! ReusableCell
        cell.name = starships[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension StartshipsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = starships.count-1
        if indexPath.row == lastElement {
            loadMoreData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "StarshipDetailViewController", sender: nil)
    }
}
