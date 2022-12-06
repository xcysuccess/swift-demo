//
//  JYTool.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//
import UIKit

class JYTool {
    class func imageResize(imageNamed img: UIImage?, andResizeTo newSize: CGSize) -> UIImage? {
        let scale = UIScreen.main.scale
        // UIGraphicsBeginImageContext(newSize);
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        img?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    class func imageWithColor(with color: UIColor?) -> UIImage? {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 0)
        color?.setFill()
        UIRectFill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
