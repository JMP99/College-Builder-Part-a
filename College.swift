



import UIKit
import RealmSwift

class College: Object {
    
    dynamic var name = String()
    dynamic var location = String()
    dynamic var people = Int()
    dynamic var image = Data()
    dynamic var website = String()
    
    
    convenience init(name:String, location: String, people: Int, image: Data, website: String) {
        self.init()
        self.name = name
        self.location = location
        self.people = people
        self.image = image
        self.website = website
        
    }
    
}

