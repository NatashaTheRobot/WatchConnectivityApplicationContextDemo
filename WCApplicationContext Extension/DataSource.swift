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
        case Food(String)
        case Unknown
    }
    
    init(data: [String : AnyObject]) {
        if let foodItem = data["food"] as? String {
            item = Item.Food(foodItem)
        } else {
            item = Item.Unknown
        }
    }
}
