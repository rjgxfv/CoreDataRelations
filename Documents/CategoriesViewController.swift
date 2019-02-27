//
//  CategoriesViewController.swift
//  Documents
//
//  Created by Robert Graman on 2/27/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//

import UIKit
import CoreData

class CategoriesViewController: UIViewController ,  UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var categoryTableView: UITableView!
    var categories: [Category] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.title
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let mannagedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        do{
            categories = try mannagedContext.fetch(fetchRequest)
            categoryTableView.reloadData()
        } catch{
            print("somerthing wrong")
        }
        
    }
    

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DocumentsViewController, let selectedRow = self.categoryTableView.indexPathForSelectedRow?.row else {
            return
        }
        destination.category = categories[selectedRow]
    }
    func deleteCategory(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        guard let managedContext = category.managedObjectContext else{
            return
        }
        managedContext.delete(category)
        do{
            try category.managedObjectContext?.save()
            categories.remove(at: indexPath.row)
            categoryTableView.deleteRows(at: [indexPath], with: .automatic)
            self.navigationController?.popViewController(animated: true)
        } catch{
            print("saved wrong")
            categoryTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteCategory(at: indexPath)
        }
    }

}
