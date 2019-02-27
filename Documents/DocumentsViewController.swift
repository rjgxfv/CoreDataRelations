//
//  DocumentsViewController.swift
//  Documents
//
//  Created by Robert Graman on 1/31/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//

import UIKit
import CoreData


class DocumentsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    let dateFormatter = DateFormatter()
    var category: Category?
    
    @IBOutlet weak var documentsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.documents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for:indexPath)
        
        dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
        if let document = category?.documents?[indexPath.row]{
            if let cell = cell as? DocumentsTableViewCell{

                cell.fileName.text = document.title
                cell.fileSize.text = document.fileSize
                cell.fileDate.text = dateFormatter.string(from: document.dateMod! as Date)
            }

        }
        
        return cell
    }
    
    
    func deleteDocument(at indexPath: IndexPath) {
        guard let document = category?.documents?[indexPath.row]else {
            return
        }
        guard let managedContext = document.managedObjectContext else{
            return
        }
        managedContext.delete(document)
        do{
            try managedContext.save()
            documentsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch{
            print("saved wrong")
            documentsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteDocument(at: indexPath)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditorViewController{
            if (segue.identifier == "add") {
                destination.document = nil
            }
            else{
                if let row = documentsTableView.indexPathForSelectedRow?.row{
                    destination.document = category?.documents?[row]
                }
            }
            destination.category = category
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        documentsTableView.reloadData()
    }

}
