//
//  MovieViewModel.swift
//  CombineDemo
//
//  Created by Inpyo Hong on 2021/08/09.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = [] // 1
    var cancelBag = Set<AnyCancellable>()
    
    init() {
        getMovies() // 3
    }
    
}

extension MovieViewModel {
    
    // Subscriber implementation
    func getMovies() {
        MovieDB.request(.trendingMoviesWeekly) // 4
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .sink(receiveCompletion: { completion in
                if case .failure(let err) = completion {
                    print("Retrieving data failed with error \(err)")
                }
            }, // 6
            receiveValue: {
                self.movies = $0.movies // 7
            })
            .store(in: &cancelBag)
    }
}
