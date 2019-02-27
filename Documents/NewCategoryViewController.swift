//
//  NewCategoryViewController.swift
//  Documents
//
//  Created by Robert Graman on 2/27/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    
    @IBOutlet weak var catName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: Any) {
        let category = Category(title: catName.text ?? "")
        
        do {
            try category?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        } catch{
            print("could not save category")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
