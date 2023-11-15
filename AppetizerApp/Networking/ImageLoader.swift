//
//  ImageLoader.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImage(fromUrlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: fromUrlString) { uiImage in
            guard let image = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-place-holder").resizable()
    }
}

struct AppetizerRemoteImageLoader: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.loadImage(fromUrlString: urlString) }
    }
}
