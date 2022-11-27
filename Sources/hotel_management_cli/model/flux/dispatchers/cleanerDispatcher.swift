import RxSwift

internal final class CleanerDispatcher {
    internal static let shared = CleanerDispatcher()
    internal let addCleaners = PublishSubject<[Cleaner]>()
    internal let setStatus = PublishSubject<(uid: String, status: CleanerStatus)>()
}
