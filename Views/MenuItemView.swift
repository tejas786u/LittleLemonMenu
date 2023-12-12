//
//  MenuItemView.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewModel
    
    var menuItems : [MenuItem]
    var menuCategory: MenuCategory
    
    var threeColumn = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{
            HStack{
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.blue)
                Spacer()
            }
            LazyVGrid(columns: threeColumn){
                ForEach((menuItems), id: \.self){ menuItem in
                    NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)){
                        VStack{
                            Rectangle()
                            Text(menuItem.title)
                        }
                        .frame(height:100)
                        .foregroundStyle(Color.black)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    MenuItemView(menuItems: MenuViewModel().food, menuCategory: .food)
}
