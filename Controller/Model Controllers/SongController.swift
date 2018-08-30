//
//  SongController.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/30/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation


class SongController {
    
    static func addSong(title: String, artist: String, playlist: Playlist) {
        // Line 16 is an instance of song
        let song = Song(title: title, artist: artist)
        PlaylistController.shared.createSong(song: song, from: playlist)
        PlaylistController.shared.save()
    }
    
    
    static func deleteSong(from playlist: Playlist, song: Song) {
        // we want to get a posison of a song ("INDEX")_
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.save()
    }
}

