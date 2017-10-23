//
//  UIImage+Oritentation.swift
//  Glup
//
//  Created by Arturo Gamarra on 9/28/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import UIKit

extension UIImage {

    // MARK: - Public
    func cloneWithFixOrientation() -> UIImage {
        if (self.imageOrientation == .up) {
            return self
        }
        var transform = CGAffineTransform.identity
        
        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
            break;
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi / 2))
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -CGFloat(Double.pi / 2))
        default:
            break
        }
        
        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        default:
            break
        }
        
        guard let cgImage = self.cgImage
            , let colorSpace = cgImage.colorSpace
            , let context = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height),
                                     bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0,
                                     space: colorSpace,
                                     bitmapInfo: cgImage.bitmapInfo.rawValue) else {
            return self
        }
        context.concatenate(transform)
        
        switch self.imageOrientation {
        case .left, .leftMirrored, .rightMirrored, .right:
            context.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.height, height: self.size.width))
            break
        default:
            context.draw(self.cgImage!, in: CGRect(x:0, y: 0, width: self.size.width, height: self.size.height))
            break
        }
        
        // And now we just create a new UIImage from the drawing context
        guard let cgimg = context.makeImage() else {
            return self
        }
        return UIImage(cgImage: cgimg)
    }
    
    func imageWithSize(size:CGSize) -> UIImage {
        let aspectWidth:CGFloat = size.width / self.size.width;
        let aspectHeight:CGFloat = size.height / self.size.height;
        let aspectRatio:CGFloat = min(aspectWidth, aspectHeight);
        let size = CGSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio)
        
        UIGraphicsBeginImageContext(size);
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height));
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return scaledImage!;
    }
    
}
