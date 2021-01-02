//
//  User.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

// MARK: - User
struct User: Codable {
    let token: String?
    let user: UserData?
}

// MARK: - UserData
struct UserData: Codable {
    let id, roleID: Int?
    let fullName, name, email, photoURL: String?
    let createdAt, updatedAt, mobileNo: String?
    let age, gender, organizationID: Int?
    let location, checkInLocation, checkOutLocation: String?
    let busID, stopPointID, stopPointIDBack: Int?
    let identification, position: String?
    let tempStatus, checkIOOrg, isLoggedIn: Int?
    let hasCheckedIn, hasCheckedOut, hasAttended, hasAttendedBack: Bool?
    let hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasArrivedBySupervisor: Bool?
    let photoLink: String?
    let hasBus: Bool?
    let organization: Organization?
    let roles: [Role]?
    let bus: Bus?
    let stopPoint: StopPoint?

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "role_id"
        case fullName, name, email
        case photoURL = "PhotoUrl"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case mobileNo = "MobileNo"
        case age = "Age"
        case gender = "Gender"
        case organizationID = "OrganizationId"
        case location = "Location"
        case checkInLocation = "CheckInLocation"
        case checkOutLocation = "CheckOutLocation"
        case busID = "BusId"
        case stopPointID = "stopPointId"
        case stopPointIDBack = "stopPointIdBack"
        case identification, position, tempStatus, checkIOOrg, isLoggedIn, hasCheckedIn, hasCheckedOut, hasAttended, hasAttendedBack, hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasArrivedBySupervisor
        case photoLink = "PhotoLink"
        case hasBus = "HasBus"
        case organization = "Organization"
        case roles, bus
        case stopPoint = "stop_point"
    }
}
