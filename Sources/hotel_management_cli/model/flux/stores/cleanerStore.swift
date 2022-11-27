import RxSwift

internal final class CleanerStore {
    static let shared = CleanerStore()
    internal var cleaners = [Cleaner]()
    private let disposeBag = DisposeBag()
    
    private init(dispacther: CleanerDispatcher = .shared) {
        dispacther.addCleaners.subscribe(onNext: { [weak self] cleaners in
            cleaners.forEach { cleaner in
                self?.cleaners.append(cleaner)
            }
        }).disposed(by: disposeBag)
    }
}
