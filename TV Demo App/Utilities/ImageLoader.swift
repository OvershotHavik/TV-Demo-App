//
//  ImageLoader.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//
import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image: Image? = nil
    //If network call is good, pass up the actual image, if it's nil, it stays the placeholder
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) {[weak self] uiImage in
            guard let self = self else {return}
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


final class ImageLoaderFromData: ObservableObject{
    @Published var image = UIImage()
    @Published var isLoading = true
    
    func loadFromData(mealPhotoData: Data){
        DispatchQueue.global().async { [weak self] in
            guard let self = self else {return}
            let tempImage = UIImage(data: mealPhotoData) ?? UIImage(imageLiteralResourceName: "AppleLogo")
            DispatchQueue.main.async {
                self.image = tempImage
                self.isLoading = false
            }
        }
    }
}


struct RemoteImage: View{
    //helper for the placeholder and to use the placeholder or the actual image if it gets one
    var image: Image?
    var body: some View{
        image?.resizable() ?? Image("AppleLogo").resizable() // If image is nil, use the image in asset as a placeholder
    }
}


struct LoadRemoteImageView: View{ // Used in the list view as a view
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
