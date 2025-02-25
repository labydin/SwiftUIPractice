//
//  GridCellView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/1/24.
//

import SwiftUI

struct GridCellView: View {
    
    @Binding var image: String
    @Binding var title: String
    
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .cornerRadius(16)
                .frame(minWidth: 40)
                .aspectRatio(1.0, contentMode: .fit)

            Text(title).foregroundColor(.black).bold()
        }
    }
}

//#Preview {
//    GridCellView()
//}
