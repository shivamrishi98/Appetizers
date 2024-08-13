//
//  User.swift
//  Appetizers
//
//  Created by Shivam Rishi on 13/8/2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
