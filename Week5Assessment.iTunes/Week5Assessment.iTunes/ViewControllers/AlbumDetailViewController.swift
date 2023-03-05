//
//  AlbumDetailViewController.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/4/23.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var albumPriceLabel: UILabel!
    @IBOutlet weak var songDetailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songDetailTableView.dataSource = self
        songDetailTableView.delegate = self
        updateUI()
    }
    
    // MARK: - Properties
    var songs: [SongResult]? = []
    var singleAlbum: SingleAlbum?
    var album: AlbumResult?
    // MARK: - Functions

    func updateUI() {
        guard let album = album else { return }
        albumNameLabel.text = album.albumTitle
        releaseDateLabel.text = album.releaseDate
        albumPriceLabel.text = "$\(album.albumPrice)"
        songDetailTableView.reloadData()
        fetchAlbumImage()
    }
    
    func fetchAlbumImage () {
        guard let album = album else { return }
        NetworkController.fetchImage(for: album.imageURL) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async { self?.albumImageView.image = image }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unkownError)
            }
        }
    }
}

extension AlbumDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let songs = songs else { return 0 }
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as? AlbumDetailTableViewCell else { return UITableViewCell() }
        guard let songs = songs?[indexPath.row] else { return UITableViewCell() }
        cell.song = songs
        cell.updateViews()
        return cell
    }
}
