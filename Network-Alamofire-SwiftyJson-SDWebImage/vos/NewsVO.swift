//
//  NewsVO.swift
//  Network-Alamofire-SwiftyJson-SDWebImage
//
//  Created by Win Than Htike on 11/10/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsVO {
    
    var author : String? = nil
    
    var title : String? = nil
    
    var description : String? = nil
    
    var url : String? = nil
    
    var urlToImage : String? = nil
    
    var publishedAt : String? = nil
    
    var content : String? = nil
    
    static func parseToNewsVO(_ data : JSON) -> NewsVO {
        
        let news = NewsVO()
        news.author = data["author"].string
        news.title = data["title"].string
        news.description = data["description"].string
        news.url = data["url"].string
        news.urlToImage = data["urlToImage"].string
        news.publishedAt = data["publishedAt"].string
        news.content = data["content"].string
        return news
        
    }
    
}
