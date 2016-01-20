//
//  InterfaceController.swift
//  WCApplicationContext Extension
//
//  Created by Natasha Murashev on 9/20/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, DataSourceChangedDelegate {

    @IBOutlet var foodLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        
        WatchSessionManager.sharedManager.addDataSourceChangedDelegate(self)
        
        super.willActivate()
    }

    override func didDeactivate() {
        
        WatchSessionManager.sharedManager.removeDataSourceChangedDelegate(self)
        
        super.didDeactivate()
    }
    
    // MARK: DataSourceUpdatedDelegate
    func dataSourceDidUpdate(dataSource: DataSource) {
        switch dataSource.item {
        case .Food(let foodItem):
            foodLabel.setText(foodItem)
        case .Unknown:
            foodLabel.setText("¯\\_(ツ)_/¯")
        }
    }

}
