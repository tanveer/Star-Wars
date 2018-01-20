//
//  FilmTableViewCell.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/18/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {

    var film: Film? {
        didSet{
            if let film = film {
                configure(film)
            }
        }
    }

    private func configure(_ film: Film) {
        let openingCraw = "Episode \(film.episode_id)\n\n\(film.opening_crawl)"
        titleLabel.text = film.title.uppercased()
        directorLabel.text = "Director: \(film.director)"
        producerLabel.text = "Producer: \(film.producer)"
        releaseDateLabel.text = "Release date: \(film.releaseDate)"
        openingCrawText.text = openingCraw
    }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var directorLabel: UILabel!
    @IBOutlet private weak var producerLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var openingCrawText: UILabel!
}

extension FilmTableViewCell  {
    static var id: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
