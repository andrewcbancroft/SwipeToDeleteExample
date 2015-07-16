//
//  ViewController.swift
//  SwipeToDeleteExample
//
//  Created by Andrew Bancroft on 7/14/15.
//  Copyright (c) 2015 Andrew Bancroft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Team Pluto!"]
    var deletePlanetIndexPath: NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell") as! UITableViewCell
        cell.textLabel?.text = planets[indexPath.row]
        
        return cell
    }
    
    // MARK: UITableViewDelegate Methods
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deletePlanetIndexPath = indexPath
            let planetToDelete = planets[indexPath.row]
            confirmDelete(planetToDelete)
        }
    }
    
    // Delete Confirmation and Handling
    func confirmDelete(planet: String) {
        let alert = UIAlertController(title: "Delete Planet", message: "Are you sure you want to permanently delete \(planet)?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeletePlanet)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeletePlanet)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleDeletePlanet(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deletePlanetIndexPath {
            tableView.beginUpdates()
            
            planets.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deletePlanetIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelDeletePlanet(alertAction: UIAlertAction!) {
        deletePlanetIndexPath = nil
    }
}

