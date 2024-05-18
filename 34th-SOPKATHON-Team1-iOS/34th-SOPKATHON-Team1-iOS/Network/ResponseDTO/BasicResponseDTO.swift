//
//  BasicResponseDTO.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation

// MARK: - BasicDTO
///[goal, todo, not-todo] 다 아래 DTO로 대응 가능

struct BasicResponseDTO: Codable {
    let status: Int
    let message: String
    let data: T?
}
