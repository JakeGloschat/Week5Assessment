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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }
        guard let albums = albums?[indexPath.row] else { return UITableViewCell() }
        cell.updateViews(album: albums)
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension ArtistDiscogTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkController.fetchAllAlbums(searchArtist: searchText) { result in
            switch result {
            case .success(let albums):
                self.albums = albums
                DispatchQueue.main.async { self.tableView.reloadData() }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unkownError)
            }
        }
    }
}
