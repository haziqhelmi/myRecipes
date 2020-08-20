//
//  ViewController.swift
//  myRecipes
//
//  Created by Haziq Helmi on 20/08/2020.
//  Copyright © 2020 Haziq Helmi. All rights reserved.
//

import UIKit
import SwiftyXMLParser
import Alamofire

struct Recipes: Codable {
    let name: String
    let description: String
    let ingredients: String
    let steps: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlPath = Bundle.main.path(forResource: "recipes", ofType: "xml") else { return }
        let url = NSURL.fileURL(withPath: urlPath)
        
        Alamofire.request(url).responseData {
            response in
            if let data = response.data {
                let xml = XML.parse(data)
                print(xml.RecipeSet.Entree.Recipe[0].Title.text!)
            }
        }
        // Do any additional setup after loading the view.
    }


}

