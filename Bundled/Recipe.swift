//
//  Recipe.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class Recipe: NSObject, NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("RecipeInfoFile")
    
    var id: NSNumber
    var name: String
    var category: String
    var preparationArray: [Preparation]
    var imageName: String
    var price:Float
    var cookTime: Int
    var tag: [String]
    var ingredients: [String : [String]]
    var steps: [[String]]
    var details: String
    
    init(id: NSNumber, name: String, category: String, preparationArray: [Preparation], imageName: String, price: Float, cookTime: Int, tag: [String], ingredients: [String: [String]],steps:[[String]], details: String) {
        self.id = id
        self.name = name
        self.category = category
        self.preparationArray = preparationArray
        self.imageName = imageName
        self.price = price
        self.cookTime = cookTime
        self.tag = tag
        self.ingredients = ingredients
        self.steps = steps
        self.details = details
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? NSNumber ?? 0
        let name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        let category = aDecoder.decodeObject(forKey: "category") as? String ?? ""
        let preparationArray = aDecoder.decodeObject(forKey: "preparationArray") as? [Preparation] ?? [beatEggs]
        let imageName = aDecoder.decodeObject(forKey: "imageName") as? String ?? ""
        let price = Float(aDecoder.decodeFloat(forKey: "price"))
        let cookTime = Int(aDecoder.decodeCInt(forKey: "cookTime"))
        let tag = aDecoder.decodeObject(forKey: "tag") as? [String] ?? []
        let ingredients = aDecoder.decodeObject(forKey: "ingredients") as? [String: [String]]
        let steps = aDecoder.decodeObject(forKey: "steps") as? [[String]] ?? [[]]
        let details = aDecoder.decodeObject(forKey: "details") as? String ?? ""
        self.init(id: id, name: name, category: category, preparationArray: preparationArray, imageName: imageName, price: price, cookTime: cookTime, tag: tag, ingredients: ingredients!, steps: steps, details: details)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(category, forKey: "category")
        aCoder.encode(preparationArray, forKey: "preparationArray")
        aCoder.encode(imageName, forKey: "imageName")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(cookTime, forKey: "cookTime")
        aCoder.encode(tag, forKey: "tag")
        aCoder.encode(ingredients, forKey: "ingredients")
        aCoder.encode(steps, forKey: "steps")
        aCoder.encode(details, forKey: "details")
        
    }
    
    static func saveRecipeInfo(_ recipe: Recipe) -> Bool {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(recipe, toFile: Recipe.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save info")
            return false
        } else {
            print("Info saved")
            return true
        }
    }
    
}


