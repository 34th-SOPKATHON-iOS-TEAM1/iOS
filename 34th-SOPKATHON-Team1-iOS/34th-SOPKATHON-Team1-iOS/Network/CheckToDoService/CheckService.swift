//
//  CheckService.swift
//  34th-SOPKATHON-Team1-iOS
//
//  Created by 박신영 on 5/19/24.
//

import Foundation
import Moya

final class CheckService {
    static let shared = CheckService()
    private var checkProvider = MoyaProvider<BaseTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension CheckService {
    func getCheckTodoNotTodoList(completion: @escaping (NetworkResult<Any>) -> Void) {
       checkProvider.request(.getAll) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, GetAllResponseDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }
        
        return .success(decodedData as Any)
    }
}

///지훈 getTodoList 함수 구현

func getTodoList() {
   CheckService.shared.getCheckTodoNotTodoList() { response in
      switch response {
      case .success(let data):
         guard let data = data as? GetAllResponseDTO else {
            return }
         print(data)
      case .requestErr:
         print("요청 오류 입니다")
      case .decodedErr:
         print("디코딩 오류 입니다")
      case .pathErr:
         print("경로 오류 입니다")
      case .serverErr:
         print("서버 오류입니다")
      case .networkFail:
         print("네트워크 오류입니다")
      }
   }
}
