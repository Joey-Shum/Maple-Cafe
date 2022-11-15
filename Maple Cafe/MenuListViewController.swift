
//
//  TableViewController.swift
//  Maple Cafe
//
//  Created by Joey Shum on 1/11/2018.
//  Copyright © 2018 Joey Shum. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct postStructSecond {
    
    let title: String?
    let time: String?
    
}

class MenuListTableViewController: UITableViewController {
    
    var products = ["muffin"]
    
    var posts = [postStructSecond]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    func listFirebaseData() {
        ref = Database.database().reference()
        databaseHandle = ref?.child("Food Products").queryOrdered(byChild: "Food Products").observe(.childAdded, with: { (snapshot) in
            
            let value = snapshot.value as? NSMutableDictionary
            
            let title = value?["name"] as? String
            let time = value?["product"] as? String
            
            self.posts.append(postStructSecond(title: title, time: time))
            self.tableView.reloadData()
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listFirebaseData()

    }
    
    func post() {
        
        let title = "Title"
        let time = "Time"
        
        let post: [String: AnyObject] = ["title": title as AnyObject,
                                         "time": time as AnyObject]
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(post)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.detailTextLabel?.text = posts[indexPath.row].title
        cell.textLabel?.text = products as! String
        
        return cell
    }
    
}


