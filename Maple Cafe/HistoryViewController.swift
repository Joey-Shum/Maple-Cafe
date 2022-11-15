//
//  HistoryViewContollerViewController.swift
//  Maple Cafe
//
//  Created by Joey Shum on 12/10/2018.
//  Copyright © 2018 Joey Shum. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
/*
struct postStruct {
    
    let title: String!
    let message: String!

}
 */

class HistoryViewContollerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [postStruct]()
    
    let itemArray = ["dog", "cat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseRef = Database.database().reference()
        databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
            
            snapshot in
            /*
            let title = snapshot.value!["title"] as !String
            let message = snapshot.value!["message"] as !String
            posts.insert(postStruct(title: title, message: message), atIndex: 0)
            */
            
        })
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberofRowsInSection section: Int) -> Int {
        
        //return itemArray.count
        return posts.count
        
    }
  /*
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        self.tableView.reloadData()
        
        var cell = tableView.dequeueReusableCellWithIdentifier(withIdentifier: "Cell")
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].title
        
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text = posts[indexPath.row].message
        
 
        return cell!
 */
        
    }


