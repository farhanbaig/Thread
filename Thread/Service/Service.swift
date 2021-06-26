
import Foundation

protocol ServiceProtocol: AnyObject {
    func fetchOutfitsList(completion: @escaping (Result<OutfitsResponse,Error>) -> Void)
}

class Service: ServiceProtocol {
    func fetchOutfitsList(completion: @escaping (Result<OutfitsResponse,Error>) -> Void) {
        guard let url = URL.outfitsListURL() else {return}
        let resource = Resource<OutfitsResponse>(url: url)
        URLRequest.performRequest(resource: resource) { result in
            completion(result)
        }
    }
}
