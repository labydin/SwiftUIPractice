//
//  MapViewModel.swift
//  CitytourKiosk
//
//  Created by 박준영 on 11/12/24.
//

import SwiftUI
import MapKit


class MapViewModel: ObservableObject {
    
    @Published var coordinate: CLLocationCoordinate2D?

        func search(for address: String) async {
            do {
                let coordinateResult = try await getCoordinateFromRoadAddress(from: address)
                DispatchQueue.main.async {
                    self.coordinate = coordinateResult
                }
            } catch {
                print("Error fetching coordinates: \(error)")
            }
        }

        private func getCoordinateFromRoadAddress(from address: String) async throws -> CLLocationCoordinate2D {
            let geoCoder = CLGeocoder()
            let places = try await geoCoder.geocodeAddressString(address)
            guard let place = places.last,
                  let coordinate = place.location?.coordinate else { throw GeoError.canNotFound }
            return coordinate
        }
    
    enum GeoError: Error {
        case canNotFound
    }
}



