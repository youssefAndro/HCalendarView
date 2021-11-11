//
//  HCalendarStyle.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 27/9/2021.
//

import Foundation
import SwiftUI

public struct HCalendarStyle {
    public var background = Color.black
    public var border = Color.white
    public var month = HCalendarMonthStyle()
    public var day = HCalendarDayStyle()
    public var nav = HCalendarNavStyle()
    public var weekSymbol = HCalendarWeekStyle()
    
    public init() {
        
    }
}

public struct HCalendarDayStyle {
    public var current = Color.orange
    public var future = Color.white
    public var past = Color.gray
    
    public var selectedBg = Color.orange
    public var selectedFg = Color.black
    public var selectedRadius : CGFloat = .infinity
    
    public var unSelectedBg = Color.black.opacity(0)
    
    public var font = "SF"
    public var fontSize : CGFloat = 16
    
    public init() {
        
    }
}

public struct HCalendarWeekStyle {
    public var foreground = Color.white
    public var font = "SF"
    public var fontSize : CGFloat = 16
    
    public init() {
        
    }
}

public struct HCalendarMonthStyle {
    public var foreground = Color.black
    public var font = "SF"
    public var fontSize : CGFloat = 16
    
    public init() {
        
    }
}

public struct HCalendarNavStyle {
    public var navLeftIcon = Image(systemName: "chevron.left")
    public var navRightIcon = Image(systemName: "chevron.right")
    public var navImageW : CGFloat = 30
    public var navImageH : CGFloat = 30
    public var navIconW : CGFloat = 5
    public var navIconH : CGFloat = 8
    public var navRadius : CGFloat = 10
    public var navStrokeColor = Color.white
    public var navStrokeWidth : CGFloat = 1
    public var navBg = Color.black
    public var navFg = Color.white
    
    public var showToday = true
    public var todayStrokeColor = Color.orange
    public var todayStrokeWidth : CGFloat = 1
    public var todayBg = Color.black
    public var todayFg = Color.white
    public var todayfont = "SF"
    public var todaySize : CGFloat = 16
    
    public init() {
        
    }
}
