//
//  StopPoint.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

// MARK: - StopPoint
struct StopPoint: Codable {
    let id, routeID: Int?
    let lat, lng, northEastLat, northEastLng: Double?
    let southWestLat, southWestLng: Double?
    let minsfromprevious, direction: Int?
    let createdAt, updatedAt: Date?
    let stopPointID: Int?
    let users, usersBack: [Driver]?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case routeID = "routeId"
        case lat, lng
        case northEastLat = "northEast_lat"
        case northEastLng = "northEast_lng"
        case southWestLat = "southWest_lat"
        case southWestLng = "southWest_lng"
        case minsfromprevious, direction
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stopPointID = "stopPointId"
        case users
        case usersBack = "users_back"
    }
}
