import RxSwift

internal final class CleaningDispatcher {
    internal static let shared = CleaningDispatcher()
    internal let addCleaning = PublishSubject<Cleaning>()
    internal let deleteCleaning = PublishSubject<Int>()
}
