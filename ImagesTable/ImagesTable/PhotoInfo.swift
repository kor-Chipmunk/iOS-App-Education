//
//  PhotoInfo.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 7..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoInfo: Object {
//    dynamic var id:         Int         = 0
    dynamic var imageData:  Data?       = nil
    dynamic var title:      String?     = nil
    dynamic var savedDate:  Date        = Date()
    
//    override static func primaryKey() -> String? {
//        return "id"
//    }
}
