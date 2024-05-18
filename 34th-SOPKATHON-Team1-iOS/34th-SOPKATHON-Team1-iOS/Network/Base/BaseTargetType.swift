//
//  BaseTargetType.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation

import Moya


enum BaseTargetType: TargetType {
    
    case postGoal(request: [String])
    case postToDo(request: [String])
    case postNotToDo(request: [String])
    case getAll
}

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .postGoal:
            return "/api/v1/goal"
        case .postToDo:
            return "/api/v1/todo"
        case .postNotToDo:
            return "/api/v1/not-todo"
        case .getAll:
            return "/api/v1/all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postGoal, .postToDo, .postNotToDo:
            return .post
        case .getAll:
            return .get
        }
    }
    
    var requestBody: [String : Any]? {
        switch self {
        case .postGoal(let data):
            return ["goalContent" : data]
        case .postToDo(let data):
            return ["todoContent" : data]
        case .postNotToDo(let data):
            return ["notTodoContent" : data]
        case .getAll:
            return [:]
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postGoal(let request):
            return .requestJSONEncodable(request)
        case .postToDo(let request):
            return .requestJSONEncodable(request)
        case .postNotToDo(let request):
            return .requestJSONEncodable(request)
        case .getAll:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postGoal, .postToDo, .postNotToDo, .getAll:
            return ["Content-Type": "application/json",
                    "memberId" : "1"]
        }
        
    }
}


