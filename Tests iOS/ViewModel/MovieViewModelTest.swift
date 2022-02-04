//
//  MovieViewModelTest.swift
//  Tests iOS
//
//  Created by Dot Indonesia on 03/02/22.
//

import XCTest
@testable import CinemaSwiftUI

class MovieViewModelTest: XCTestCase {

    let repo = MockMovieRepo()
    
    func testHomeViewModel() {
        let viewModel = HomeViewModel(repository: repo)
        viewModel.getMovieList()
         
        sleep(3)
        
        XCTAssertFalse(viewModel.loadingTop!)
        XCTAssertEqual(viewModel.topMovies?.count, 1)
        XCTAssertEqual(viewModel.popularMovies?.first?.id, 634649)
    }
    
    func testDetailViewModel() {
        let viewModel = DetailViewModel(repository: repo)
        viewModel.loadMovie(SampleResponse.moviesData().results?.first!)
        sleep(5)
        
        XCTAssertEqual(viewModel.movie?.id, 634649)
        XCTAssertEqual(viewModel.crews?.count, 3)
        XCTAssertEqual(viewModel.similiar?.first?.id, 100402)
    }

}
