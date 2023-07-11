//
//  UIImage+Extension.swift
//  EyeGlucose
//
//  Created by hamdi on 06/07/2023.
//


import UIKit

extension UIImage {
    func withRoundedCorners(radius: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let clippingPath = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: radius)
        clippingPath.addClip()
        draw(in: CGRect(origin: .zero, size: size))
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage
    }
}

@IBDesignable
class RoundedImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
            if let roundedImage = image?.withRoundedCorners(radius: cornerRadius) {
                image = roundedImage
            }
        }
    }
}
