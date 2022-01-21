//
//  DatesFormat.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 19/01/22.
//

import Foundation

enum DateFormatType: String {
    case dashModeYearOnFirst = "yyyy-MM-dd"
    case dashModeYearOnBack = "dd-MM-yyyy"
    case slashYearOnBack = "dd/MM/yyyy"
}

extension DateFormatter {
    convenience init(format: String) {
            self.init()
        self.dateFormat = format
    }
}

extension Date {
    func toString(_ format: DateFormatType) -> String {
        return DateFormatter(format: format.rawValue).string(from: self)
    }
}

extension String {
    func toDate(_ format: DateFormatType) -> Date? {
        return DateFormatter(format: format.rawValue).date(from: self)
    }
}

struct DateFormat {
    
    static func convertStringDate(_ value: String,
                                  _ format: DateFormatType = .dashModeYearOnFirst,
                                  _ toFormat: DateFormatType = .slashYearOnBack) -> String {
        if let date = value.toDate(format) {
            return date.toString(toFormat)
        } else {
            return value;
        }
        
    }
    
}


    
//    func formatter() -> Foundation.DateFormatter {
//        switch self {
//        case .yearOnBack:
//            return convertFormatter(string: "dd MMM yyyy")
//        case .slashMode:
//            return convertFormatter(string: "dd/MM/yyyy")
//        case .response:
//            return convertFormatter(string: "yyyy-MM-dd'T'HH:mm:ss.000000Z")
//        case .timepast:
//            return convertFormatter(string: "YYYY-MM-dd HH:mm:ss")
//        case .completeDate:
//            return convertFormatter(string: "MMMM, dd MMM yyyy hh:mm a")
//        case .dashMode:
//            return convertFormatter(string: "yyyy-MM-dd")
//        case .dateWithDay:
//            return convertFormatter(string: "EEE, dd MMM yyyy h:mm a")
//        case .dateDayWithTime:
//            return convertFormatter(string: "dd-MMM-yyyy hh:mm a")
//        case .dateParams:
//            return convertFormatter(string: "yyyy-mm-dd'T'hh:mm")
//        case .time:
//            return convertFormatter(string: "hh:mm")
//        case .androidDate:
//            return convertFormatter(string: "E, MMM dd")
//        case .datetimedayfirst:
//            return convertFormatter(string: "E, d MMM yyyy hh:mm a")
//        case .dateDayNoTime:
//            return convertFormatter(string: "EEE, dd MMM yyyy")
//        case .dateWithtimeline:
//            return convertFormatter(string: "dd MMM YYY | HH:mm")
//        case .dashYearOnEnd:
//            return convertFormatter(string: "dd-MM-yyyy")
//        }
//    }
//    
//    private func convertFormatter(string: String) -> Foundation.DateFormatter {
//        let localFormatter = Foundation.DateFormatter.dataFormatter(string)
//        localFormatter.locale = Locale.current
//        return localFormatter
//    }
//    
//    func stringFromDate(_ date: Date) -> String {
//        return self.formatter().string(from: date)
//    }
//    
//    func dateFromString(_ string: String) -> Date? {
//        return self.formatter().date(from: string)
//    }
    
    
//}

//class DateFormatter {
//
//    static func formatDate(_ date: String, ) -> String {
//        let formatter = DatesFormat.timepast.dateFromString(date) ?? Date()
//        return DatesFormat.dashMode.stringFromDate(formatter)
//    }
//
//}
//
//
//extension DateComponentsFormatter {
//    func difference(from fromDate: Date, to toDate: Date) -> String? {
//        self.allowedUnits = [.month]
//        self.maximumUnitCount = 1
//        self.unitsStyle = .full
//        return self.string(from: fromDate, to: toDate)
//    }
//}
//
//
//extension Foundation.DateFormatter {
//    @nonobjc static var standardDateFormatter: Foundation.DateFormatter = {
//        let dateFormatter = Foundation.DateFormatter()
//        return dateFormatter
//    }()
//
//    static func dataFormatter(_ format: String) -> Foundation.DateFormatter {
//        let dateFormatter = standardDateFormatter
//        dateFormatter.dateFormat = format
//        return dateFormatter
//    }
//}

