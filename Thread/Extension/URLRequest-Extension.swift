
import Foundation

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func performRequest<T>(resource: Resource<T>,completion: @escaping(Result<T,Error>) -> Void) {
        let request = URLRequest(url: resource.url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data = data else {
                    completion(.failure(NSError(domain: "_", code: 0, userInfo: nil)))
                    return}
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
