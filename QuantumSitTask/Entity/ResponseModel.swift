//
//  ResponseModel.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct LoginResponse: Codable {
    let message: String?
    let status: Bool?
    let innerData: User?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case innerData = "InnerData"
    }
}
