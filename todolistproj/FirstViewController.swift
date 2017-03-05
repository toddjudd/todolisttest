//
//  FirstViewController.swift
//  todolistproj
//
//  Created by David T Judd on 3/4/17.
//  Copyright © 2017 Tracer Tech. All rights reserved.
//

import UIKit

var inventoryArray = ["This is your inventory!", "Try swiping left to get rid of items you dont want! <-", "click on add item at the bottom to add a new item to your inventory!"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var inventoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "inventoryArray") != nil {
            inventoryArray = UserDefaults.standard.object(forKey: "inventoryArray") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        inventoryTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "inventoryCell")
        cell.textLabel?.text = inventoryArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            inventoryArray.remove(at: indexPath.row)
            UserDefaults.standard.set(inventoryArray, forKey: "inventoryArray")
            inventoryTable.reloadData()
        }
    }
}

