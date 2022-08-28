//
//  UserListModel.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import Foundation

struct UserModel: Codable {
    let login: String
    let avatar_url: String
    let site_admin: Bool
}

extension UserModel {
    
    static func all(since: Int, perPage: Int) -> Resource<[UserModel]> {
        guard let url = URL.listAllUsers(since: since, perPage: perPage) else {
            fatalError("URL is not defined!")
        }
        
        return Resource<[UserModel]>(url: url)
    }
    
}
