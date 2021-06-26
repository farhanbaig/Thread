
import XCTest
@testable import Thread

class OutfitViewModelTests: XCTestCase {

    func testOutfitViewModel() {
        let outfit = Outfit(when: "2021-06-26", description: "test description", inspired_by_photo_url: "https://mockedImage.jpeg")
        let outfitViewModel = OutfitViewModel(outfit: outfit)
        XCTAssertEqual(outfit.description, outfitViewModel.description)
        XCTAssertEqual(outfit.when, outfitViewModel.when)
        XCTAssertEqual(outfit.inspired_by_photo_url, outfitViewModel.photoURL)
    }
}
