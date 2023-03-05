//
//  Song.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct SongTopLevelDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case songResult = "results"
        case singleAlbum
    }
    
    let singleAlbum: SingleAlbum
    let songResult: [SongResult]
}

struct SingleAlbum: Decodable {
    private enum CondingKeys: String, CodingKey {
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

struct SongResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case trackName
        case trackTime = "trackTimeMillis"
    }
    
    let trackName: String
    let trackTime: Int
}
