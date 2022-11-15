import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    var signupModeActive = true
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpOrLoginLabel: UILabel!
    @IBOutlet weak var signupOrLoginButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBAction func switchButton(_ sender: Any) {
        if (signupModeActive) {
            
            signupModeActive = false
            signupOrLoginButton.setTitle("Log In", for: [])
            switchButton.setTitle("Sign Up", for: [])
            switchLabel.text = "Need a new account?"
            
        } else {
            
            signupModeActive = true
            signupOrLoginButton.setTitle("Sign Up", for: [])
            switchButton.setTitle("Log In", for: [])
            switchLabel.text = "Already have an account?"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Sign Up Action for email
    @IBAction func signupOrLoginButton(_ sender: Any) {
        
        if (signupModeActive) {
            
            if emailTextField.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
                
            } else {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
                        self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
            
        } else {
            
            if self.emailTextField.text == "" || self.passwordTextField.text == "" {
                
                //If users didn’t fill anything in the textfields, there will be an alert
                
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                
                Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        
                        //Go to the HomeViewController if the login is successful
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
                        self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        
                        //Gets firebase to tell users the error
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
            
        }
    }
    
    
}
