import Foundation
import Alamofire

@available(macOS 10.15, iOS 13.0, *)
public class SecureMark: ObservableObject{
//    var server = ""
//    var token = ""
//    var account = ""
    
    public func initialize(server: String, token: String, account: String){
//        self.server = server
//        self.token = token
//        self.account = account
        Network.session = Session(serverTrustManager: makeTrustManager(server: server))

        Network.getProfiles(server: server, token: token, account: account){
            
        }
    }
    
    func makeTrustManager(server: String) -> ServerTrustManager{
        let ip = server.components(separatedBy: "//")[1].components(separatedBy: ":")[0]
        print(ip)
        return ServerTrustManager(evaluators: [ip: DisabledTrustEvaluator()])
    }
    
    public static let share = SecureMark()
    private init(){}
}
