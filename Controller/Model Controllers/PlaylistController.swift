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
    
    init() {
        self.playlists = load()
    }
    
    // Create
    // This creates a brand new playlist - and adds it to our Source of truth
    func createPlaylist(title: String) {
        // line 28 is an instance of playlist
        let playlist = Playlist.init(title: title)
        playlists.append(playlist)
        save()
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
        save()
    }
    
    
    
    // Mark: - Save and load
    
    
    // This is our train track to where we can save
    func fileURL() -> URL? {
        //This is the class where we are saving to
        //This is saving to the actual device.
        let fileManager = FileManager.default
        //This is the locations of where we can save it
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        //This is the one location (path)
        guard let url = urls.first else { return nil }
        //This is our custom path
        let playlistPath = "playlistsApp.json"
        //AppendingPathComponent is a /
        let destinationURL = url.appendingPathComponent(playlistPath)
        print("\(destinationURL)")
        return destinationURL
    }
    
    func save() {
        //You have to create an instacne of JSONEncoder to get access to it's instance methods
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(playlists)
            guard let fileUrl = fileURL() else { return }
            try data.write(to: fileUrl)
            
        } catch let error {
            print("Error saving to file \(#function) \(error.localizedDescription)")
        }
    }
    
    func load() -> [Playlist] {
        
        let decoder = JSONDecoder()
        
        do {
            guard let fileUrl = fileURL() else { return [] }
            
            let data = try Data(contentsOf: fileUrl)
            let playlists = try decoder.decode([Playlist].self, from: data)
            return playlists
        } catch let error {
            print("Error loading playlist \(error) \(error.localizedDescription)")
            return []
        }
        
        
    }
}














