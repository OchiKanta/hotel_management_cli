import RxSwift

internal final class RoomStore {
    
    internal static let shared = RoomStore()
    internal var rooms = [Room]()
    private let disposeBag = DisposeBag()
    
    private init(dispacther: RoomDispatcher = .shared) {
        dispacther.addRooms.subscribe(onNext: { [weak self] rooms in
            rooms.forEach { room in
                self?.rooms.append(room)
            }
        }).disposed(by: disposeBag)
        
        dispacther.setStatus.subscribe(onNext: { [weak self] tuple in
            let roomNumber = tuple.roomNumber
            let status = tuple.status
            if let index = self?.rooms.firstIndex(where: { $0.roomNumber == roomNumber }), let newRoom = self?.rooms[index] {
                newRoom.status = status
                self?.rooms[index] = newRoom
            }
        }).disposed(by: disposeBag)
    }
    
}
