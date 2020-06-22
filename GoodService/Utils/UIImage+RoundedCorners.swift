//
//  UIImage+RoundedCorners.swift
//  GoodService
//
//  Created by Chris Sanders on 6/21/20.
//  Copyright © 2020 Chris Sanders. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: 4, height: 4)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 4, height: 4), false, 0)
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: 2)
        color.setFill()
        bezierPath.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        guard  let cgImage = image.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
}
