import Foundation
internal struct CheckIn {
    // チェックインした時間
    let checkInDate: Date
    // チェックアウトの上限時間
    let maxCheckOutDate: Date
    // 予約者カスタマーuid
    let customerId: String
    // 部屋番号
    let roomNumber: Int
    // 人数
    let count: Int
    // 宿泊日数
    let stayingDays: Int
    
    init?(checkInDate: Date, customerId: String, roomNumber: Int, count: Int, stayingDays: Int) {
        let maxCheckOutDate = Calendar.current.date(byAdding: .day, value: stayingDays - 1, to: checkInDate)
        guard let _maxCheckOutDate = maxCheckOutDate else { return nil }
        self.checkInDate = checkInDate
        self.maxCheckOutDate = _maxCheckOutDate
        self.customerId = customerId
        self.roomNumber = roomNumber
        self.count = count
        self.stayingDays = stayingDays
    }
}

