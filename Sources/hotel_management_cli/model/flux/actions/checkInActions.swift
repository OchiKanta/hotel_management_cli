import Foundation

internal final class CheckInActions {
    internal static let shared = CheckInActions()
    private let dispatcher: CheckInDispatcher
    
    private init(dispatcher: CheckInDispatcher = .shared) {
        self.dispatcher = dispatcher
    }
    
    internal func checkIn(checkIn: CheckIn) {
        do {
             try validateCheckIn(checkIn: checkIn)
         } catch let error {
             print((error as NSError).domain)
             return
         }
        dispatcher.addCheckIn.onNext(checkIn)
        RoomActions.shared.setCheckIn(roomNumber: checkIn.roomNumber)
        print("\( DateFormatService.shared.dateToString(timeDate: checkIn.checkInDate)) \(checkIn.customerId) successfully checked in to \(checkIn.roomNumber).")
    }
    
    internal func deleteCheckIn(customerId: String) {
        dispatcher.deleteCheckIn.onNext(customerId)
    }
    
    private func validateCheckIn(checkIn: CheckIn) throws {
        let dateString = DateFormatService.shared.dateToString(timeDate: checkIn.checkInDate)
        if let room = RoomStore.shared.rooms.first(where: { $0.roomNumber == checkIn.roomNumber }) {
            let isOverHousing = room.maxHousingCount < checkIn.count;
            let isCleaning = room.status == RoomStatus.cleaning
            let isUseing = room.status == RoomStatus.using
            if isOverHousing {
                throw NSError(domain: "\(dateString) ERROR: \(checkIn.roomNumber) cannot accommodate \(checkIn.customerId).", code: -1)
            } else if isCleaning {
                throw NSError(domain: "\(dateString) ERROR: \(checkIn.roomNumber) is being cleaning.", code: -1)
            } else if isUseing {
                throw NSError(domain: "\(dateString) ERROR: \(checkIn.roomNumber) is occupied.", code: -1)
            }
        } else {
            throw NSError(domain: "\(dateString) ERROR: \(checkIn.roomNumber) dose not exist.", code: -1)
        }
    }
}
