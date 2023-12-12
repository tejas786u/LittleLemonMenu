//
//  LittleLemonMenuTests.swift
//  LittleLemonMenuTests
//
//  Created by Tejas Patel on 12/12/23.
//

import XCTest
@testable import LittleLemonMenu

final class LittleLemonMenuTests: XCTestCase {
    let viewModel = MenuViewModel()
    
    func test_MenuItemView_CheckFoodTitle(){
        let foodTitle = viewModel.food.first!.title
        XCTAssertEqual(foodTitle, "Food 4")
    }
    
    func test_MenuItemView_CheckIngredient() {
        let foodIngredient = viewModel.food[0]
        XCTAssertEqual(foodIngredient.ingredient, [.tommatoSauce, .carrot, .pasta])
    }
}
