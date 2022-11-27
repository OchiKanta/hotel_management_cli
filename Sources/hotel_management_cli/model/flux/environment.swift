import Foundation

final class Environment {
    static let shared = Environment()

    let flux: Flux

    init(flux: Flux = .shared) {
        self.flux = flux
    }
}

extension Environment {

    final class Flux {

        static let shared = Flux()

        let checkInActions: CheckInActions
        let checkInDispatcher: CheckInDispatcher
        let checkInStore: CheckInStore

        let checkOutActions: CheckOutActions
        let checkOutDispatcher: CheckOutDispatcher
        let checkOutStore: CheckOutStore

        let cleanerActions: CleanerActions
        let cleanerDispatcher: CleanerDispatcher
        let cleanerStore: CleanerStore

        let cleaningActions: CleaningActions
        let cleaningDispatcher: CleaningDispatcher
        let cleaningStore: CleaningStore

        let roomActions: RoomActions
        let roomDispatcher: RoomDispatcher
        let roomStore: RoomStore


        init(
            checkInActions: CheckInActions = .shared,
            checkInDispatcher: CheckInDispatcher = .shared,
            checkInStore: CheckInStore = .shared,

            checkOutActions: CheckOutActions = .shared,
            checkOutDispatcher: CheckOutDispatcher = .shared,
            checkOutStore: CheckOutStore = .shared,

            cleanerActions: CleanerActions = .shared,
            cleanerDispatcher: CleanerDispatcher = .shared,
            cleanerStore: CleanerStore = .shared,
            
            cleaningActions: CleaningActions = .shared,
            cleaningDispatcher: CleaningDispatcher = .shared,
            cleaningStore: CleaningStore = .shared,
            
            roomActions: RoomActions = .shared,
            roomDispatcher: RoomDispatcher = .shared,
            roomStore: RoomStore = .shared
        ) {
            self.checkInActions = checkInActions
            self.checkInDispatcher = checkInDispatcher
            self.checkInStore = checkInStore

            self.checkOutActions = checkOutActions
            self.checkOutDispatcher = checkOutDispatcher
            self.checkOutStore = checkOutStore

            self.cleanerActions = cleanerActions
            self.cleanerDispatcher = cleanerDispatcher
            self.cleanerStore = cleanerStore

            self.cleaningActions = cleaningActions
            self.cleaningDispatcher = cleaningDispatcher
            self.cleaningStore = cleaningStore

            self.roomActions = roomActions
            self.roomDispatcher = roomDispatcher
            self.roomStore = roomStore
        }
    }
}
