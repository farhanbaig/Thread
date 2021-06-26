
struct OutfitsResponse: Decodable {
    let user_id: Int
    let outfits: [Outfit]
}
