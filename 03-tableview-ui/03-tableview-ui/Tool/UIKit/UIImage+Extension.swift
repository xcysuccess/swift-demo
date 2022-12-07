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
    
    /// 图片去锯齿
    func setAntialiasedImage(_ size: CGSize, _ scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: 1, y: 1, width: size.width-2, height: size.height-2))
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 图片置灰
    func setAshPlacingImage(_ sourceImage: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil , width: Int(self.size.width), height: Int(self.size.height),bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        context?.draw(sourceImage.cgImage!, in: CGRect.init(x: 0, y: 0, width: sourceImage.size.width, height: sourceImage.size.height))
        let cgImage = context!.makeImage()
        let grayImage = UIImage.init(cgImage: cgImage!)
        return grayImage
    }
    
    /// 截屏使用
    func screenShotWithoutMask(shotView: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(shotView.frame.size, true, 0.0)
        shotView.drawHierarchy(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: kScreenW, height: kScreenH)), afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /**
     生成高清二维码
     */
    class func createQRForString(_ qrString: String) -> UIImage {
        if qrString.isEmpty == true{
            return UIImage()
        }
        // 将字符串转换为二进制
        let data = qrString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        let qrCIImage = filter.outputImage
        let colorFilter = CIFilter(name: "CIFalseColor")!
        colorFilter.setDefaults()
        colorFilter.setValue(qrCIImage, forKey: "inputImage")
        colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        
        let outImage = colorFilter.outputImage
        let scale = 172 / outImage!.extent.size.width;
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        let transformImage = colorFilter.outputImage!.transformed(by: transform)
        let image = UIImage(ciImage: transformImage)
        
        return image
    }
}
