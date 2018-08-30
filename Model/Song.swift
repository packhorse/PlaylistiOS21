//
//  Song.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation

//Object B
class Song: Codable, Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        if lhs.title != rhs.title { return false}
        if lhs.artist != rhs.artist { return false}
         return true
    }
    
    
    var title: String
    var artist: String
    
    init(title: String, artist: String) {
        
        self.title = title
        self.artist = artist
    }
}


