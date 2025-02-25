//
//  DetailView.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/1/24.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct SpotDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var spot: TourSpot
    @StateObject private var viewModel = MapViewModel()
    @State var region: MKCoordinateRegion?
    var defaultRegion = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    
    var body: some View {
        ScrollView {
            TabView() {
                ForEach($spot.images, id: \.self) { image in
                    Image(image.wrappedValue)
                        .resizable()
                        .scaledToFill()
                    //.clipped() // 이미지가 잘리는 부분 처리
                }
            }
            .frame(alignment: .topLeading)
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.75)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(spot.title)
                    .font(.title)
                
                Spacer(minLength: 30)
                
                Text("주소 : \(spot.address)")
                Text("관리기관 : \(spot.agency)")
                Text("전화번호 : \(spot.phoneNumber)")
                Text("이용시간 : \(spot.useTime)")
                
                Spacer(minLength: 30)
                
                Text(spot.description)
                    .font(.none)
            }
            .frame(width: UIScreen.main.bounds.width - 20)
            
            Spacer()
            
            Map(interactionModes: [.zoom]) {
                Marker(spot.title, coordinate: viewModel.coordinate ?? defaultRegion)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 9/16)
            .onAppear {
                Task {
                    await viewModel.search(for: spot.address)
                    region = MKCoordinateRegion(center: viewModel.coordinate ?? defaultRegion, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
                }
            }
        }
    }
    
}


//#Preview {
//    DetailView()
//}
