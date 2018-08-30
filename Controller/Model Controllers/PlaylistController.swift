//
//  PlaylistController.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

// 1st Step: CRUD
// 2nd Step: Singelton (Allows us to do a shared instance)
// 3rd Step: Source of Truth (Allows us to populate our content)

import Foundation

class PlaylistController {
    
    
    // Singelton design pattern - We create one initialized class sl we can access it throuought our project
    
    static let shared = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] = []
    
    // Create
    // This creates a brand new playlist - and adds it to our Source of truth
    func createPlaylist(title: String) {
        // line 28 is an instance of playlist
        let playlist = Playlist.init(title: title)
        playlists.append(playlist)
    }
    
    // Read
    
    func createSong(song: Song, from playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    // Update
    
    // Delete
    func delete(playlistToDelete: Playlist) {
    
        guard let index = playlists.index(of: playlistToDelete) else { return }
        playlists.remove(at: index)
    }
}










