//
//  ImageView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/11/21.
//

import SwiftUI
import Combine
import Foundation


struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    var mode: ContentMode = .fit

    init(withURL url:String, mode: ContentMode = .fit) {
        imageLoader = ImageLoader(url: url)
        self.mode = mode
    }

    var body: some View {
            GeometryReader { geo in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: self.mode)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
            }
        }
    }
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(url :String) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}


struct NetworkImage: View {
    let url: URL?
    var body: some View {
        if let url = url, let imageData = try? Data(contentsOf: url), let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        }
    }
}
