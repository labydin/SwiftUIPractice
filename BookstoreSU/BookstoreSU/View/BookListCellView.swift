//
//  SearchedBookListCellView.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/28/24.
//

import SwiftUI

struct BookListCellView: View {
    
    @State var title: String
    @State var authors: String
    @State var price: Int32
    
    var body: some View {
        
        HStack {
            Text(title)
            
            Spacer(minLength: 0)
            
            Text(authors)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("\(price)원")
                .frame(alignment: .trailing)
        }
    }
}

//#Preview {
//    SearchedBookListCellView()
//}
