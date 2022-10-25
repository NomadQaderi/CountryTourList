//
//  CustomImageView.swift
//  CountryTourList
//
//  Created by NOMAD on 9/25/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {
    var task: URLSessionDataTask!
    var spinner = UIActivityIndicatorView(style: .medium)
    
    func loadImage(from url: URL) {
        image = nil
        addSpinner()
        
        if let task = task  {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteURL as AnyObject) as? UIImage {
            self.image = imageFromCache
            removeSpinner()
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data = data,
                  let newImage = UIImage(data: data) else {
                print("Could not load image from url \(url.absoluteString)")
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteURL as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
        }
        
        task.resume()
    }
    
    func addSpinner () {
        addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        spinner.startAnimating()
    }
    
    func removeSpinner () {
        spinner.removeFromSuperview()
    }
    
}
