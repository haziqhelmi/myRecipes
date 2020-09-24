//
//  TableViewController.swift
//  myRecipes
//
//  Created by Haziq Helmi on 21/08/2020.
//  Copyright © 2020 Haziq Helmi. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    private var recipeItem: [RecipeItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchData() {
        let urlPath = Bundle.main.path(forResource: "recipetypes", ofType: "xml")
        let url = URL(fileURLWithPath: urlPath!)
        
        let recipeParser = RecipeParser()
        recipeParser.parseRecipe(url: url.absoluteString) {
            (recipeItem) in
            self.recipeItem = recipeItem
            
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "showRecipe", sender: self)
////        let selectedRecipe = self.recipeItem?[indexPath.row]
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectedCellViewController, let index = tableView.indexPathsForSelectedRows?.first {
            destination.selectedRecipe = recipeItem?[index.row]
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipeItem = recipeItem else {
            return 0
        }
        return recipeItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        if let recipe = recipeItem?[indexPath.item] {
            cell.recipe = recipe
        }

        return cell
    }
}
