//
//  PostTodoRequestBody.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation

// MARK: - PostTodoRequestBody

struct PostTodoRequestBody: Codable {
    let todoContent: [String]
}
