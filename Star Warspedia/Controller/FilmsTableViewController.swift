//
//  FilmsTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya

class FilmsTableViewController: UITableViewController {

    var films: [Result.Film] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFilms()
    }

    private func fetchFilms() {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()
        fetch.request(.films) { response in
            guard let data = response.value?.data else { return }
            do {
                let result = try decoder.decode(Result.self, from: data)
                self.films = result.films
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row].title
        return cell
    }
}
