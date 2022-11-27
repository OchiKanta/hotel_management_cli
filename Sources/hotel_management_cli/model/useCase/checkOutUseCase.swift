import Foundation

final class CheckOutUseCase {
    static func loadQuery(query: String) -> CheckOut? {
        guard query.contains("check-out") else { fatalError() }
        let queryElements = query.split(separator: " ").map { String($0) }
        
        let date = DateFormatService.shared.stringToDate(timeString: queryElements[0] + " " + queryElements[1])
        guard let _date = date else { return nil }
        
        return CheckOut(
            checkOutDate: _date,
            customerId: queryElements[3],
            roomNumber: Int(queryElements[4])!
        )
    }
}
