//
//  ContentView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 10/29/24.
//

import SwiftUI

struct MainView: View {
    
    @State var dummyData: [TourSpot] = JinjuTourSpot.shared.spots
    //@State var selectedSpot: TourSpot

    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView {
                    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
                    
                    LazyVGrid(columns: gridItems, spacing: 10) {
                        ForEach($dummyData, id: \.self) { spot in
                            NavigationLink(destination: SpotDetailView(spot: spot)) {
                                //selectedSpot = spot
                                GridCellView(image: spot.images[0], title: spot.title)
                                    .padding(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("진주 8경")
        }
        
    }
}



#Preview {
    MainView()
}
