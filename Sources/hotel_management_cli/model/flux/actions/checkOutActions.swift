import Foundation

internal final class CheckOutActions {
    internal static let shared = CheckOutActions()
    private let dispatcher: CheckOutDispatcher
    
    private init(dispatcher: CheckOutDispatcher = .shared) {
        self.dispatcher = dispatcher
    }
    
    internal func checkOut(checkOut: CheckOut) {
        do {
            try validateCheckOut(checkOut: checkOut)
        } catch let error {
            print((error as NSError).domain)
        }
        
        CheckInActions.shared.deleteCheckIn(customerId: checkOut.customerId)
        let stayingDays = CheckInStore.shared.checkIns.filter{$0.customerId == checkOut.customerId}.first?.stayingDays ?? 0
        let roomPrice = RoomStore.shared.rooms.filter{$0.roomNumber == checkOut.roomNumber}.first?.price ?? 0
        let checkOutDateString = DateFormatService.shared.dateToString(timeDate: checkOut.checkOutDate)
        dispatcher.addCheckOut.onNext(checkOut)
        print("\(checkOutDateString) \(checkOut.customerId) has to pay \(roomPrice * stayingDays) to leave \(checkOut.roomNumber).")
        
        RoomActions.shared.setCleaning(roomNumber: checkOut.roomNumber)
        let freeCleaner = CleanerStore.shared.cleaners.filter{ $0.status == .free}.first
        guard let _freeCleaner = freeCleaner else { fatalError() }
        CleanerActions.shared.setBusy(uid: _freeCleaner.uid)
        CleaningActions.shared.setCleaning(roomNumber: checkOut.roomNumber, cleanerId: _freeCleaner.uid, date: checkOut.checkOutDate)
        print("\(checkOutDateString) A cleaner is assigned to \(checkOut.roomNumber).")
    }
    
    private func validateCheckOut(checkOut: CheckOut) throws {
        let dateString = DateFormatService.shared.dateToString(timeDate: checkOut.checkOutDate)
        
        if let room  = RoomStore.shared.rooms.first(where: { $0.roomNumber == checkOut.roomNumber }) {
            let notFoundCustomerId = (CheckInStore.shared.checkIns.filter { checkIn in
                checkIn.customerId == checkOut.customerId
            }).isEmpty
            let isNotUsingRoom = room.status != RoomStatus.using
            if notFoundCustomerId {
                throw NSError(domain: "\(dateString) ERROR: \(checkOut.customerId) is not exist.", code: -1)
            } else if isNotUsingRoom {
                throw NSError(domain: "\(dateString) ERROR: \(checkOut.customerId) is not in \(checkOut.roomNumber).", code: -1)
            }
        } else {
            throw NSError(domain: "\(dateString) ERROR: \(checkOut.roomNumber) dose not exist.", code: -1)
        }
    }
}
