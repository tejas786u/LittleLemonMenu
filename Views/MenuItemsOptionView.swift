//
//  MenuItemsOptionView.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewModel
    
    var body: some View {
        NavigationStack{
            List{
                Section("Selected categories") {
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                }
                Picker("Sort by", selection: $viewModel.sortBy){
                    ForEach(SortBy.allCases, id: \.self){ category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(.inline)
            }
            .navigationTitle("Filter")
        }
    }
}

#Preview {
    MenuItemsOptionView().environmentObject(MenuViewModel())
}
