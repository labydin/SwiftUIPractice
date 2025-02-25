//
//  FoodView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/13/24.
//

import SwiftUI

struct FoodView: View {
    
    @State private var foods: Foods = loadJSON("JinjuFood")
    @State private var selection: String?
    
    var body: some View {
        
        NavigationStack {
            
            List($foods, id: \.self, selection: $selection) { food in
                let title = food.title.wrappedValue
                
                NavigationLink(destination: FoodDetailView(food: food)) {
                    Text(title)
                        .fontWeight(selection == title ? .bold : .regular)
                        .foregroundStyle(selection == title ? .blue : .primary)
                        .padding(selection == title ? 8 : 0)
                }
            }
            .navigationTitle("진주 전통음식")
        }
        .font(.title3)
    }
}

#Preview {
    FoodView()
}
