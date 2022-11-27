import RxSwift

internal final class RoomActions {
    internal static let shared = RoomActions()
    private let dispatcher: RoomDispatcher
    
    private init(dispatcher: RoomDispatcher = .shared) {
        self.dispatcher = dispatcher

    }
    
    internal func addRooms(rooms: [Room]) {
        self.dispatcher.addRooms.onNext(rooms)
    }
    
    internal func setCheckIn(roomNumber: Int) {
        self.dispatcher.setStatus.onNext((roomNumber: roomNumber, status: RoomStatus.using))
    }
    
    internal func setCleaning(roomNumber: Int) {
        self.dispatcher.setStatus.onNext((roomNumber: roomNumber, status: RoomStatus.cleaning))
    }
    
    internal func setEmpty(roomNumber: Int) {
        self.dispatcher.setStatus.onNext((roomNumber: roomNumber, status: RoomStatus.empty))
    }
}
