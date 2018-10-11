//
//  DataSource.swift
//  WCApplicationContextDemo
//
//  Created by Natasha Murashev on 9/24/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

struct DataSource {
    
    let item: Item
    
    enum Item {
        case food(String)
        case unknown
    }
    
    init(data: [String : AnyObject]) {
        if let foodItem = data["food"] as? String {
            item = Item.food(foodItem)
        } else {
            item = Item.unknown
        }
    }
}
