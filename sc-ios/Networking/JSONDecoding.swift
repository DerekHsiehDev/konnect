//
//  JSONDecoding.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/23/21.
//

import Foundation

struct All: Decodable {
    let student: Student
    let classes: [Classes]
    let assignments: [Assignment]
}

struct Student: Decodable {
    let name: String
    let year: String
}

struct Classes: Decodable, Hashable {
    let period: String
    let currentGrade: String
    let currentPercentage: String
    let teacherName: String
    let assignmentCount: Int
}

struct Assignment: Decodable, Hashable {
    let name: String
    let pointsPossible: String
    let pointsScored: String
}

