//
//  UIImage+resizing.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit

extension UIImage {

    func resizeTo(_ targetSize: CGSize) -> UIImage? {

        let widthRatio: CGFloat  = targetSize.width  / size.width
        let heightRatio: CGFloat = targetSize.height / size.height

        let newSize: CGSize

        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        let rect: CGRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: rect)
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
