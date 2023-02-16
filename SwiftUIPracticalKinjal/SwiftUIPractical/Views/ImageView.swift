//
//  ItemView.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import SwiftUI

struct ImageProductView: View {
  
     var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    let imageSize: CGSize
    let radius: CGFloat
    
    
    var body: some View {
        if urlString != "" {
            Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize.width,height: imageSize.height)
                        .cornerRadius(radius)
                        .onReceive(imageLoader.$image) { image in
                            self.image = image
                        }
                        .onAppear {
                            imageLoader.loadImage(for: urlString)
                        }
        }
        else {
            Color.gray.frame(width: 100, height: 100)
        }
        
            }
}

struct ImageProductView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProductView(urlString: "", imageSize: CGSize(width: 100, height: 100), radius: 0)
    }
}

