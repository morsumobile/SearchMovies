
import UIKit
let apiKey = "599b51625822d01647dc7eab3595a389"
let baseURL = "https://api.themoviedb.org/3/"
let baseURLImage = "https://image.tmdb.org/t/p/w500/"

let searchMovie = "search/movie"
struct NetworkManager {
    static func fetchSearchList(_ searchString: String = "", completion: @escaping (MovieResponse?, Error?) -> Void) {
        let urlString = baseURL + searchMovie + "?api_key=\(apiKey)&language=en-US&query=\(searchString)"
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
            urlRequest.httpMethod = "GET"
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            let defaultSession = URLSession(configuration: .default)
            defaultSession.dataTask(with: urlRequest) { data, response, error in
                guard let responseData = data else {
                    completion(nil, error)
                    return
                }
                let jsonResponse = try? JSONDecoder().decode(MovieResponse.self, from: responseData)
                completion(jsonResponse, nil)
            }.resume()
        }
    }
}
