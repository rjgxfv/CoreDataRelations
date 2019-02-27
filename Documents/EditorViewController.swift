//
//  EditorViewController.swift
//  Documents
//
//  Created by Robert Graman on 1/31/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var navigationBar: UINavigationItem!

    var category: Category?
    var document: Doc?
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (document != nil) {
            name.text = document!.title
            contents.text = document?.body

        }
    }
    
    
    @IBAction func saveFile(_ sender: Any) {
        let size = self.contents.text!.count
        let sizeString = "\(size) bytes"
        let title = name.text!
        let body = self.contents.text!
        
        if let document = Doc(title: title, size: sizeString, body: body, dateMod: Date(timeIntervalSinceNow: 0)){
            category?.addToRawDocs(document)
            
            do{
                try document.managedObjectContext?.save()
                self.navigationController?.popViewController(animated: true)
            } catch{
                print("saved wrong")
            }
        }
        
    }
    @IBAction func fileNameChanged(_ sender: Any) {
        navigationBar.title = name.text
    }
    

}
