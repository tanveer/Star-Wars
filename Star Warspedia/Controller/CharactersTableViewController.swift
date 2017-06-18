//
//  CharactersTableViewController.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import Moya
import SVProgressHUD

private let maxPageNumber = 9
private let startPageNumber = 1
class CharactersTableViewController: UITableViewController {

    var characters: [SWC.Character] = []
    var swc: SWC?
    var page: Int = startPageNumber

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCharacter()
    }

    private func fetchCharacter(_ page: Int = startPageNumber) {
        let decoder = JSONDecoder()
        let fetch = MoyaProvider<SWAPI>()
        SVProgressHUD.show()
        fetch.request(.people(page)) { response in
            guard let data = response.value?.data else {return}
            do {
                let results = try decoder.decode(SWC.self, from: data)
                self.characters += results.characters
                self.tableView.reloadData()
                SVProgressHUD.popActivity()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - startPageNumber && page < maxPageNumber {
            page += startPageNumber
            fetchCharacter(page)
        }
    }
}
