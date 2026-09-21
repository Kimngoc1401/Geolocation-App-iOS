//
//  place.swift
//  KimNgoc_Map
//
//  Created by SEIU iMac 4 on 21/09/2026.
//

import Foundation

class Place: Identifiable {
    let id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
