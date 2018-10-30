//
//  RacesTableViewController.swift
//  Pokedex
//
//  Created by Daniel Carlander on 30/10/2018.
//  Copyright © 2018 Daniel Carlander. All rights reserved.
//

import UIKit
import WebKit

class RacesTableViewController: UITableViewController {

    var model = PokedexModel()
    var typeIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = model.types[typeIndex].name
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.types[typeIndex].races.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Race Cell", for: indexPath)
        
        let race = model.types[typeIndex].races[indexPath.row]
        
        cell.textLabel?.text = race.name
        cell.detailTextLabel?.text = "\(race.code)"
        cell.imageView?.image = UIImage(named: race.icon)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegue(withIdentifier: "ShowWeb", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rtv = segue.destination as? WebViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        rtv?.raceName = model.types[typeIndex].races[indexPath!.row].name
        self.tableView.deselectRow(at: indexPath!, animated: true)
        
    }
 

}
