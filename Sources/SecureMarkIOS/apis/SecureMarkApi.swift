import Foundation
import Alamofire


enum address: String{
    case getProfile = "v1/api/profiles"
}

struct Network {
    
    var session: Session?
    
    init(){
        session = Session(serverTrustManager: makeTrustManager())
    }
    
    func makeTrustManager() -> ServerTrustManager{
        return ServerTrustManager(evaluators: [SecureMark.server: DisabledTrustEvaluator()])
    }
    
    func getProfiles(_ callBack: @escaping () -> Void){
        if SecureMark.token.isEmpty || SecureMark.server.isEmpty { fatalError("missing argument token : \(SecureMark.token) base url : \(SecureMark.server)")}
        
        session!.request(SecureMark.server+address.getProfile.rawValue,
                        method: .post,
                        parameters: RequestProfile(data: RequestData(
                            serviceToken: SecureMark.token,
                            packageName: Bundle.main.bundleIdentifier ?? "",
                            account: SecureMark.account)),
                        encoder: JSONParameterEncoder.default,
                        headers: ["Content-Type": "application/json", "Accept": "application/json"])
        .validate()
        .responseDecodable(of: ResponseProfile.self){response in
            print(response)
            
            switch (response.result) {
            case .success(let result):
                print(result.data)
                callBack()
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
}
