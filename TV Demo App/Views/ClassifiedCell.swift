//
//  ClassifiedCell.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//

import SwiftUI

struct ClassifiedCell: View {
    var title: String
    
    
    var body: some View {
        GeometryReader{ bounds in
            VStack{
                Text(title)
            }
            .cornerRadius(bounds.size.height/2)
            .clipped()
            .background(Color(uiColor: .random))
            .border(.clear, width: 10)
        }
        
        
        
    }
}

extension UIColor{
    static var random: UIColor{
        return UIColor(red: .random(in: 0.65...1),
                       green: .random(in: 0.65...1),
                       blue: .random(in: 0.65...1),
                       alpha: 0.8)
    }
}
