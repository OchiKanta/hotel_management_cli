import RxSwift

internal final class CheckOutStore {
    internal static let shared = CheckOutStore()
    private let disposeBag = DisposeBag()
    internal var checkOuts = [CheckOut]()
    
    private init(dispatcher: CheckOutDispatcher = .shared) {
        dispatcher.addCheckOut.subscribe(onNext: { [weak self] checkOut in
            self?.checkOuts.append(checkOut)
        }).disposed(by: disposeBag)
    }
}
