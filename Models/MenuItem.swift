//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import Foundation

enum SortBy: String, CaseIterable{
    case mostPopular = "Most Popular"
    case fromLowPrice = "Price $ - $$$"
    case fromAtoZ = "A-Z"
}

enum MenuCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

enum Ingredient: String, CaseIterable{
    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tommatoSauce = "Tomato Sauce"
}

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var price: Double
    var orderCount: Int
    var menuCategory: MenuCategory
    var ingredient: [Ingredient]
}
