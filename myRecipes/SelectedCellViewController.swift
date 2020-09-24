//
//  SelectedCellViewController.swift
//  
//
//  Created by Haziq Helmi on 24/09/2020.
//

import UIKit

class SelectedCellViewController: UIViewController {

    var selectedRecipe: RecipeItem?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelIngredients: UILabel!
    
//    var selectedRecipe: RecipeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            labelTitle.text = selectedRecipe?.title
            labelIngredients.text = selectedRecipe?.ingredients
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
