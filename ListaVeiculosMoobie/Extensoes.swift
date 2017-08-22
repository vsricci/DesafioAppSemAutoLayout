//
//  Extensoes.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 17/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    
    
    func loadImageUsingCacheWithString(urlString: String){
        
        self.image = nil
        //checando o cache para a imagem
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject){
            self.image = cacheImage as! UIImage
            return
        }
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {data,response,error in
            
            if (error != nil){
                print(error)
                return
            }
            DispatchQueue.main.async {
                
                if let downloadImage = UIImage(data: data!){
                    
                    imageCache.setObject(downloadImage, forKey: urlString as AnyObject)
                    self.image = downloadImage
                    
                    
                    
                }
                
            }
            
            }.resume()
    }
}


/*extension UIImage {
 enum JPEGQuality : CGFloat{
 
 case lowest = 0
 case low = 0.25
 case medium = 0.5
 case high = 0.75
 case highest = 1
 }
 
 
 var png : Data?
 {
 return UIImagePNGRepresentation(self)
 }
 
 func jpeg(_ quality: JPEGQuality) -> Data? {
 return UIImageJPEGRepresentation(self, quality.rawValue)
 }
 }*/

extension UIImage{
    
    func compressTo(_ expectedSizeInMb: Int) -> UIImage? {
        
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress : Bool = true
        var imgData : Data?
        var compressingValue: CGFloat = 1.0
        while (needCompress){
            
            if let data: Data = UIImageJPEGRepresentation(self, compressingValue){
                if data.count < sizeInBytes{
                    needCompress = false
                    imgData = data
                }else{
                    compressingValue -= 0.1
                }
            }
        }
        
        
        if let data = imgData{
            return UIImage(data: data)
        }
        return nil
    }
}

