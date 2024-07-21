//
//  UserDefaultsWrapper.swift
//  Banking
//
//  Created by Всеволод Оплачко on 19.07.2024.
//

import Foundation

struct UserDefaultsWrapper {
    
    
    fileprivate static let UserDefaultsStandart = UserDefaults.standard
    
    static var isSeenOnboarding: Bool {
        get {
            return UserDefaultsStandart.bool(forKey: "kIsSeenOnboarding")
        }
        
        set {
            UserDefaultsStandart.set(newValue, forKey: "kIsSeenOnboarding")
            UserDefaultsStandart.synchronize()
        }
    }
    
    static var userAccount: UserAccount? {
        get {
            
            do {
                if let data = UserDefaultsStandart.data(forKey: "kUserAccount") {
                    if let dictionary = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String: Any] {
                        
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                        let decodedUser = try JSONDecoder().decode(UserAccount.self, from: data)
                        return decodedUser
                    }
                }
            } catch {
                print(String(describing: error))
            }
            return nil
        }
        set {
            guard let newValue = newValue else {
                UserDefaultsStandart.set(nil, forKey: "kUserAccount")
                return
            }
            do {
                let encodedResponse = (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(newValue))) as? [String: Any] ?? [:]
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: encodedResponse, requiringSecureCoding: false)
                UserDefaultsStandart.set(encodedData, forKey: "kUserAccount")
                
            } catch {
                print(String(describing: error))
            }
            UserDefaultsStandart.synchronize()
        }
    }
    
}
