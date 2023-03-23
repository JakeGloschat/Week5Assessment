//
//  Constants.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct Constants {
    
    struct ArtistDiscogURL {
        static let artistAlbumBaseURL = "https://itunes.apple.com/"
        static let searchArtistPath = "search"
        static let lookUpSongPath = "lookup"
    }
    
    struct APIQueryKey {
        static let artistQueryKey = "term"
        static let albumQueryKey = "entity"
        static let albumQueryValue = "album"
        static let songQueryKey = "entity"
        static let songQueryValue = "song"
        static let idQueryKey = "id"
    }
    
    struct Error {
        static let unkownError = "Unkown Error At This Time."
    }
}
