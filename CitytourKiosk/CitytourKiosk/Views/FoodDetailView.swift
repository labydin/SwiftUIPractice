//
//  FoodDetailView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/13/24.
//

import SwiftUI

struct FoodDetailView: View {
    
    @Binding var food: TraditionalFood
    
    var body: some View {
        
            List {
                Section {
                    ForEach($food.restaurant, id: \.self) { shop in
                        Link(shop.wrappedValue, destination: URL(string: "https://search.naver.com/search.naver?where=nexearch&sm=top_sly.hst&fbm=0&acr=1&ie=utf8&query=\(shop.wrappedValue)")!)
                    }
                    .foregroundColor(.black)
                    .listRowBackground(Color.gray.opacity(0.1))
                } header: {
                    Header(food: $food)
                        .foregroundColor(.black)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.white)
            .navigationTitle(food.title).frame(alignment: .top)
        }
}


struct Header: View {
    
    @Binding var food: TraditionalFood
    
    var body: some View {
        
        VStack(spacing: 30) {
            Image(food.title)    // 이미지 이름 == title
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 40)
            
            Text(food.description)
                .font(.custom("설명", size: 20))
        }
    }
}

#Preview {
    FoodView()
}
