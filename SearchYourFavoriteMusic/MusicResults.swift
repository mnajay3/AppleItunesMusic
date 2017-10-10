//
//  MusicResults.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/21/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation

class MusicResults {
    var artistId: Int?
    var artistName: String?
    var artistViewUrl: String?
    var artworkUrl100: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var collectionCensoredName: String?
    var collectionExplicitness: String?
    var collectionId: Int?
    var collectionName: String?
    var collectionPrice: Int?
    var collectionViewUrl: String?
    var country: String?
    var currency: String?
    var discCount: Int?
    var discNumber: Int?
    var kind: String?
    var previewUrl: String?
    var primaryGenreName: String?
    var trackCensoredName: String?
    var trackCount: Int?
    var trackExplicitness: String?
    var trackId: Int?
    var trackName: String?
    var trackNumber: Int?
    var trackPrice: Int?
    var trackTimeMillis: Int?
    var trackViewUrl: String?
    var wrapperType: String?
    
    init(json: JSON) {
        self.artistId = castJSONIntResposne(json: json, for: "artistId") 
        self.artistName = castJSONStrResposne(json: json, for: "artistName")
        self.artistViewUrl = castJSONStrResposne(json: json, for: "artistViewUrl")
        self.artworkUrl100 = castJSONStrResposne(json: json, for: "artworkUrl100")
        self.artworkUrl30 = castJSONStrResposne(json: json, for: "artworkUrl30")
        self.artworkUrl60 = castJSONStrResposne(json: json, for: "artworkUrl60")
        self.collectionCensoredName = castJSONStrResposne(json: json, for: "collectionCensoredName")
        self.collectionExplicitness = castJSONStrResposne(json: json, for: "collectionExplicitness")
        self.collectionId = castJSONIntResposne(json: json, for: "collectionId") 
        self.collectionName = castJSONStrResposne(json: json, for: "collectionName")
        self.collectionPrice = castJSONIntResposne(json: json, for: "collectionPrice")
        self.collectionViewUrl = castJSONStrResposne(json: json, for: "collectionViewUrl")
        self.country = castJSONStrResposne(json: json, for: "country")
        self.currency = castJSONStrResposne(json: json, for: "currency")
        self.discCount = castJSONIntResposne(json: json, for: "discCount") 
        self.kind = castJSONStrResposne(json: json, for: "kind")
        self.previewUrl = castJSONStrResposne(json: json, for: "previewUrl")
        self.primaryGenreName = castJSONStrResposne(json: json, for: "primaryGenreName")
        self.trackCensoredName = castJSONStrResposne(json: json, for: "trackCensoredName")
        self.trackExplicitness = castJSONStrResposne(json: json, for: "trackExplicitness")
        self.trackId = castJSONIntResposne(json: json, for: "trackId") 
        self.trackName = castJSONStrResposne(json: json, for: "trackName")
        self.trackNumber = castJSONIntResposne(json: json, for: "trackNumber") 
        self.trackPrice = castJSONIntResposne(json: json, for: "trackPrice")
        self.trackTimeMillis = castJSONIntResposne(json: json, for: "trackTimeMillis")
        self.trackViewUrl = castJSONStrResposne(json: json, for: "trackViewUrl")
        self.wrapperType = castJSONStrResposne(json: json, for: "wrapperType")
    }
    
    func castJSONStrResposne(json: JSON, for key: String) -> String {
        guard let _kind = json[key] else { return "" }
        return _kind as! String
    }
    
    func castJSONIntResposne(json: JSON, for key: String) -> Int {
        guard let _kind = json[key] else { return 0 }
        return _kind as! Int
    }
    func string() -> String {
        return ("artistId  :  \(self.artistId), \n artistName  :  \(self.artistName),  \n artistViewUrl  :  \(self.artistViewUrl), \n artworkUrl100  :  \(self.artworkUrl100), \n artworkUrl30  :  \(self.artworkUrl30), \n artworkUrl60  :  \(self.artworkUrl60), \n collectionCensoredName  :  \(self.collectionCensoredName), \n collectionExplicitness  :  \(self.collectionExplicitness), \n collectionId  :  \(self.collectionId), \n collectionName  :  \(self.collectionName), \n collectionPrice  :  \(self.collectionPrice), \n collectionViewUrl  :  \(self.collectionViewUrl), \n country  :  \(self.country), \n currency  :  \(self.currency), \n discCount  :  \(self.discCount), \n kind  :  \(self.kind), \n previewUrl  :  \(self.previewUrl), \n primaryGenreName  :  \(self.primaryGenreName), \n trackCensoredName  :  \(self.trackCensoredName), \n trackExplicitness  :  \(self.trackExplicitness), \n trackId  :  \(self.trackId), \n trackName  :  \(self.trackName), \n trackNumber  :  \(String(describing: self.trackNumber)), \n trackPrice  :  \(String(describing: self.trackPrice)), \n trackTimeMillis  :  \(String(describing: self.trackTimeMillis)), \n trackViewUrl  :  \(String(describing: self.trackViewUrl)), \n wrapperType  :  \(String(describing: self.wrapperType))")
    }
}
