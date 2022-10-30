//
//  SetsModel.swift
//  workout-routine
//
//  Created by William Reinert on 27/10/22.
//

import Foundation

class MobileBrand {
   var brandName: String?
   var modelName: [String]?
     
   init(brandName: String, modelName: [String]) {
       self.brandName = brandName
       self.modelName = modelName
   }
}
