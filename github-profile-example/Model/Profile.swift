//
//  Profile.swift
//  github-profile-example
//
//  Created by Rodrigo Bueno Tomiosso on 10/06/22.
//

import Foundation

struct Profile: Codable {
    let login: String
    let id: Int
    let avatarUrl: String
    let url: URL
    let htmlUrl: String
    let type: String
    let name: String
    let company: String
    let blog: String
    let location: String
    let email: String?
    let hireable: Bool
    let bio: String?
    let twitter_username: String?
    let public_repos: Int
    let public_gists:Int
    let followers: Int
    let following: Int
    let created_at: String
    let updated_at: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case url
        case htmlUrl = "html_url"
        case type
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case twitter_username
        case public_repos
        case public_gists
        case followers
        case following
        case created_at
        case updated_at
    }

}
