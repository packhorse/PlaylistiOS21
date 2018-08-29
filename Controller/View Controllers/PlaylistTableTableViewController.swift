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
        PlaylistController.shared.create(title: title)

        //Hey table view go do your job again  -Re-run your 2 required methods which are number rows in section and selfforrow at.
        tableView.reloadData()
        playlistTextField.text = ""
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            
            PlaylistController.shared.delete(playlistToDelete: <#T##Playlist#>)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
