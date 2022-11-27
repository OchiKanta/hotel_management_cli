internal enum RoomType {
    case low
    case high
}

internal enum RoomStatus {
    case empty
    case using
    case cleaning
}

internal final class Room {
    // 部屋番号
    let roomNumber: Int
    // 種類
    let type: RoomType
    // 収容人数
    let maxHousingCount: Int
    // 1泊当たりの値段
    let price: Int
    // 状態
    var status = RoomStatus.empty
    
    init(roomNumber: Int, type: RoomType, maxHousingCount: Int, price: Int) {
        self.roomNumber = roomNumber
        self.type = type
        self.maxHousingCount = maxHousingCount
        self.price = price
    }
}
