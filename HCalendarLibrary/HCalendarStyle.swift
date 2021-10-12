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
    public var day = HCalendarDayStyle()
    public var nav = HCalendarNavStyle()
    public var weekSymbol = HCalendarWeekStyle()
}

public struct HCalendarDayStyle {
    public var current = Color.orange
    public var future = Color.white
    public var past = Color.gray
    
    public var selectedBg = Color.orange
    public var selectedFg = Color.black
    public var selectedRadius : CGFloat = .infinity
    
    public var unSelectedBg = Color.black.opacity(0)
}

public struct HCalendarWeekStyle {
    public var foreground = Color.white
    public var fontSize : CGFloat = 16
}

public struct HCalendarNavStyle {
    public var navLeftIcon = Image(systemName: "chevron.left")
    public var navRightIcon = Image(systemName: "chevron.right")
    public var navImageW : CGFloat = 30
    public var navImageH : CGFloat = 30
    public var navRadius : CGFloat = 10
    public var foreground = Color.white
    public var showToday = true
    
    public var strokeToday = Color.orange
    public var strokeNav = Color.white
}
