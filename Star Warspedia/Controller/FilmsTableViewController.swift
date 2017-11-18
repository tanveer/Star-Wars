//
//  FilmsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    private var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFilms()

        self.title = "FILMS"
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(FilmTableViewCell.nib, forCellReuseIdentifier: FilmTableViewCell.id)
    }

    private func fetchFilms() {
        Progress.show
        SWAPI.requestFilms(with: .films) { (films) in
            self.films = films
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                Progress.dismiss
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.id, for: indexPath) as! FilmTableViewCell
        cell.configure(films[indexPath.row])
        return cell
    }
}
