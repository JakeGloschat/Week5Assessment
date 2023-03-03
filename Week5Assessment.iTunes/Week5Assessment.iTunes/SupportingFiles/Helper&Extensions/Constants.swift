//
//  Constants.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct Constants {
    
    struct ArtistDiscogURL {
        static let artistAlbumBaseURL = "https://itunes.apple.com/search"
        static let songBaseURL = "https://itunes.apple.com/lookup?entity=song"
    }
    
    struct APIQueryKey {
        static let artistQueryKey = "term"
        static let albumQueryKey = "entity"
        static let albumQueryValue = "album"
        static let songQueryKey = "id"
    }
}
