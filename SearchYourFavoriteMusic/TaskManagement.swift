//
//  TaskManagement.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/6/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation

//Singleton object to access Service
public var sharedService: TaskManagement {
    return TaskManagement.sharedInstance
}

public typealias JSON = [String:Any]

public class TaskManagement {
    private init() {
        
    }
    public static var sharedInstance = TaskManagement()
    
   public func getMusicData( urlString: String, block:@escaping () -> (), completionHandler:@escaping (Data) -> ()) {
    
            var urlString = urlString
            urlString = "https://itunes.apple.com/search?term=tom+waits"
//            urlString = "https://itunes.apple.com/search?term=flappy&entity=software"
            
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            guard let url = URL(string: urlString) else { return }
            session.dataTask(with: url){ (data,response,error) in
                if error != nil { return }
                guard let data = data else { return }
                completionHandler(data)
               
            }.resume()
    }
    
    public func getImageData(urlString: String?, completionHandler: @escaping (Data) -> ()) {
        guard let _urlString = urlString else { return }
        guard let url = URL(string: _urlString) else { return }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        session.downloadTask(with: url) { (locationURL, response, error) in
            if (error != nil) {
                print(url)
                print("Error occured while downloading the image")
            }
            
            guard let _locationURL = locationURL else { return }
            do {
            let data = try Data(contentsOf: _locationURL)
                completionHandler(data)
            } catch {
                print("Error occured while getting data from url")
            }
        }.resume()
        
        
    }
    
    
}
