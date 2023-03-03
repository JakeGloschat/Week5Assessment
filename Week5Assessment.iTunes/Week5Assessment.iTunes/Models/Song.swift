//
//  Song.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct SongTopLevelDictionary: Decodable {
    let songResult: [SongResult]
}

struct SongResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case trackName
        case trackTime = "trackTimeMillis"
    }
    
    let trackName: String
    let trackTime: Int
}
