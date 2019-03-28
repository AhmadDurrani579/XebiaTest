//
//  DataModel.swift
//  ADIM
//
//  Created by Ahmed Durrani on 06/10/2017.
//  Copyright © 2017 Expert_ni.halal_Pro. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper


class UserResponse: Mappable {
    
    var status                           :       String?
    var message                          :       String?
    var num_results                      :       Int?
    var copyright                        :       String?
    var result                           :       [ArticleObjectInfo]?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        

        status      <- map["status"]
        message     <- map["message"]
        num_results        <- map["num_results"]
        copyright        <- map["copyright"]
        result <- map["results"]

        
    }
}

class ArticleObjectInfo : Mappable {
    
    var url                                   :       String?
    var adx_keywords                          :       String?
    var column                                :       String?
    var section                               :       String?
    var byline                                :       String?
    var type                                  :       String?
    var title                                 :       String?

    var abstract                              :       String?
    var published_date                        :       String?
    var source                                :       String?
    var id                                    :       Int?
    var asset_id                              :       Int?
    var views                                 :       Int?
    var media                                 :       [MediaObject]?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        adx_keywords <- map["adx_keywords"]
        column <- map["column"]
        section <- map["section"]
        byline <- map["byline"]
        type <- map["type"]

        title <- map["title"]
        abstract <- map["abstract"]
        published_date <- map["published_date"]
        source <- map["source"]
        id <- map["id"]
        asset_id <- map["asset_id"]
        views <- map["views"]
        media <- map["media"]
    }
}




class MediaObject : Mappable {
    
    var type                                    :       String?
    var subtype                                 :       String?
    var caption                                 :       String?
    var approved_for_syndication                :       Int?
    var mediaMetadata                           :       [GalleryOfArticle]?

    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        type <- map["type"]
        subtype <- map["subtype"]
        caption <- map["caption"]
        approved_for_syndication <- map["approved_for_syndication"]
        mediaMetadata <- map["media-metadata"]
    }
}



class GalleryOfArticle : Mappable {
    
    var height                                       :       Int?
    var width                                        :       Int?
    var url                                          :       String?

    var format                                       :       String?

    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        
        height <- map["iheightd"]
        width <- map["width"]
        url <- map["url"]
        format <- map["format"]


        
    }
}



