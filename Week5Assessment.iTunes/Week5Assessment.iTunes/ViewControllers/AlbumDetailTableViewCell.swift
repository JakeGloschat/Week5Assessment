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
    
    var song: Song?
    
    func convert()  {
        guard let song = song else { return }
        let minutes = Int(song.trackTime ?? 0) % 600000
        return song
    }
    
    func updateViews() {
        guard let song = song else { return }
        let minutes = (song.trackTime ?? 0) % 600000
        trackNameLabel.text = song.trackName
        trackLengthLabel.text = "\(minutes)"

    }
}
