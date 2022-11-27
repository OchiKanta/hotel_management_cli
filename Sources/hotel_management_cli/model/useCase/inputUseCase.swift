import Foundation

 internal final class InputUseCase {
    internal static func load() -> [String] {
        // read input
        let inputs = ReadLineService.readMultiLine();
        let firstRowInput = inputs[0].split(separator: " ").map{Int(String($0))!}
        let roomCount = firstRowInput[0]
        let cleanerCount = firstRowInput[1]
        let rooms = createRooms(inputs: inputs, roomCount: roomCount)
        RoomActions.shared.addRooms(rooms: rooms)
        let cleaners = createCleaners(inputs: inputs, cleanerCount: cleanerCount)
        CleanerActions.shared.addCleaners(cleaners: cleaners)
        let customerActions = readCustomerActions(inputs: inputs, roomCount: roomCount)
        return customerActions
    }
    
     private static func createRooms(inputs: [String], roomCount: Int) -> [Room] {
        var rooms = [Room]()
        for i in 1...roomCount {
            let roomInput = inputs[i].split(separator: " ").map{String($0)}
            rooms.append(
                Room(
                    roomNumber: Int(roomInput[0])!,
                    type: roomInput[1] == "LOW" ? RoomType.low : RoomType.high,
                    maxHousingCount: Int(roomInput[2])!,
                    price: Int(roomInput[3])!
                )
            )
        }
        return rooms
    }
     
     private static func createCleaners(inputs: [String], cleanerCount: Int) -> [Cleaner] {
         var cleaners = [Cleaner]()
         for _ in 0..<cleanerCount {
             cleaners.append(Cleaner(uid: UUID().uuidString))
         }
         return cleaners
     }
     
     private static func readCustomerActions(inputs: [String], roomCount: Int) -> [String] {
         var queries = [String]()
         for i in (roomCount + 1)..<inputs.count {
             queries.append(inputs[i])
         }
         return queries
     }
}
