//
//  TabView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/1/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("진주 8경")
                }
            FoodView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("전통 음식")
                }
        }
        .font(.headline)
        .tint(.cyan)
    }
}

#Preview {
    TabBarView()
}
