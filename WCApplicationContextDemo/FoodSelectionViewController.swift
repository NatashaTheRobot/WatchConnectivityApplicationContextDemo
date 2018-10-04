//
//  FoodSelectionViewController.swift
//  WCApplicationContextDemo
//
//  Created by Natasha Murashev on 9/20/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class FoodSelectionViewController: UITableViewController {

    fileprivate let food = ["🍦", "🍮", "🍤","🍉", "🍨", "🍏", "🍌", "🍰", "🍚", "🍓", "🍪", "🍕"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell

        cell.configure(withText: food[indexPath.row])

        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodItem = food[indexPath.row]
        do {
            try WatchSessionManager.sharedManager.updateApplicationContext(["food" : foodItem as AnyObject])
        } catch {
            let alertController = UIAlertController(title: "Oops!", message: "Looks like your \(foodItem) got stuck on the way! Please send again!", preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
        }
    }

}
