//
//  FoodSelectionViewController.swift
//  WCApplicationContextDemo
//
//  Created by Natasha Murashev on 9/20/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class FoodSelectionViewController: UITableViewController {

    private let food = ["🍦", "🍮", "🍤","🍉", "🍨", "🍏", "🍌", "🍰", "🍚", "🍓", "🍪", "🍕"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelTableViewCell", forIndexPath: indexPath) as! LabelTableViewCell

        cell.configure(withText: food[indexPath.row])

        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let foodItem = food[indexPath.row]
        do {
            try WatchSessionManager.sharedManager.updateApplicationContext(["food" : foodItem])
        } catch {
            let alertController = UIAlertController(title: "Oops!", message: "Looks like your \(foodItem) got stuck on the way! Please send again!", preferredStyle: .Alert)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

}
