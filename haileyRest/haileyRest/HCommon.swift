//
//  HCommon.swift
//  haileyRest
//
//  Created by hailey on 3/13/19.
//  Copyright © 2019 hailey. All rights reserved.
//

import Foundation

//MARK: - 자주쓰는 자료 타입
public typealias HRequestCompletion = (_ responseData: HDict?) -> Void
public typealias HDict = [String: Any]


//MARK: - 한국 관광공사 Open API 관련
//(Visit Korea -> VK)
let VKRequestDetailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"
var VKServiceKey = "351ytMue1D3CK9I55Riyebir0AJXdsmIm6JaoGh2SjTFULju3TFxnH6%2FI5xZrBlL32%2BAXV0pF9f3%2BBJsE0kcBQ%3D%3D"


//MARK: - Open API 파라미터 config 관련 함수
func configHParameters() -> HDict {
    var temp: [String: Any] = HDict()

    //필수 파라미터
    temp["contentId"] = "142740"

    temp["serviceKey"] = VKServiceKey
    temp["contentTypeId"] = "32"
    temp["MobileOS"] = "IOS"
    temp["MobileApp"] = "Hailey"
    temp["defaultYN"] = "Y"
    temp["areacodeYN"] = "SmartTour"
    temp["_type"] = "json"

    //옵셔널 파라미터
    temp["firstImageYN"] = "Y"
    temp["addrinfoYN"] = "Y"
    temp["overviewYN"] = "Y"
    temp["transGuideYN"] = "Y"
    temp["numberOfRows"] = "1"
    
    return temp
}


//MARK: - Open API 파라미터 config 관련 extension
extension Dictionary {
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value))
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}
