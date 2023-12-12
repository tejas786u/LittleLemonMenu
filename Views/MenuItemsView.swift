//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Tejas Patel on 12/12/23.
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if viewModel.isShowFood{
                    MenuItemView(menuItems: viewModel.food, menuCategory: .food).environmentObject(viewModel)
                    
                }
                if viewModel.isShowDrinks{
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                    
                }
                if viewModel.isShowDesserts{
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            .onAppear(){
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar{
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            .sheet(isPresented: $viewModel.isOpenedOptionView, content: {
                NavigationStack{
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar{
                            Button("Done"){
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            })
        }
    }
}

#Preview {
    MenuItemsView()
}
