//
//  AlbumTableViewCell.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var numberOfSongsLabel: UILabel!
    
    
 // MARK: - Properties
    var album: AlbumResult?
    
    func updateViews() {
        guard let album = album else { return }
        albumTitleLabel.text = album.albumTitle
        numberOfSongsLabel.text = "Track Count: \(album.trackCount)"
        fetchAlbumImage()
    }
    
    func fetchAlbumImage() {
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
