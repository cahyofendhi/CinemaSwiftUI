//
//  PeopleModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 21/01/22.
//

import Foundation

struct PeopleResponse: Codable {
    var id: Int?
    var cast, crew: [People]?
    
    enum CodingKeys: String, CodingKey {
        case id, cast, crew
    }
}

// MARK: - People
struct People: Codable, Identifiable, Hashable {
    var adult: Bool?
    var gender, id: Int?
    var name, originalName: String?
    var popularity: Double?
    var profilePath: String?
    var castID: Int?
    var character, creditID: String?
    var order: Int?
    var job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, job
    }
    
    func getImageProfile() -> String {
        return "http://image.tmdb.org/t/p/w185/\(profilePath ?? "")";
    }
    
}
