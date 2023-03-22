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
    
    func conversion(song: Song) -> String {
        guard let totalTrackTime = song.trackTime else { return ""}
        let totalSeconds = totalTrackTime/1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        if seconds < 10 {
            let secondString = "0\(seconds)"
            return "\(minutes):\(secondString)"
        }
        return("\(minutes):\(seconds)")
    }
    
    
    
    func updateViews() {
        guard let song = song else { return }
        let trackTimeAsString = conversion(song: song)
        trackNameLabel.text = song.trackName
        trackLengthLabel.text = trackTimeAsString
    }
}
