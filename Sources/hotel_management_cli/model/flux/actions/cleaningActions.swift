import Foundation

internal final class CleaningActions {
    internal static let shared = CleaningActions()
    private let dispatcher: CleaningDispatcher
    
    private init(disptacher: CleaningDispatcher = .shared) {
        self.dispatcher = disptacher
    }
    
    internal func setCleaning(roomNumber: Int, cleanerId: String, date: Date) {
        let cleaning = Cleaning(
            roomNumber: roomNumber,
            cleanerId: cleanerId,
            startDate: date
        )
        guard let _cleaning = cleaning else { fatalError() }
        dispatcher.addCleaning.onNext(_cleaning)
    }
    
    internal func checkEnd(date: Date) {
        let cleanings = CleaningStore.shared.cleanings.filter{ $0.endDate <= date }
        endCleanings(cleanings: cleanings)
    }
    
    internal func endAllCleanings() {
        let cleanings = CleaningStore.shared.cleanings
        endCleanings(cleanings: cleanings)
    }
    
    private func endCleanings(cleanings: [Cleaning]) {
        cleanings.forEach { endCleaning in
            RoomActions.shared.setCleaning(roomNumber: endCleaning.roomNumber)
            CleanerActions.shared.setFree(uid: endCleaning.cleanerId)
            deleteCleaning(roomNumber: endCleaning.roomNumber)
            print("\(DateFormatService.shared.dateToString(timeDate: endCleaning.endDate)) \(endCleaning.roomNumber) has been cleaned.")
        }
    }
    
    private func deleteCleaning(roomNumber: Int) {
        dispatcher.deleteCleaning.onNext(roomNumber)
    }
}
