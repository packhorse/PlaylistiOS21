//
//  Playlist.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation

class Playlist {
    
    var title: String
    var songs: [Song] = []
    
    init(title: String, songs: [Song] = []) {
    
    self.title = title
    self.songs = songs
    
}
}
