//
//  ViewController.swift
//  capgeminiTest
//
//  Created by Jigar Thakkar on 27/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navitem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navitem.title = "jigar"
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

    // MARK: User-defined methods
//    //-- A method to resize the image before display in a tableview' cell
//    func image(with image: UIImage, scaledTo newSizeOfImage: CGSize) -> UIImage {
//        //UIGraphicsBeginImageContext(newSize);
//        // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
//        // Pass 1.0 to force exact pixel size.
//        let size: CGSize = image.size
//        let widthRatio: CGFloat = newSizeOfImage.width / image.size.width
//        let heightRatio: CGFloat = newSizeOfImage.height / image.size.height
//        // Figure out what our orientation is, and use that to form the rectangle
//
////        if widthRatio > heightRatio {
////            newSizeOfImage = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
////        }
////        else {
////            newSizeOfImage = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
////        }
//
//        // This is the rect that we've calculated out and this is what is actually used below
//        let rect = CGRect(x: 0, y: 0, width: newSizeOfImage.width, height: newSizeOfImage.height)
//        // Actually do the resizing to the rect using the ImageContext stuff
//        UIGraphicsBeginImageContextWithOptions(newSizeOfImage, false, 0.0)
//        image.draw(in: rect)
//        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage ?? UIImage()
//    }

    
    
}

