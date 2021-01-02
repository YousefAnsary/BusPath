//
//  Organization.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct Organization: Codable {
    let id: Int?
    let name: String?
    let busesCount, usersCount: Int?
    let phoneNumber: String?
    let phoneNumber2: String?
    let permitCheckIn, driverAsSupervisor: Int?
    let lat, lng, northEastLat, northEastLng: Double?
    let southWestLat, southWestLng: Double?
    let createdAt, updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case busesCount = "BusesCount"
        case usersCount = "UsersCount"
        case phoneNumber, phoneNumber2, permitCheckIn, driverAsSupervisor, lat, lng
        case northEastLat = "northEast_lat"
        case northEastLng = "northEast_lng"
        case southWestLat = "southWest_lat"
        case southWestLng = "southWest_lng"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
