

import UIKit
import RealmSwift
import SafariServices
class DetailViewController: UIViewController {
    
   
   
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
 
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let realm = try! Realm()
    
    var detailItem: College? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let college = self.detailItem {
            if collegeTextField != nil {
                collegeTextField.text = college.name
                locationTextField.text = college.location
                peopleTextField.text = String(college.people)
                websiteTextField.text = college.website
                imageView.image = UIImage(data: college.image)
            }
        }
    }
    
    
    @IBAction func onSaveTapped(_ sender: UIButton) {
        if let college = self.detailItem {
            try! realm.write({
                college.name = collegeTextField.text!
                college.location = locationTextField.text!
                college.people = Int(peopleTextField.text!)!
                college.website = websiteTextField.text!
                college.image = UIImagePNGRepresentation(imageView.image!)!
    }
    
    
    )
            
            
        }
        
        
        
        
        
        
        
        
    }
    @IBAction func onTappedGoButton(_ sender: UIButton) {
        let urlString = websiteTextField.text!
        let url = URL(string: urlString)
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)
    }
    
    
    
    
}

