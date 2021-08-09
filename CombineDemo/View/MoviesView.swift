//
//  MoviesView.swift
//  CombineDemo
//
//  Created by Inpyo Hong on 2021/08/09.
//

import SwiftUI

struct MoviesView: View {
    // 1
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in // 2
            HStack {
                VStack(alignment: .leading) {
                    Text(movie.title) // 3a
                        .font(.headline)
                    Text(movie.originalTitle) // 3b
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoviesView()
    }
}
