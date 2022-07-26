import Foundation
import Alamofire


enum address: String{
    case getProfile = "/v1/api/profiles"
}

struct Network {
    var server: String
    var token: String
    var account: String
    
    var session: Session?
    
    init(server: String, token: String, account: String){
        self.server = server
        self.token = token
        self.account = account
        session = Session(serverTrustManager: makeTrustManager())
    }
    
    func makeTrustManager() -> ServerTrustManager{
        let ip = server.components(separatedBy: "://")[1]
        print(ip)
        return ServerTrustManager(evaluators: [ip: DisabledTrustEvaluator()])
    }
    
    func getProfiles(_ callBack: @escaping () -> Void){
        if self.token.isEmpty || self.server.isEmpty { fatalError("missing argument token : \(token) base url : \(server)")}
        
        self.session!.request(server+address.getProfile.rawValue,
                        method: .post,
                        parameters: RequestProfile(data: RequestData(
                            serviceToken: token,
                            packageName: Bundle.main.bundleIdentifier ?? "",
                            account: account)),
                        encoder: JSONParameterEncoder.default,
                        headers: ["Content-Type": "application/json", "Accept": "application/json"])
        .validate()
        .responseDecodable(of: ResponseProfile.self){response in
            print(response)
            
            switch (response.result) {
            case .success(let result):
                print("Response data: \(result.data)")
                callBack()
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
}
