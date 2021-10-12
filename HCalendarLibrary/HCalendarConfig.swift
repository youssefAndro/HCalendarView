//
//  HCalendarConfig.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 8/10/2021.
//

import Foundation

public struct HCalendarConfig {
    public var weekdaySymbolFormat = WeekdaySymbolsEnum.short
    public var firstWeekday = 1
    public var locale = Locale.current
    public var monthFormat = "MMMM yyyy"
    public var showPastWeek = false
    public var showToday = true
    
    public init() {
        
    }
    
    public init(firstWeekday: Int) {
        self.firstWeekday = firstWeekday
    }
    
    public init(locale: Locale) {
        self.locale = locale
    }
    
    public init(showToday: Bool) {
        self.showToday = showToday
    }
    
    public init(firstWeekday: Int, locale: Locale ) {
        self.firstWeekday = firstWeekday
        self.locale = locale
    }
    
    public init(firstWeekday: Int, locale: Locale, showToday: Bool) {
        self.firstWeekday = firstWeekday
        self.locale = locale
        self.showToday = showToday
    }
}

public enum WeekdaySymbolsEnum{
    case normal // -> ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    case short // -> ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    case veryShort  // -> ["S", "M", "T", "W", "T", "F", "S"]
}
