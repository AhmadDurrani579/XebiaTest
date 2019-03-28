//
//  WAShareHelper.swift
//  WhereApp
//
//  Created by Salman on 24/05/2017.
//  Copyright © 2017 Salman. All rights reserved.
//

import UIKit
import SDWebImage


class WAShareHelper: NSObject {


    class func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    class func loadImage(urlstring: String, imageView: UIImageView , placeHolder : String) {
        imageView.setShowActivityIndicator(true)
        imageView.setIndicatorStyle(.gray)
        imageView.sd_setImage(with: URL(string: urlstring), placeholderImage: UIImage(named: placeHolder))
        
        
    }
    class func loadImageWithCompletion(urlstring: String, showLoader: Bool, imageView: UIImageView, completion: @escaping (_ image: UIImage?) -> Void) {
        imageView.setShowActivityIndicator(true)
        imageView.setIndicatorStyle(.gray)
        
        let block: SDWebImageCompletionBlock! = ({(image, error, cacheType, imageURL) -> Void in
            completion(image)
        })
        imageView.sd_setImage(with: URL(string: urlstring), completed: block)
        
    }
    
    class func setBorderAndCornerRadius(layer: CALayer, width: CGFloat, radius: CGFloat,color : UIColor ) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    class func postImageHeight(serverSideHeight: Double , serverSidewidth:Double, width: CGFloat) -> CGFloat{
        var rHeight = Double(0)
        let rWidth = Double(width)
        if(serverSideHeight == 0 ){
            rHeight = Double((width) * 0.37)
        }else{
            rHeight = (serverSideHeight/serverSidewidth) * rWidth
        }
        return CGFloat(rHeight)
    }

  
    class func getFromUserDefault(key: String) -> String {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: key) == nil else {
            return defaults.object(forKey: key) as! String
        }
        return ""
    }
    class func setViewCornerRadius(_ view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    
    class func compressImageWithAspectRatio (image: UIImage) -> Data {
//         if let imageData = profileImage?.jpegData(compressionQuality: 0.5) {
        
        let data = image.jpegData(compressionQuality: 0.5)
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useKB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(data!.count))
        print("Data size is: \(string)")
        var separatedString = string.components(separatedBy: " ")
        print(separatedString)
        let dataLenth = separatedString[0]
        //let removedComma = dataLenth.stringByReplacingOccurrencesOfString(",", withString: "")
        let removedComma = dataLenth.replacingOccurrences(of: ",", with: "")
        print(Int(removedComma)!)
        
        
        if(Int(removedComma)! > 200 ){
            let actualHeight:CGFloat = image.size.height
            let actualWidth:CGFloat = image.size.width
            let imgRatio:CGFloat = actualWidth/actualHeight
            let maxWidth:CGFloat = 1440.0
            let resizedHeight:CGFloat = maxWidth/imgRatio
            let compressionQuality:CGFloat = 0.5
            
            let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
            UIGraphicsBeginImageContext(rect.size)
            //image.drawInRect(rect)
            image.draw(in: rect)
            let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!

            let imageData = img.jpegData(compressionQuality: 0.5)

//            let imageData = UIImageJPEGRepresentation(img, compressionQuality)!
            UIGraphicsEndImageContext()
            print("Data size is: \(imageData?.count)")
            let bcf = ByteCountFormatter()
            bcf.allowedUnits = [.useKB] // optional: restricts the units to MB only
            bcf.countStyle = .file
//            let string = bcf.string(fromByteCount: Int64(imageData))
////            let string = bcf.string(fromByteCount: Int64(imageData?.count))
//            print("Data size is: \(string)")
            return imageData!
            
        } else{
            return data!
        }
        
        //return UIImage(data: imageData)!
        
    }
    
    
    
    
}
