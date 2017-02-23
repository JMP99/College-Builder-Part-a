

import UIKit
import RealmSwift
import SafariServices
class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
   
   
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
 
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    let realm = try! Realm()
    
    var detailItem: College? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        imagePicker.delegate = self

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    @IBAction func onCameraButtonTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func onLibraryButtonTapped(_ sender: UIButton) {
        
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
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

