//
//  ProfileService.swift
//  github-profile-example
//
//  Created by Rodrigo Bueno Tomiosso on 10/06/22.
//

import Foundation

class ProfileProvider {
    
    private var providerSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        providerSession = session
    }
    
    func getProfile(username: String, completion: @escaping ((Swift.Result<Profile, Error>) -> Void)) {

        guard let url = URL(string: "https://api.github.com/users/"+username) else {
            let error = NSError(domain: "invalid url - "+String(describing: self), code: 500, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        let task = providerSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "no response data - "+String(describing: self), code: 204, userInfo: nil)
                completion(.failure(error))
                return
            }

            do {
                let profile = try JSONDecoder().decode(Profile.self, from: data)
                completion(.success(profile))
            } catch {
                completion(.failure(error))
            }

        }
        
        task.resume()

        
    }
    
}
