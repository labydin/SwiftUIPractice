//
//  RecentBookGridCell.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/27/24.
//

import SwiftUI

struct RecentBookGridCellView: View {
    
    @Binding var thumnail: String
    @Binding var title: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: thumnail), scale: 1.8)
                .cornerRadius(8)
            
            Text(title)
                .frame(maxWidth: 80)
        }
    }
}

//#Preview {
//    RecentBookGridCellView()
//}
