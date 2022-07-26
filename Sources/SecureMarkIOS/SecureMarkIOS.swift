import Foundation

@available(macOS 10.15, iOS 13.0, *)
public class SecureMark: ObservableObject{
//    var server = ""
//    var token = ""
//    var account = ""
    
    public func initialize(server: String, token: String, account: String){
//        self.server = server
//        self.token = token
//        self.account = account
        Network(server: server, token: token, account: account).getProfiles{
            
        }
    }
    
    public let share = SecureMark()
    private init(){}
}
