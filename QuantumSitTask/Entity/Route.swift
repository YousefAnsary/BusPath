//
//  Route.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct Route: Codable {
    let id: Int?
    let name: String?
    let routePath, routePathBack: [DropoffLocation]?
    let pickupLocation, pickupLocationBack, dropoffLocation, dropoffLocationBack: DropoffLocation?
    let timeToDest: Int?
    let createdAt, updatedAt: Date?
    let stopPoints: [StopPoint]?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name, routePath, routePathBack, pickupLocation, pickupLocationBack, dropoffLocation, dropoffLocationBack, timeToDest
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stopPoints = "stop_points"
    }
}
