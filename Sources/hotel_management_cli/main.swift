import RxSwift
import Darwin

_ = Environment.shared

var queries = InputUseCase.load()

for query in queries {
    if query.contains("check-in") {
        let checkIn = CheckInUseCase.loadQuery(query: query)
        guard let _checkIn = checkIn else { continue }
        CleaningActions.shared.checkEnd(date: _checkIn.checkInDate)
        CheckInActions.shared.checkIn(checkIn: _checkIn)
    } else if query.contains("check-out") {
        let checkOut = CheckOutUseCase.loadQuery(query: query)
        guard let _checkOut = checkOut else { continue }
        CleaningActions.shared.checkEnd(date: _checkOut.checkOutDate)
        CheckOutActions.shared.checkOut(checkOut: _checkOut)
    }
}
CleaningActions.shared.endAllCleanings()
