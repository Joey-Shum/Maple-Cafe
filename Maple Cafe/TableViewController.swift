
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

struct postStruct {
    let title: String?
    let time: String?
}

class TableViewController: UITableViewController {
    
    var posts = [postStruct]()
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    //gets data from Firebase and lists it in the tableview
    func listFirebaseData() {
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        let uid = user?.uid
        
        databaseHandle = ref?.child("\(uid)").queryOrdered(byChild: "Posts").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSMutableDictionary
            
            let time = value?["time"] as? String
            let title = value?["product"] as? String
            
            self.posts.append(postStruct(title: title, time: time))
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listFirebaseData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
    }
    
    //displays product title and time ordered to text labels
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.detailTextLabel?.text = posts[indexPath.row].time
        cell.textLabel?.text = posts[indexPath.row].title
        
        return cell
    }
    
}
