//
//  DetailMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    @State var tabBar: UITabBar?
    
    @State var movie: Movie?
    
    @ObservedObject private var viewModel = DetailViewModel()
    
    var body: some View {
        
        ZStack {
            
            
            VStack {
                ImageView(url: viewModel.movie?.getImagePoster() ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.width,
                           height: UIScreen.height / 3)
                Spacer()
            }
            
            ScrollView.init(showsIndicators: false, content: {
                
                VStack {

                    Rectangle().frame(width: 0,
                                      height: UIScreen.width / (ScreenUtil.isIphone() ? 1.8 : 3),
                                      alignment: .top)
                        .accentColor(Color.red)

                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(radius: 16, corners: [.topLeft, .topRight])
                        .frame(width: UIScreen.width, height: 25)

                    VStack {

                        HStack {
                            Text(viewModel.movie?.title ?? "")
                            Spacer()
                            Text("\(String(format: "%.1f", viewModel.movie?.voteAverage ?? 0))")
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(3)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)

                        TagView(data: viewModel.movie?.allGenre() ?? [],
                                spacing: 5,
                                padding: 5,
                                backgroundColor: Color.white)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)

                        HStack(alignment: .top, spacing: 10) {

                            VStack(alignment: .leading, spacing: 16) {
                                StatusDescriptionView(title: "Status :", description: viewModel.movie?.status ?? "")
                                StatusDescriptionView(title: "Runtime :", description: "\(viewModel.movie?.runtime ?? 0)")
                                StatusDescriptionView(title: "Premiere :", description: DateFormat.convertStringDate(viewModel.movie?.releaseDate ?? ""))
                                StatusDescriptionView(title: "Budget :", description: (Double((viewModel.movie?.budget ?? 0))).toCurrency())
                                StatusDescriptionView(title: "Revenue :", description: (Double((viewModel.movie?.revenue ?? 0))).toCurrency())
                            }

                            Spacer()

                            ImageView(url: viewModel.movie?.getImageBackdrop() ?? "")
                                .frame(width: ScreenUtil.isIphone() ? 100 : 150)
                                .cornerRadius(16)

                        }
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Overview")
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)

                            Text(viewModel.movie?.overview ?? "")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                        }
                        .padding(.top, 16)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        PeopleView(crews: viewModel.crews)
                            .padding(.top, 16)
                        
                    }
                    .padding(.bottom, 40)
                    .background(Color.white)
                    .padding(.top, -8)

                    SimiliarMovieView(movies: viewModel.similiar, tabBar: self.tabBar)
                        .background(Color.white)
                        .padding(.top, -30)
                        
                    Spacer()
                    
                }

            })
            
        }
        .background(Color.white)
        .navigationTitle("Movie")
        .onAppear {
            self.tabBar?.isHidden = true
            self.viewModel.loadMovie(self.movie)
        }
        
    }
    
    
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
