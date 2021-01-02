//
//  DropoffLocation.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/9/20.
//

import Foundation

struct Driver: Codable {
    let id, roleID: Int?
    let fullName, name, email, photoURL: String?
    let createdAt, updatedAt, mobileNo: String?
    let age, gender, organizationID: Int?
    let location, checkInLocation, checkOutLocation: String?
    let busID, stopPointID, stopPointIDBack: Int?
    let identification, position: String?
    let tempStatus, checkIOOrg, isLoggedIn: Int?
    let hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasAttended, hasAttendedBack: Bool?
    let hasArrivedBySupervisor, hasCheckedIn, hasCheckedOut: Bool?
    let photoLink: String?
    let hasBus: Bool?
    let organization: Organization?
    let bus: DriverBus?
    let connectionID: String?
    let roles: [Role]?

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
        case identification, position, tempStatus, checkIOOrg, isLoggedIn, hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasAttended, hasAttendedBack, hasArrivedBySupervisor, hasCheckedIn, hasCheckedOut
        case photoLink = "PhotoLink"
        case hasBus = "HasBus"
        case organization = "Organization"
        case bus
        case connectionID = "connectionId"
        case roles
    }
}
