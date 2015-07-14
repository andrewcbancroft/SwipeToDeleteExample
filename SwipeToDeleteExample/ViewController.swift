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
    
    let planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Team Pluto!"]
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
            let planetToDelete = planets[indexPath.row]
            confirmDelete(planetToDelete)
        }
    }
    
    func confirmDelete(planet: String) {
        let alert = UIAlertController(title: "Delete Planet", message: "Are you sure you want to permanently delete \(planet)?", preferredStyle: .ActionSheet)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeletePlanet)
        alert.addAction(CancelAction)
        alert.addAction(DeleteAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleDeletePlanet(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deletePlanetIndexPath {
            
        }
    }
}

