//
//  RepoTest.swift
//  Tests iOS
//
//  Created by Dot Indonesia on 03/02/22.
//

import XCTest
@testable import CinemaSwiftUI

class MovieTests: XCTestCase {

    func testSuccessParser() {
        let json = SampleResponse.moviesList().data(using: .utf8)!
        
        let movies = try! JSONDecoder().decode(MovieResponse.self, from: json)
        
        XCTAssertNotNil(movies)
        XCTAssertEqual(movies.results?.first?.title, "Spider-Man: No Way Home")
    }
}
