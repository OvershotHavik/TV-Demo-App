//
//  VideoCell.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//

import SwiftUI



struct VideoCell: View {
    var image: UIImage
    var type: CellType = .latestVideos
    
    
    var body: some View {
        Image(uiImage: image)
            .cornerRadius(20)
            .clipped()
            .border(.clear, width: 10)
    }
}

