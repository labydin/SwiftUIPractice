//
//  TabbarView.swift
//  MyWheather
//
//  Created by 박준영 on 12/26/24.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "sun.haze")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("옷입히기")
                .tabItem {
                    Image(systemName: "dog.fill")
                }
        }
    }
}

#Preview {
    TabbarView()
}
