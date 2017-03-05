//
//  SecondViewController.swift
//  todolistproj
//
//  Created by David T Judd on 3/4/17.
//  Copyright © 2017 Tracer Tech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var inputInventory: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addInventory(_ sender: Any) {
        inventoryArray.append(inputInventory.text!)
        UserDefaults.standard.set(inventoryArray, forKey: "inventoryArray")
        self.resignFirstResponder()
        inputInventory.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

