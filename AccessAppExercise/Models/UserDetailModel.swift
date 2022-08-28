//
//  UserDetailModel.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import Foundation

struct UserDetailModel: Codable {
    let login: String
    let avatar_url: String
    let name: String?
    let bio: String?
    let site_admin: Bool
    let location: String?
    let blog: String?
}

extension UserDetailModel {
    
    static func aUser(userName: String) -> Resource<UserDetailModel> {
        guard let url = URL.getAUser(userName: userName) else { fatalError("URL is not defined!") }
        
        return Resource<UserDetailModel>(url: url)
    }
    
}
