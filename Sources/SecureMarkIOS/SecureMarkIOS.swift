import Foundation

@available(macOS 10.15, iOS 13.0, *)
public class SecureMark: ObservableObject{
    static var server = ""
    static var token = ""
    static var account = ""
    
    public static func initialize(server: String, token: String, account: String){
        self.server = server
        self.token = token
        self.account = account
        Network().getProfiles{
            
        }
    }
    
    public let share = SecureMark()
    private init(){}
}
