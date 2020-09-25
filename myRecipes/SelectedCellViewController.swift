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
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var textIngredients: UITextView!
    @IBOutlet weak var textSteps: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = selectedRecipe?.title
        labelType.text = selectedRecipe?.type
        
        textIngredients.text = selectedRecipe?.ingredients
        textSteps.text = selectedRecipe?.steps
    }
}
