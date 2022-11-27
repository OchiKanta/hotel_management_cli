import RxSwift

internal final class CleaningStore {
    internal static let shared = CleaningStore()
    internal var cleanings = [Cleaning]()
    private let disposeBag = DisposeBag()
    
    private init(dispatcher: CleaningDispatcher = .shared) {
        dispatcher.addCleaning.subscribe(onNext: { [weak self] cleaning in
            self?.cleanings.append(cleaning)
        }).disposed(by: disposeBag)
        
        dispatcher.deleteCleaning.subscribe(onNext: { [weak self] roomNumber in
            if let index = self?.cleanings.firstIndex(where: { $0.roomNumber == roomNumber }) {
                self?.cleanings.remove(at: index)
            }
        }).disposed(by: disposeBag)
    }
}
