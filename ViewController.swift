//
//  ViewController.swift
//  TestApp
//
//  Created by Jigar Thakkar on 1/6/15.
//  Copyright (c) 2018 Jigar Thakkar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    
    var results = [Data]()
    
    var mainTitle = ""
    
    var alamoFireManager : Alamofire.SessionManager?

   override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // To Display Row It's Own Contents
        self.tableView.estimatedRowHeight = 100.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        // Pull To Refresh Control
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(ViewController.updateData), for: UIControlEvents.valueChanged)
        updateData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return results.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        //Title updated from jSON 
        self.navigationItem.title = mainTitle
        
        // Configure the cell...
        cell.titleLabel.text = results[indexPath.row].name
        cell.descriptionLabel.text = results[indexPath.row].des
        cell.titleLabel.textColor = UIColor.blue
        
        //Loads the images lazily
        DispatchQueue.main.async(execute: {
            
            if let imgURL: URL = URL(string: self.results[indexPath.row].hrefString){
                
                // Download an NSData representation of the image at the URL
                if let imgData = try? Foundation.Data(contentsOf: imgURL){
                    cell.hrefImage?.image = self.resizeImage(image: UIImage(data: imgData)!,targetSize: CGSize(width: 80 , height: 80) )
                    
                }
                
            }
        })
        
        return cell
    }
    
    func updateData() {
        
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
                
                self.results = self.JsonFromData(modifiedDataInUTF8Format)
                self.tableView.reloadData()
                
            }

        })
        
            // Reload table view
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })

    }
    
    func JsonFromData(_ data: Foundation.Data) -> [Data] {
        
        var results = [Data]()
        var jsonData : [String:Any] = [:]
        
        do {
        jsonData =  try JSONSerialization.jsonObject(with: data) as! [String:Any]
        }catch let error as NSError {
            print(error)
        }
        
        
        mainTitle = jsonData["title"] as! String
        
        // Parse JSON data
        if let jsonrows = jsonData["rows"] as? [AnyObject]{
            for jsonrow in jsonrows {
                
                if let name = jsonrow["title"] as? String{
                    
                    if let desp = jsonrow[ "description"] as? String{
                        
                        if let hrefString = jsonrow[ "imageHref" ] as? String{
                            let result = Data(name:name, des:desp, hrefString:hrefString)
                            results.append(result)
                        }
                    }
                }
            }
            
        }
        
        
        return results
   
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: (size.width * heightRatio), height: (size.height * heightRatio))
        
        } else {
            newSize = CGSize(width: size.width * widthRatio,height:  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
