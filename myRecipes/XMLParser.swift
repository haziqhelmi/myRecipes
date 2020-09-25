//
//  XMLParser.swift
//  myRecipes
//
//  Created by Haziq Helmi on 21/08/2020.
//  Copyright © 2020 Haziq Helmi. All rights reserved.
//

import Foundation
import SwiftyXML

struct RecipeItem {
    var type: String
    var title: String
    var ingredients: String
    var steps: String
}

class RecipeParser: NSObject, XMLParserDelegate {
    
    private var recipeItem: [RecipeItem] = []
    private var currentElement = ""
    private var currentType = ""
    private var currentTitle = ""
    private var currentIngredients = ""
    private var currentSteps = ""
    private var parserCompletionHandler: (([RecipeItem]) -> Void)?
    
    func parseRecipe (url: String, completionHandler: (([RecipeItem]) -> Void)?) {
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in guard let data = data else {
            if let error = error {
                print(error.localizedDescription)
            }
            return
        }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        
        task.resume()
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "Recipe" {
            currentType = ""
            currentTitle = ""
            currentIngredients = ""
            currentSteps = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "Title": currentTitle += string
        case "Type": currentType += string
        case "Ingredients": currentIngredients += string
        case "Steps": currentSteps += string
        default: break
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "Recipe" {
            let recipeItem = RecipeItem(type: currentType, title: currentTitle, ingredients: currentIngredients, steps: currentSteps)
            self.recipeItem.append(recipeItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(recipeItem)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}
