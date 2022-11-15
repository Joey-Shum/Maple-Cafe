//
//  MenuViewController.swift
//  Maple Cafe
//
//  Created by Joey Shum on 26/10/2018.
//  Copyright © 2018 Joey Shum. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenuViewController: UIViewController {
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    let productArray = ["muffin", "Croissant"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productArray.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = productArray[indexPath.row]
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let date = NSDate()
        
        //let product = "\(label.text!)"
        let product = "\(productArray)"
        let time = "\(date)"

        let shortTeaButton: [String: AnyObject] = ["product": product as AnyObject,
                                         "time": time as AnyObject]
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(shortTeaButton)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //databaseRefer = Database.database().reference()
        //databaseRefer.child("Users").childByAutoId().setValue("Person 1")
        
    }
}
