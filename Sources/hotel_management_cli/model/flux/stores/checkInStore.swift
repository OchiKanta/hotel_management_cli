import RxSwift

internal final class CheckInStore {
    internal static let shared = CheckInStore()
    internal var checkIns = [CheckIn]()
    private let disposeBag = DisposeBag()
    
    private init(dispatcher: CheckInDispatcher = .shared) {
        dispatcher.addCheckIn.subscribe(onNext: { [weak self] checkIn in
            self?.checkIns.append(checkIn)
        }).disposed(by: disposeBag)
    }
    
    func deleteCheckIn(customerId: String) {
        if let index = self.checkIns.firstIndex(where: { $0.customerId == customerId }) {
            self.checkIns.remove(at: index)
        }
    }
}

