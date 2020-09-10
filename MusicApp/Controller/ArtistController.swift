//
//  PlayerController.swift
//  MusicApp
//
//  Created by MacBook on 9/7/20.
//  Copyright © 2020 Apptive. All rights reserved.
//

import UIKit


class ArtistController: UITableViewController {
    
    // MARK: - Properties
    
    var genre : Genre?
    var artists : [Artist] = []

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.loadArtist(for: genre) { artists in
            self.artists = artists
            self.tableView.reloadDataOnMainThread()
        }
        
    }
    
    // MARK: - Helper
    
    private func configureNavigationBar() {
        let genreName = genre?.name ?? ""
        navigationItem.title =  genreName + " Artist"
    }
    
    
    private func configureTableView() {
        tableView.register(ArtistCell.self, forCellReuseIdentifier: ArtistCell.identifier)
    }
    
   
}


// MARK: - Delegate And Datasource

extension ArtistController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistCell.identifier, for: indexPath) as! ArtistCell
        cell.artist = artists[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
