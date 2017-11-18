//
//  VehiclesTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

private let maxPageNumber = 4

class VehiclesTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 150
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.register(ReusableCell.nib, forCellReuseIdentifier: ReusableCell.id)
        }
    }
    
    private var vehicles: [Vehicle] = []
    private var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchVehicles()
        self.title = "VEHICLES"
    }

    private func fetchVehicles() {
        Progress.show
        SWAPI.requestVehicles(with: .vehicles(1)) { (vehicles) in
            self.vehicles = vehicles
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                Progress.dismiss
            }
        }
    }
    
    private func loadMoreData() {
        if page < maxPageNumber {
            page += startPageNumber
            SWAPI.requestVehicles(with: .vehicles(1)) { (vehicles) in
                self.vehicles += vehicles
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        } else {
            Message.loadError(in: String(describing: type(of: self)))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VeihcleDetailViewController" {
            if let dvc = segue.destination as? VeihcleDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    dvc.vehicle = vehicles[indexPath.row]
                }
            }
        }
    }
}

extension VehiclesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReusableCell.id, for: indexPath) as! ReusableCell
        cell.name = vehicles[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = vehicles.count-1
        if indexPath.row == lastElement {
            loadMoreData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VeihcleDetailViewController", sender: nil)
    }
}
