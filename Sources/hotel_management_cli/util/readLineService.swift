internal final class ReadLineService {
    static func readMultiLine() -> [String] {
        var inputs = [String]()
        while let line = readLine(strippingNewline: true) {
            if (line.isEmpty) {
                break
            }
            inputs.append(line)
        }
        return inputs
    }
    
    static func readUnitLine() -> [String] {
        let strings = readLine()?.split(separator: " ").map{String($0)} ?? []
        return strings
    }
}
