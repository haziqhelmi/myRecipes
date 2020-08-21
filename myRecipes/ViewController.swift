//
//  ViewController.swift
//  myRecipes
//
//  Created by Haziq Helmi on 20/08/2020.
//  Copyright © 2020 Haziq Helmi. All rights reserved.
//

import UIKit
import SwiftyXML

struct Recipes: Codable {
    let name: String
    let description: String
    let ingredients: String
    let steps: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

