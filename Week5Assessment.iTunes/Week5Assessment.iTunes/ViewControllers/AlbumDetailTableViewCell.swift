//
//  AlbumDetailTableViewCell.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/4/23.
//

import UIKit

class AlbumDetailTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackLengthLabel: UILabel!
    
    var song: SongResult?
    
    func updateViews() {
        guard let song = song else { return }
        trackNameLabel.text = song.trackName
        trackLengthLabel.text = "\(song.trackTime)"
    }
    
}
