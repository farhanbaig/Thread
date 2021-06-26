
import XCTest
@testable import Thread

class OutfitsListViewModelTests: XCTestCase {
    var sut: OutfitsListViewModel?
    var service : MockedService?
    
    
    func testFetchOutfitsListSuccess() {
        service?.returnData = true
        sut?.service = service
        sut?.fetchOutfitsList()
        XCTAssertNotNil(sut?.outfits)
    }
    
    func testFetchOutfitsListFailure() {
        service?.returnData = false
        sut?.service = service
        sut?.fetchOutfitsList()
        XCTAssertNil(sut?.outfits)
    }
    
    override func setUp() {
        sut = OutfitsListViewModel()
        service = MockedService()
    }
    
    override func tearDown() {
        sut = nil
        service = nil
    }
}


class MockedService: ServiceProtocol {
    var returnData = false
    func fetchOutfitsList(completion: @escaping (Result<OutfitsResponse, Error>) -> Void) {
        if returnData {
            completion(.success(OutfitsResponse(user_id: 1, outfits: [Outfit(when: "2021-06-26", description: "test description", inspired_by_photo_url: "https://mockedImage.jpeg")])))
        }
        else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
        }
    }
}
