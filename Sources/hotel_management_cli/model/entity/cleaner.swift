internal enum CleanerStatus {
    case free
    case busy
}

internal final class Cleaner {
    let uid: String
    var status = CleanerStatus.free
    var cleaning: Cleaning?
    
    init(uid: String) {
        self.uid = uid
    }
}
