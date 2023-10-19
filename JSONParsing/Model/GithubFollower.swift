//
//  GithubFlower.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/19/23.
//

import Foundation

// This model uses for JSON API parsing
struct GithubFollower: Decodable {
    let login: String
    let id: Int
}

extension GithubFollower {
    /*let getJSONFromAPI("https://api.github.com/users/TwoStraws/followers") { (followers:[GithubFlower]?) in
        if let followers = followers {
            let tmpFollower = ""
            for follower in followers {
                tmpFollower += follower.login
            }
        }
    }*/
}

//"https://api.github.com/users/TwoStraws/followers"
extension GithubFollower {
    func getJSONFromAPI<T: Decodable>(urlString: String, completion: @escaping ([T]?) -> Void) {
        guard let sourceURL = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: sourceURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            guard let decodeData = try? decoder.decode([T].self, from: data) else {
                completion(nil)
                return
            }
            completion(decodeData)
        }
    }
}
