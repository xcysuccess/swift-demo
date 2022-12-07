//
//  UIImage+Extension.swift
//  02-tableview-home
//
//  Created by tomxiang on 2022/12/7.
//

import UIKit

extension UIImage {
    /// 图片缩放到指定大小
    class func imageResize(imageNamed img: UIImage?, andResizeTo newSize: CGSize) -> UIImage? {
        let scale = UIScreen.main.scale
        // UIGraphicsBeginImageContext(newSize);
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        img?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 颜色转化为图片
    class func imageWithColor(with color: UIColor?) -> UIImage? {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 0)
        color?.setFill()
        UIRectFill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 返回不被拉伸的图片
    class func imageWithRenderingMode(_ originalImage: UIImage) -> UIImage {
        return originalImage.withRenderingMode(.alwaysOriginal)
    }
}
