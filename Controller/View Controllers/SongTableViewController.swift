//
//  SongTableViewController.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    @IBOutlet weak var artistTextLabel: UITextField!
    @IBOutlet weak var songTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var playlist: Playlist?
    
    @IBAction func songButtonTapped(_ sender: Any) {
        guard let artistFromTextField = artistTextLabel.text,
            let songFromTextField = songTextLabel.text,
            let playlist = playlist, artistFromTextField != "",
            !songFromTextField.isEmpty else { return }
        
        
        SongController.addSong(title: songFromTextField, artist: artistFromTextField, playlist: playlist)
        
        tableView.reloadData()
        artistTextLabel.text = ""
        songTextLabel.text = ""
    }
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        guard let playlist = playlist else { return 0 }
        
        // nil-coalescing operator if there is a value use it on the left side if not give it a default value
        return playlist?.songs.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        
        // This is one song fopr each indidual cell
        let song = playlist?.songs[indexPath.row] 
        
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist
        
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let playlist = playlist else { return }
            let song = playlist.songs[indexPath.row]
            SongController.deleteSong(from: playlist, song: song)
            // hey you, table view go do your job again. re-run your data source.
            tableView.reloadData()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}









