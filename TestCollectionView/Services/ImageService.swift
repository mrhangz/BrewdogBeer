//
//  ImageService.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

class ImageService {
  func getImage(urlString: String, completion: @escaping (UIImage) -> Void) {
    if let image = imageCache.object(forKey: urlString as NSString) {
      completion(image)
    } else if let url = URL(string: urlString) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
          if let image = UIImage(data: data) {
            DispatchQueue.main.sync {
              imageCache.setObject(image, forKey: urlString as NSString)
              completion(image)
            }
          }
        }
      }
    }
  }
}
