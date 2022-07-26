import Alamofire
import Foundation
import SwiftOTP



enum address: String{
    case getProfile = "v1/api/profiles"
}

struct Network {
    let manager = ServerTrustManager(evaluators: [SecureMark.server: DisabledTrustEvaluator()])
    let session = Session(serverTrustManager: manager)
    
    func getProfiles(_ callBack: @escaping () -> Void){
        if SecureMark.token.isEmpty || SecureMark.server.isEmpty { fatalError("missing argument token : \(SecureMark.token) base url : \(SecureMark.server)")}
        
        session.request(SecureMark.server+address.getProfile.rawValue,
                        method: .post,
                        parameters: RequestProfile(data: RequestData(
                            serviceToken: SecureMark.token,
                            packageName: Bundle.main.bundleIdentifier,
                            account: SecureMark.account)),
                        encoder: JSONParameterEncoder.default,
                        headers: ["Content-Type": "application/json", "Accept": "application/json"])
        .validate()
        .responseDecodable(of: ResponseProfile.self){response in
            log.debug(response)
            
            switch (response.result) {
            case .success(let result):
                pirnt(result.data)
                callBack()
            case .failure(let error):
                pirnt("Request error: \(error)")
            }
        }
    }

}
