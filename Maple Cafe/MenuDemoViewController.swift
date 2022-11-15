import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MenuDemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    //the array of items
    let cellContent = ["muffin ($15)", "coffee ($20)", "sandwich ($16)", "yogurt ($17)"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
        
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let date = NSDate()
        let product = "\(cellContent[indexPath.row])"
        let time = "\(date)"
        
        let store: [String: AnyObject] = ["product": product as AnyObject,
                                          "time": time as AnyObject]
        
        let user = Auth.auth().currentUser
        let uid = user?.uid
        
        let databaseRef = Database.database().reference()
        databaseRef.child("\(uid)").childByAutoId().setValue(store)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
