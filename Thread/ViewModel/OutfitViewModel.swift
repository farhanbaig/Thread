
class OutfitViewModel {
    let when: String
    let description: String
    let photoURL: String
    
    init(outfit: Outfit) {
        when = outfit.when
        description = outfit.description
        photoURL = outfit.inspired_by_photo_url
    }
}
