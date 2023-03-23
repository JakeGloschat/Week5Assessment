//
//  Song.swift
//  Week5Assessment.iTunes
//
//  Created by Jake Gloschat on 3/3/23.
//

import Foundation

struct SongTopLevelDictionary: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    private enum CodingKeys: String, CodingKey {
        case trackName
        case trackTime = "trackTimeMillis"
        case wrapperType
    }
    
    let trackName: String?
    let trackTime: Int?
    let wrapperType: String

}

