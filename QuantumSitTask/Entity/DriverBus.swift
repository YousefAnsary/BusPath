//
//  DriverBus.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct DriverBus: Codable {
    let id: Int?
    let busNumber: String?
    let capacity, routeID, organizationID, supervisorID: Int?
    let driverID, isactive: Int?
    let createdAt, updatedAt: String?
    let route: Route?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case busNumber, capacity
        case routeID = "routeId"
        case organizationID = "organizationId"
        case supervisorID = "supervisorId"
        case driverID = "driverId"
        case isactive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case route
    }
}
