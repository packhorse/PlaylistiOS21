//
//  Playlist.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation

// Object A
class Playlist: Equatable, Codable {
    // now we can compare playlist and have access to helper methods 
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        if lhs.title != rhs.title { return false }
        if lhs.songs != rhs.songs { return false }
        return true
    }
    
    
    var title: String
    var songs: [Song] = []
    
    init(title: String, songs: [Song] = []) {
        
        self.title = title
        self.songs = songs
        
    }
}
