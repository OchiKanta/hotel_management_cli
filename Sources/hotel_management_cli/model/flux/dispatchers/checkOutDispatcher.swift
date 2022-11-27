import RxSwift

internal final class CheckOutDispatcher {
    internal static let shared = CheckOutDispatcher()
    internal let addCheckOut = PublishSubject<CheckOut>()
}
