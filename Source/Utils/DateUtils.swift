//
//  DateUtils.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 24/9/2021.
//

import Foundation

public struct DateUtils {
    
    public static func getDaysOfWeek(index: Int, firstWeekday : Int = 1)-> [Date] {
        var cal = Calendar.autoupdatingCurrent
        cal.firstWeekday = firstWeekday
        cal.locale = Locale(identifier: "Fr")
        cal.timeZone = TimeZone(identifier: "UTC")!
        let currentDate = getTodayDateWithTZ().addDays(days: index*7)
        let days = cal.daysWithSameWeekOfYear(as: currentDate)
        return days
    }
    
    public static func getStartOfWeek(index: Int, firstWeekday : Int = 1)-> Date {
        var cal = Calendar.autoupdatingCurrent
        cal.firstWeekday = firstWeekday
        cal.timeZone = TimeZone(identifier: "UTC")!
        let currentDate = getTodayDateWithTZ().addDays(days: index*7)
        let days = cal.daysWithSameWeekOfYear(as: currentDate)
        return days.first ?? getTodayDateWithTZ()
    }
    
    public static func getNowDateWithTZ() -> Date {
        let currentDate = Date()
        let timezoneOffset = TimeZone.current.secondsFromGMT()
        let epochDate = currentDate.timeIntervalSince1970
        let timezoneEpochOffset = (epochDate + Double(timezoneOffset))
        return Date(timeIntervalSince1970: timezoneEpochOffset)
     }
    
    public static func getTodayDateWithTZ() -> Date {
        let currentDate = Date()
        let timezoneOffset = TimeZone.current.secondsFromGMT()
        let epochDate = currentDate.timeIntervalSince1970
        let timezoneEpochOffset = (epochDate + Double(timezoneOffset))
        //print(Date(timeIntervalSince1970: timezoneEpochOffset).today)
        return Date(timeIntervalSince1970: timezoneEpochOffset).today
     }
    
    public static func getTodayDateWithTZ(h: Int, m : Int) -> Date {
        var cal = Calendar.autoupdatingCurrent
        cal.firstWeekday = 2
        let date = cal.date(bySettingHour: h, minute: m, second: 0, of: Date())!
        let timezoneOffset =  TimeZone.current.secondsFromGMT()
        let epochDate = date.timeIntervalSince1970
        let timezoneEpochOffset = (epochDate + Double(timezoneOffset))
        return Date(timeIntervalSince1970: timezoneEpochOffset)
    }
    
    public static func doEventsOverlap(_ eventOne: EventModel, _ eventTwo: EventModel) -> Bool {
        let leftRange = eventOne.eStartTime! ... eventOne.eEndTime!
        let rightRange = eventTwo.eStartTime! ... eventTwo.eEndTime!
        return leftRange.overlaps(rightRange)
    }
    
    public static func weekDaySymbols(weekDayFormat: WeekdaySymbolsEnum = .short, firstWeekday : Int = 1, local : Locale = Locale.current)-> [String]{
        let fmt = DateFormatter()
        fmt.locale = local
        var symbols : [String] = fmt.weekdaySymbols
        switch weekDayFormat {
        case .short:
            symbols  = fmt.shortWeekdaySymbols
        case .veryShort:
            symbols = fmt.veryShortWeekdaySymbols
        default:
            symbols  = fmt.weekdaySymbols
        }
        symbols = Array(symbols[firstWeekday-1..<symbols.count]) + symbols[0..<firstWeekday-1]
        return symbols
    }
    
}
