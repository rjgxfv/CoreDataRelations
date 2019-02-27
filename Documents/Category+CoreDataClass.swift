//
//  Category+CoreDataClass.swift
//  Documents
//
//  Created by Robert Graman on 2/27/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {

    var documents:[Doc]?{
        return self.rawDocs?.array as? [Doc]
    }
    
    convenience init?(title:String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Category.entity(), insertInto: managedContext)
        self.title = title
    }
}
