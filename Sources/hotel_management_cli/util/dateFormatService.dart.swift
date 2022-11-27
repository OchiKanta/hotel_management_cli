import Foundation

internal final class DateFormatService {
    internal static let shared = DateFormatService()
    private let identifier = "en_US_POSIX"
    private let format = "d HH:mm"
    private let dateFormatter: DateFormatter
    
    private init() {
        let _dateFormatter = DateFormatter()
        _dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        _dateFormatter.dateFormat = "d HH:mm"
        self.dateFormatter = _dateFormatter
    }
    
    internal func stringToDate(timeString: String) -> Date? {
        let timeDate = dateFormatter.date(from: timeString)
        return timeDate
    }
    
    internal func dateToString(timeDate: Date) -> String {
        let timeString = dateFormatter.string(from: timeDate)
        return timeString
    }
}
