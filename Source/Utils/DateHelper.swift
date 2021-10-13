//
//  DateHelper.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 20/9/2021.
//

import Foundation

extension Date {
    
    public var weekday: Int {
        return Calendar.current.component(.weekday, from: Date()) - 1
    }
    
    public var hour : Int{
        var calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        
        if let timeZone = TimeZone(identifier: "UTC") {
            calendar.timeZone = timeZone
        }
        return calendar.component(.hour, from: self)
    }
    
    public var minute : Int{
        var calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        
        if let timeZone = TimeZone(identifier: "UTC") {
            calendar.timeZone = timeZone
        }
        return calendar.component(.minute, from: self)
    }
    
    public var day : Int{
        var calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        calendar.locale = Locale.init(identifier: "Ar")
       // if let timeZone = TimeZone(identifier: "UTC") {
         //   calendar.timeZone = timeZone
       // }
        return calendar.component(.day, from: self)
    }
    
    
    public var today : Date {
        var calendar = Calendar.current // or e.g.
        if let timeZone = TimeZone(identifier: "UTC") {
            calendar.timeZone = timeZone
        }
        return calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    
    public func toString(format: String = "yyyy-MM-dd", locale : Locale = Locale.current, isConvertZone : Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .short
        formatter.dateFormat = format
        if(isConvertZone){
            formatter.timeZone = .current
        }
        
        return formatter.string(from: self)
    }
    
    public func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    
    public func isEqual(to date: Date, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, inSameDayAs: date)
    }
    
    public func isDateInYesterday() -> Bool{
        let calendar = Calendar.current
        if calendar.isDateInYesterday(self) { return true }
        return false
    }
    
    public func isDateInToday() -> Bool{
        let calendar = Calendar.current
        if calendar.isDateInToday(self) { return true }
        
        return false
    }
    
    public func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    
    public func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    
    public func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }
    
    public func isInSameDay(as date: Date) -> Bool { isEqual(to: date, toGranularity: .day) }
    
    public func timeIn24HourFormat(isConvertZone : Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        if(isConvertZone){
            formatter.timeZone = .current
        }
        return formatter.string(from: self)
    }
    
    public func addDays(days: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .day, value: days, to: self)
        return endDate ?? Date()
    }
    
    public func addHours(hours: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .hour, value: hours, to: self)
        return endDate ?? Date()
    }
    
    public func addMinutes(minutes: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .minute, value: minutes, to: self)
        return endDate ?? Date()
    }
    
    public func monthName(format : String, locale : Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
    
    public func getMinutesDiff(dateStart : Date) -> Double {
        let timeInterval = self.timeIntervalSince(dateStart)
        return timeInterval / 60
    }
    
    public func isBetween(_ date1: Date, and date2: Date) -> Bool {
        print("isBetween self", self)
        print("isBetween date1", date1)
        print("isBetween date2", date2)
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
    
    public func changeTo(hour: Int, minute: Int) -> Date {
        var calendar = Calendar.current // or e.g.
        if let timeZone = TimeZone(identifier: "UTC") {
            calendar.timeZone = timeZone
        }
        return calendar.date(bySettingHour: hour, minute: minute, second: 0, of: self)!
    }
    public func day(locale : Locale = Locale.current) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }
   
}
