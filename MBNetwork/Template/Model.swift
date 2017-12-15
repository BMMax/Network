//
//  Model.swift
//  MBNetwork
//
//  Created by user on 2017/12/14.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation

struct Model: ModelProtocol,Codable {
    var data: Data?
    var status: String?

    struct Data: Codable {
        var adcode : String?
        var areacode : String?
        var city : String?
        var cityadcode : String?
        var code : String?
        var country : String?
        //var crossList : [CrossList]?
        var desc : String?
        var district : String?
        var districtadcode : String?
        var message : String?
        //var poiList : [PoiList]?
        var pos : String?
        var province : String?
        var provinceadcode : String?
        var result : String?
        //var roadList : [RoadList]?
        //var seaArea : SeaArea?
        var tel : String?
        var timestamp : String?
        var version : String?

//        enum Gender: String, Decodable {
//            case male
//            case female
//            case other
//        }
    }

}
