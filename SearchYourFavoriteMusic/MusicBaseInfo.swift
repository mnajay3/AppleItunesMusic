//
//  MusicBaseInfo.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/21/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation

class MusicBaseInfo  {
    
    
    var resultCount: Int?
    var results: [MusicResults]?
    
    init(json: JSON) {
        guard let res = json["results"] as? [JSON] else { return }
        self.results = res.map{ item -> MusicResults in
                MusicResults(json: item)
        }
        guard let resCount = json["resultCount"] as? Int else { return }
        self.resultCount = resCount
        for item in self.results! {
            print(item.string())
        }
    }
    
}
