import RxSwift

internal final class CheckInDispatcher {
    internal static let shared = CheckInDispatcher()
    
    internal let addCheckIn = PublishSubject<CheckIn>()
    internal let deleteCheckIn = PublishSubject<String>()
}
