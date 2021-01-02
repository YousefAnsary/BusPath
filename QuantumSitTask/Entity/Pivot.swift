//
//  Pivot.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct Pivot: Codable {
    let userID, roleID: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
    }
}
