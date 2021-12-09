//
//  DetailMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    @State var tabBar: UITabBar?
    
    var body: some View {
        
        ZStack {
            
            
            VStack {
                ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                    mode: .fill)
                    .frame(width: UIScreen.width, height: UIScreen.height / 3)
                Spacer()
            }
            
            ScrollView.init(showsIndicators: false, content: {
                
                VStack {

                    Rectangle().frame(width: 0, height: UIScreen.width / 1.8, alignment: .top).accentColor(Color.red)

                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(radius: 16, corners: [.topLeft, .topRight])
                        .frame(width: UIScreen.width, height: 25)

                    VStack {

                        HStack {
                            Text("The Old Guardian")
                            Spacer()
                            Text("8,5")
                                .font(.system(size: 10))
                                .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(3)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)

                        TagView(data: ["Android", "iOS", "Flutter", "React Native"],
                                spacing: 5,
                                padding: 5,
                                backgroundColor: Color.white)
                            .padding(.top, 16)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)

                        HStack(alignment: .top, spacing: 10) {

                            VStack(alignment: .leading, spacing: 16) {
                                StatusDescriptionView(title: "Status :", description: "Released")
                                StatusDescriptionView(title: "Runtime :", description: "124")
                                StatusDescriptionView(title: "Premiere :", description: "10/10/2022")
                                StatusDescriptionView(title: "Budget :", description: "$120")
                                StatusDescriptionView(title: "Revenue :", description: "$100")
                            }

                            Spacer()

                            ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                                mode: .fill)
                                .frame(width: 100, height: 150)
                                .cornerRadius(16)

                        }
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Overview")
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)

                            Text("Lorem Ipsum  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        PeopleView()
                            .padding(.top, 16)

                    }
                    .padding(.bottom, 40)
                    .background(Color.white)
                    .padding(.top, -8)

                    
                    SimiliarMovieView(tabBar: self.tabBar)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                            .background(Color.white)
                        
                    Spacer()
                    
                }

            })
            
        }
        .background(Color.white)
        .navigationTitle("Movie")
        .onAppear {
            self.tabBar?.isHidden = true
        }
        
    }
    
    
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
