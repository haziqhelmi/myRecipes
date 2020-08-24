//
//  TableViewCell.swift
//  myRecipes
//
//  Created by Haziq Helmi on 24/08/2020.
//  Copyright © 2020 Haziq Helmi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
 
    var recipe: RecipeItem! {
        didSet {
            titleLabel.text = recipe.title
            typeLabel.text = recipe.type
        }
    }
}
