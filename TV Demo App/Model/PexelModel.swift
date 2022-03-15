//
//  PexelModel.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//

import Foundation

struct PexelsModel: Codable{
    let page: Int
    let videos: [Videos]
}

struct Videos: Codable{
    let image: String
    var videoFiles: [VideoFiles]
}

struct VideoFiles: Codable{
    let id: Int
    let quality: String
    var width: Int?
    var height: Int?
    let link: String
}
