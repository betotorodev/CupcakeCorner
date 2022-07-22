//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 22/07/22.
//

import SwiftUI

struct AsyncImageView: View {
  var body: some View {
    // forma 1
    //    AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
    
    
    // forma 2
    //    AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
    //        image
    //            .resizable()
    //            .scaledToFit()
    //    } placeholder: {
    //        Color.red
    //    }
    //    .frame(width: 200, height: 200)
    
    
    // forma 3
    AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
      if let image = phase.image {
        image
          .resizable()
          .scaledToFit()
      } else if phase.error != nil {
        Text("There was an error loading the image.")
      } else {
        ProgressView()
      }
    }
    .frame(width: 200, height: 200)
    
  }
}

struct AsyncImageView_Previews: PreviewProvider {
  static var previews: some View {
    AsyncImageView()
  }
}
