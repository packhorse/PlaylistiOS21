//
//  PlaylistTableTableViewController.swift
//  PlaylistPractice2
//
//  Created by Porter Frazier on 8/29/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import UIKit

class PlaylistTableTableViewController: UITableViewController {
    
    
    @IBOutlet weak var playlistTextField: UITextField!
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let title = playlistTextField.text, title != "" else { return }
        PlaylistController.shared.createPlaylist(title: title)
        
        //Hey table view go do your job again  -Re-run your 2 required methods which are number rows in section and selfforrow at.
        tableView.reloadData()
        playlistTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
    }
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.title
        if playlist.songs.count == 1 {
            cell.detailTextLabel?.text = " \(playlist.songs.count) Song"
        } else {
            cell.detailTextLabel?.text = " \(playlist.songs.count) Song's"
        }
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            
            PlaylistController.shared.delete(playlistToDelete: playlist)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func createSong(song: Song, fromA playlist: Playlist) {
        
        playlist.songs.append(song)
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //1. check the cell ID
        if segue.identifier == "toSongDetail" {
            //2. get your destination
            let destinationVC = segue.destination as?
            SongTableViewController
            //3. get the users selected row
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            //4. get your object AKA a playlist
            let playlistSelectedByUser = PlaylistController.shared.playlists[indexPath.row]
            //5. pass the info to your
            destinationVC?.playlist = playlistSelectedByUser
            
        }
        
        
    }
}
