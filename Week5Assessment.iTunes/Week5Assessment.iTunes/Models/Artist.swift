//
//  Artist.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct ArtistTopLevelDictionary: Decodable {
    let albumResults: [AlbumResult]
}

struct AlbumResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case albumTitle = "collectionName"
        case trackCount
        case albumPrice = "collectionPrice"
        case releaseDate
        case imageURL = "artworkUrl100"
        case collectionId
    }
    
    let albumTitle: String
    let trackCount: Int
    let albumPrice: Double
    let releaseDate: String
    let imageURL: String
    let collectionId: Int
}
