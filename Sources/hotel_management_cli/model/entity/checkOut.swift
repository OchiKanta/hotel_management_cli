import Foundation
internal struct CheckOut {
    let checkOutDate: Date
    let customerId: String
    let roomNumber: Int

    init(checkOutDate: Date, customerId: String, roomNumber: Int) {
        self.checkOutDate = checkOutDate
        self.customerId = customerId
        self.roomNumber = roomNumber
    }
}
