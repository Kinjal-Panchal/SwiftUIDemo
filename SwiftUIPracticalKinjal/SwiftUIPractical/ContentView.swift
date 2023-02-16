//
//  ContentView.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 11/02/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .yellow

        UINavigationBar.appearance().backgroundColor = .systemBackground // backgorund color with gradient
        UINavigationBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().tintColor = .systemBackground
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        UINavigationBar.appearance().isTranslucent = true

        
    }
    
    @StateObject var listviewModel = ProductListViewModel()
    @State var selectedIndex = 0
    @State var shouldShowModel = false
   // var home_tab_RootView = HomeView()
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer().fullScreenCover(isPresented: $shouldShowModel) {
                VStack {
                    Text("Model screen")
                    Button {
                        shouldShowModel = false
                    } label: {
                        Text("Dismiss")
                    }
                    
                }
            }
            
            switch selectedIndex {
            case 0:
                NavigationView {
                    if listviewModel.isLoading {
                        LoadingView()
                    }else {
                        ProductListView(productlist: listviewModel.productList)
                    }
                }
            case 1:
                NavigationView {
                    if listviewModel.isLoading {
                        LoadingView()
                    }else {
                        ProductListView(productlist: listviewModel.productList)
                    }
                }
            default :
                Text("test")
            }
            
            TabbarView(selectedIndex: selectedIndex) { index in
                selectedIndex = index
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
