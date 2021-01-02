//
//  Role.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct Role: Codable {
    let id: Int?
    let name: String?//RoleName?
    let createdAt, updatedAt: Date?
    let pivot: Pivot?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot
    }
}

enum RoleName: String, Codable {
    case drivers = "Drivers"
    case supervisors = "Supervisors"
    case users = "Users"
}
