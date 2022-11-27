internal final class CleanerActions {
    internal static let shared = CleanerActions()
    private let dispatcher: CleanerDispatcher
    
    private init(dispatcher: CleanerDispatcher = .shared) {
        self.dispatcher = dispatcher
    }
    
    internal func addCleaners(cleaners: [Cleaner]) {
        self.dispatcher.addCleaners.onNext(cleaners)
    }
    
    internal func setBusy(uid: String) {
        self.dispatcher.setStatus.onNext((uid: uid, status: .busy))
    }
    
    internal func setFree(uid: String) {
        self.dispatcher.setStatus.onNext((uid: uid, status: .free))
    }
}
