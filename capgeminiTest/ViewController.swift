//
//  ViewController.swift
//  capgeminiTest
//
//  Created by Jigar Thakkar on 27/2/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var tableViewInfo: UITableView!
    @IBOutlet weak var navitem: UINavigationItem!
    
    var str:String = ""
    var alamoFireManager : Alamofire.SessionManager?
    
       var results = [Row]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navitem.title = "jigar"
        
        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellidentifier", for: indexPath) as! CanadaInfoTableViewCell
        
    
                
        return cell
    }
    
    func getData(){
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        configuration.timeoutIntervalForResource = 100
        
        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
        
        alamoFireManager?.request(URL.init(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!, method: .get, parameters: [:], encoding: JSONEncoding(), headers: nil).responseData(completionHandler: { (responseData) in
            let responseStrInISOLatin = String(data: responseData.data!, encoding: String.Encoding.isoLatin1)
            guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                print("could not convert data to UTF-8 format")
                return
            }
            do {
                let responseJSONDict = try JSONSerialization.jsonObject(with: modifiedDataInUTF8Format) as! NSDictionary
                
                let canada1 = canada(fromDictionary: responseJSONDict as! [String : Any])
                print(canada1.title)
                print(canada1.rows[0])
                
            } catch {
                print(error)
            }
        })
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

