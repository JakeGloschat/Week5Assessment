//
//  ArtistDiscogTableViewController.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import UIKit

class ArtistDiscogTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var artistSearchBar: UISearchBar!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var numberOfSongsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Properties
    var albums: [AlbumResult]? = []
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let albums = albums else { return 0 }
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
