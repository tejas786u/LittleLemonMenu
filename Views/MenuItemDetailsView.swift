//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("Little Lemon logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                if menuItem.price > 0 {
                    VStack{
                        Text("Price : ")
                            .fontWeight(.bold)
                        Text(String(format: "%.2f", menuItem.price))
                    }
                    .padding(1)
                }
                if menuItem.orderCount > 0 {
                    VStack{
                        Text("Ordered : ")
                            .fontWeight(.bold)
                        Text("\(menuItem.orderCount)")
                    }
                    .padding(1)
                }
                if menuItem.ingredient.count > 0 {
                    VStack{
                        Text("Ingredients : ")
                            .fontWeight(.bold)
                        ForEach(menuItem.ingredient, id: \.self){
                            Text($0.rawValue)
                        }
                    }
                    .padding(1)
                }
            }
            .navigationTitle(menuItem.title)
            .padding([.leading, .trailing], 60)
        }
    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(title: "Food 1", price: 10.0, orderCount: 15, menuCategory: .food, ingredient: [.tommatoSauce,.broccoli,.carrot]))
}
