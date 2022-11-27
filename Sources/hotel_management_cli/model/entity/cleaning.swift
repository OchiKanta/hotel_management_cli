import Foundation
internal final class Cleaning {
    let roomNumber: Int
    let cleanerId: String
    let startDate: Date
    let endDate: Date
    
    init?(roomNumber: Int, cleanerId: String, startDate: Date) {
        let endDate = Calendar.current.date(byAdding: .minute, value: 30, to: startDate)
        guard let _endDate = endDate else { return nil }
        self.roomNumber = roomNumber
        self.cleanerId = cleanerId
        self.startDate = startDate
        self.endDate = _endDate
    }
}
