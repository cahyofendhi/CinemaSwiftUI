//
//  SimiliarModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 21/01/22.
//

import Foundation

// MARK: - SimilarResponse
struct SimilarResponse: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
