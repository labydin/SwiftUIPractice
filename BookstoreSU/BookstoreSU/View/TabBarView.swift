//
//  SwiftUIView.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/25/24.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject private var coreViewModel = CoreDataViewModel()
    @StateObject private var swiftViewModel = SwiftDataViewModel()
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .environmentObject(coreViewModel)
                .environmentObject(swiftViewModel)
            
            SavedListView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("담은 책 리스트")
                }
                .environmentObject(coreViewModel)
                .environmentObject(swiftViewModel)
        }
        .tint(.green)
    }
}

#Preview {
    TabBarView()
}
