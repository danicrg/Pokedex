//
//  TypesTableViewController.swift
//  Pokedex
//
//  Created by Daniel Carlander on 25/10/2018.
//  Copyright © 2018 Daniel Carlander. All rights reserved.
//

import UIKit

class TypesTableViewController: UITableViewController {

    var model = PokedexModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tipos de Pokedex"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.types.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Type Cell", for: indexPath) as! TypesTableViewCell
        
        let type = model.types[indexPath.row]
        
                cell.typeLabel?.text = type.name
                cell.racesLabel?.text = "\(type.races.count) razas"
                cell.typeImage?.image = UIImage(named: type.icon)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegue(withIdentifier: "ShowRacesSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rtv = segue.destination as? RacesTableViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        rtv?.typeIndex = indexPath!.row
        self.tableView.deselectRow(at: indexPath!, animated: true)
        
    }
 

}
