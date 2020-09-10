//
//  ViewController.swift
//  MusicApp
//
//  Created by MacBook on 9/7/20.
//  Copyright © 2020 Apptive. All rights reserved.
//

import UIKit

class GenreViewController: UITableViewController {

    var genre:[Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadGenre()
        configureNavigationBar()
    }
    
    
    // MARK: - Helpers
    
    private func loadGenre() {
        genre = GenreData.loadGenre()
    }
    
    
    private func configureNavigationBar() {
        navigationItem.title = "Genre"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    private func configureTableView() {
        tableView.register(GenreCell.self, forCellReuseIdentifier: GenreCell.identifier)
    }
    
    
    private func presentController(for genre:Genre) {
        let artistVC = ArtistController()
        artistVC.genre = genre
        navigationController?.pushViewController(artistVC, animated: true)
    }

}


// MARK: - Delegate and Datasource

extension GenreViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genre.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreCell.identifier, for: indexPath) as! GenreCell
        cell.genre = genre[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedGenre = genre[indexPath.row]
        presentController(for: selectedGenre)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
}
