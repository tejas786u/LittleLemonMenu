//
//  MenuViewModel.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import Foundation

class MenuViewModel: ObservableObject{
    
    @Published var sortBy = SortBy.fromAtoZ
    
    @Published var isOpenedOptionView = false
    
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var food: [MenuItem] = [
        MenuItem(title: "Food 4", price: 18.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce, .carrot, .pasta]),
        MenuItem(title: "Food 5", price: 10.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce]),
        MenuItem(title: "Food 6", price: 90.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce]),
        MenuItem(title: "Food 7", price: 20.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce, .spinach, .carrot]),
        MenuItem(title: "Food 1", price: 10.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce]),
        MenuItem(title: "Food 2", price: 15.0, orderCount: 15, menuCategory: .food, ingredient: [.tommatoSauce, .pasta]),
        MenuItem(title: "Food 3", price: 25.0, orderCount: 20, menuCategory: .food, ingredient: [.spinach, .broccoli]),
        MenuItem(title: "Food 8", price: 25.50, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce, .broccoli]),
        MenuItem(title: "Food 9", price: 10.0, orderCount: 10, menuCategory: .food, ingredient: [.tommatoSauce]),
        MenuItem(title: "Food 10", price: 35.0,  orderCount: 10, menuCategory: .food, ingredient: [.spinach]),
        MenuItem(title: "Food 11", price: 45.0,  orderCount: 10, menuCategory: .food, ingredient: [.pasta]),
        MenuItem(title: "Food 12", price: 75.0,  orderCount: 10, menuCategory: .food, ingredient: [.carrot, .spinach])
    ]
    
    @Published var drinks: [MenuItem] = [
        MenuItem(title: "Drink 4", price: 18.0, orderCount: 0, menuCategory: .drink, ingredient: []),
        MenuItem(title: "Drink 5", price: 10.0, orderCount: 10, menuCategory: .drink,  ingredient: []),
        MenuItem(title: "Drink 1", price: 10.0, orderCount: 0, menuCategory: .drink, ingredient: []),
        MenuItem(title: "Drink 2", price: 15.0, orderCount: 15, menuCategory: .drink,  ingredient: []),
        MenuItem(title: "Drink 3", price: 10.0, orderCount: 20, menuCategory: .drink,  ingredient: []),
        MenuItem(title: "Drink 6", price: 10.0, orderCount: 10, menuCategory: .drink,  ingredient: []),
        MenuItem(title: "Drink 7", price: 20.0, orderCount: 10, menuCategory: .drink,  ingredient: []),
        MenuItem(title: "Drink 8", price: 25.0, orderCount: 10, menuCategory: .drink,  ingredient: [])
    ]
    
    @Published var desserts: [MenuItem] = [
        MenuItem(title: "Dessert 2", price: 15.0, orderCount: 15, menuCategory: .dessert, ingredient: []),
        MenuItem(title: "Dessert 3", price: 10.0, orderCount: 20, menuCategory: .dessert, ingredient: []),
        MenuItem(title: "Dessert 1", price: 10.0, orderCount: 0, menuCategory: .dessert, ingredient: []),
        MenuItem(title: "Dessert 4", price: 18.0, orderCount: 0, menuCategory: .dessert, ingredient: [])
    ]
    
    func updateMenuItems() {
        switch sortBy {
        // Sorting by number (orders count)
        case .mostPopular:
            food.sort() { $0.orderCount > $1.orderCount }
            drinks.sort() { $0.orderCount > $1.orderCount }
            desserts.sort() { $0.orderCount > $1.orderCount }
        // Sorting by cost (lowest to highest)
        case .fromLowPrice:
            food.sort() { $0.price < $1.price }
            drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
        // Sort by titles (A-Z))
        case .fromAtoZ:
            food.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            drinks.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            desserts.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
        }
    }
    
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
        let lhsTitle = lhs.title.split(separator: " ")
        let rhsTitle = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
        let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
        if lhsNumber != rhsNumber {
            return lhsNumber < rhsNumber
        } else {
            return lhs.title < rhs.title
        }
    }
}
