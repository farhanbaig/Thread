
class OutfitsListViewModel {
    var delegate : OutfitListViewDelegate?
    var outfits: [OutfitViewModel]?
    var service: ServiceProtocol?
    
    init() {
        self.service = Service()
    }
}

extension OutfitsListViewModel {
    func fetchOutfitsList() {
        service?.fetchOutfitsList(completion: { result in
            switch result {
            case .success(let res):
                self.outfits = res.outfits.map {OutfitViewModel(outfit: $0)}
                self.delegate?.displayOutfits()
            case .failure(let error):
                self.delegate?.failure(message: error.localizedDescription)
            }
        })
    }
}
