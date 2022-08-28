//
//  URL+Extensions.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import Foundation

extension URL {
    
    static var base: String {
        return "https://api.github.com/users"
    }
    
    static func listAllUsers(since: Int, perPage: Int) -> URL? {
        return URL(string: base + "?since=\(since)&per_page=\(perPage)")
    }
    
    static func getAUser(userName: String) -> URL? {
        return URL(string: base + "/\(userName)")
    }
    
}
