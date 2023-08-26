//
//  UserDefaultsManager.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 11/08/23.
//

import Foundation


class UserDefaultsManager{
    
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    
    func setPlayerID(id: Int){
        defaults.set(id, forKey: "playerId")
    }
    
    
    func setCheck(mode: Bool){
        defaults.set(mode, forKey: "mode")
    }
    
    func setCountReserve(count: Int){
        defaults.set(count, forKey: "reserveCount")
    }
    
    func save(items: [String]){
        UserDefaults.standard.set(items, forKey: "book_key")
    }
    
    func load() -> [String] {
        let array =  UserDefaults.standard.array(forKey: "book_key") as? [String] ?? [String]()
        return array
    }
    
    //MARK: GET
    
    func getReserveCount()->Int{
        defaults.integer(forKey: "reserveCount")
    }

  
    
    func getCheck()->Bool{
        defaults.bool(forKey: "mode")
    }
    
    
    func getUserID()->Int{
        defaults.integer(forKey: "playerId")
    }

}
