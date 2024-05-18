//
//  GetAllResponseDTO.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation

// MARK: - Temperatures

struct GetAllResponseDTO: Codable {
    let status: Int
    let message: String
    let data: GetAllResponseDataClass
}

// MARK: - DataClass
struct GetAllResponseDataClass: Codable {
    let goal: String
    let todoContent, notTodoContent: [String]
}
