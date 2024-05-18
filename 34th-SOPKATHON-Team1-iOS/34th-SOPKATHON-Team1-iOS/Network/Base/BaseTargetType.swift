//
//  BaseTargetType.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation
import Moya


enum BaseTargetType {
}

extension BaseTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        }
    }
    
    var method: Moya.Method {
        switch self {
        }
    }
    
    var task: Moya.Task {
        switch self {
        }
    }
    
    var headers: [String : String]? {
        switch self {
        }
        
    }
}


