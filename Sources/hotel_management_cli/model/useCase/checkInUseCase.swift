import Foundation

 final class CheckInUseCase {
     static func loadQuery(query: String) -> CheckIn? {
         guard query.contains("check-in") else { return nil }
         let queryElements = query.split(separator: " ").map { String($0) }
         
         let date = DateFormatService.shared.stringToDate(timeString: queryElements[0] + " " + queryElements[1])
         guard let _date = date else { return nil }
         
         return CheckIn(
            checkInDate: _date,
            customerId: queryElements[3],
            roomNumber: Int(queryElements[4])!,
            count: Int(queryElements[5])!,
            stayingDays: Int(queryElements[6])!
         )
    }
}
