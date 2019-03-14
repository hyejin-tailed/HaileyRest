//
//  HMainViewControllerModel.swift
//  haileyRest
//
//  Created by hailey on 3/13/19.
//  Copyright © 2019 hailey. All rights reserved.
//

import UIKit
import Alamofire

struct HMainViewControllerModel {
    
    var title : String = ""
    var content : String = ""

    init() {

    }
    
    func requestDetailCommon(completed: @escaping HRequestCompletion) {
        
        
        
        //MARK: - ∙Alamofire : Alamofire.request(VKRequestDetailCommon, method: .get, parameters: parameters)
        
        //MARK: 1 = 파라미터 꾸리기
        let parameters : HDict = configHParameters()
        let requetUrlString = VKRequestDetailCommon + "?" + parameters.queryParameters
        
        
        
        //MARK: 2 = URL 만들기
        guard let requetURL = URL(string: requetUrlString) else {

            print("DetailCommonRequest = apiURL error")
            completed(nil)
            return
        }
        
        
        
        //MARK: 3 = URLSession 꾸리기
        let session = URLSession.shared
        guard let urlComponents = URLComponents(url: requetURL, resolvingAgainstBaseURL: false) else {
            
            print("DetailCommonRequest = urlComponents error")
            completed(nil)
            return
        }
        
        guard let finalrequetURL = urlComponents.url else {
            
            print("DetailCommonRequest = finalUrl error")
            completed(nil)
            return
        }

        var detailCommonRequest = URLRequest(url: finalrequetURL)
        detailCommonRequest.httpMethod = "GET"
        
        
        
        //MARK: 4 = 호출하기
        let task = session.dataTask(with: detailCommonRequest) { (serverData, response, error) in
            
            
            
        //MARK: - ∙Alamofire : .responseJSON { (response) in ..
        //MARK: - ∙Alamofire : response.result == .failure(let error):
            
        //MARK: 5 = 에러처리

            if error != nil {
                
                print("DetailCommonRequest = error: \(String(describing: error?.localizedDescription))")
                completed(nil)
                return
            }
            
            guard let _serverData = serverData else {

                print("DetailCommonRequest = error: serverData == nil")
                completed(nil)
                return
            }
            
            /*
             관광공사 API는 고유의 status를 쓰므로 제외
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                // ref HTTP Status : https://restfulapi.net/http-status-codes/
//                print("DetailCommonRequest error: Client / Server Error")
//                completed(false)
//                return
//            }
            */
            
            
            
        //MARK: - ∙Alamofire : response.result == .success (let value),
            /*
             String으로 받아서 체크
             if let dataString = String(data: _serverData, encoding: .utf8) {
             print(dataString)
             }
            */
            
        //MARK: 6 = JSON으로 변환하기
            do {
                let dataJson = try JSONSerialization.jsonObject(with: _serverData, options: []) as! HDict
//                print(dataJson)
                
                
                
                //MARK: - ∙ObjectMapper : guard let basic = Mapper<VKResponseBasic>().map(JSON: value as! [String : Any]) ...

                //MARK: 7 = 각각 객체화하기
                guard let response = dataJson["response"] as? HDict else {
                    completed(nil)
                    return
                }
                
                guard let body = response["body"] as? HDict else {
                    completed(nil)
                    return
                }
                
                guard let items = body["items"] as? HDict else {
                    completed(nil)
                    return
                }
                
                guard let item = items["item"] as? HDict else {
                    completed(nil)
                    return
                }
                
                
                
                //MARK: 8 = 결과값 리턴
                print("DetailCommonRequest = Success")
                completed(item)

                
            } catch {
                
                print("DetailCommonRequest = error: dataJson \(error.localizedDescription)")
                completed(nil)
                return
            }
            
        }
        
        
        // 4의 호출 실행 부분
        task.resume()
        
    }
}

