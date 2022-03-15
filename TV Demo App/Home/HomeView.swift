//
//  HomeView.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/14/22.
//

import SwiftUI

enum CellType: Int, CaseIterable{
    case carousal
    case latestVideos
    case classified
    case tools
}


struct HomeView: View{
    @State var sample: PexelsModel?
    
    var body: some View{
        let videosArray = sample?.videos
        let first = videosArray?.first
        Group {
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .leading){
                    NavigationLink(destination: PlayerView(url: first?.videoFiles.first?.link ?? "")) {
                        LoadRemoteImageView(urlString: first?.image ?? "")
                            .frame(width: 200, height: 200)
                            
                    }
                }
            }
        }

        .task{
            sample = await NetworkManager.shared.networkTest()
        }
    }


}

