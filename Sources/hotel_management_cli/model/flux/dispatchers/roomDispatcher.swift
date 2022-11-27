import RxSwift

internal final class RoomDispatcher {
    internal static let shared = RoomDispatcher()
    internal let addRooms = PublishSubject<[Room]>()
    internal let setStatus = PublishSubject<(roomNumber: Int, status: RoomStatus)>()
}
