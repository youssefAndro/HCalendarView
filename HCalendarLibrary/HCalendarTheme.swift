//
//  HCalendarTheme.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 27/9/2021.
//

import Foundation
import SwiftUI

public struct HCalendarTheme {
    public static var blackRed : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color.black
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.red
        dayStyle.future = Color.white
        dayStyle.past = Color.gray
        dayStyle.selectedBg = Color.red
        dayStyle.selectedFg = Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.gray
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color.red
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var grayOr : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color(hex: "#4f7079")
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color(hex: "#FED6A3")
        dayStyle.future = Color.white
        dayStyle.past = Color.gray
        dayStyle.selectedBg = Color(hex: "#FED6A3")
        dayStyle.selectedFg =  Color(hex: "#4f7079")
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color(hex: "#FED6A3")
        weekStyle.fontSize = 20
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color(hex: "#FED6A3")
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var whiteBlack : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color.white
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.black
        dayStyle.future = Color.black
        dayStyle.past = Color.gray
        dayStyle.selectedBg = Color.black
        dayStyle.selectedFg = Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.gray
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.black
        navStyle.showToday = true
        navStyle.strokeToday = Color.black
        navStyle.strokeNav = Color.black
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var whitePink : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color.white
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color(hex: "#F4A8B1")
        dayStyle.future = Color.black
        dayStyle.past = Color.gray
        dayStyle.selectedBg =  Color(hex: "#F4A8B1")
        dayStyle.selectedFg =  Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color(hex: "#5B5B5B")
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color(hex: "#F4A8B1")
        navStyle.showToday = true
        navStyle.strokeToday = Color(hex: "#F4A8B1")
        navStyle.strokeNav = Color(hex: "#F4A8B1")
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var greenWhite : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color(hex: "#44AF94")
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.white
        dayStyle.future = Color.white
        dayStyle.past = Color(hex: "#259678")
        dayStyle.selectedBg =  Color(hex: "#259678")
        dayStyle.selectedFg =  Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.white
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color.white
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var blueWhite : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color(hex: "#249EE0")
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.white
        dayStyle.future = Color.white
        dayStyle.past = Color(hex: "#0e7ab5")
        dayStyle.selectedBg =  Color(hex: "#0e7ab5")
        dayStyle.selectedFg =  Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.white
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color.white
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var redWhite : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color(hex: "#E95450")
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.white
        dayStyle.future = Color.white
        dayStyle.past = Color(hex: "#B71B1B")
        dayStyle.selectedBg =  Color(hex: "#B71B1B")
        dayStyle.selectedFg =  Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.white
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color.white
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
    
    public static var purpleWhite : HCalendarStyle  {
        var calendarStyle = HCalendarStyle()
        calendarStyle.background = Color(hex: "#8275FE")
        calendarStyle.border = Color.white
        
        var dayStyle = HCalendarDayStyle()
        dayStyle.current = Color.white
        dayStyle.future = Color.white
        dayStyle.past = Color(hex: "#4c3fdb")
        dayStyle.selectedBg =  Color(hex: "#4c3fdb")
        dayStyle.selectedFg =  Color.white
        calendarStyle.day = dayStyle
        
        var weekStyle =  HCalendarWeekStyle()
        weekStyle.foreground = Color.white
        weekStyle.fontSize = 16
        calendarStyle.weekSymbol = weekStyle
        
        var navStyle =  HCalendarNavStyle()
        navStyle.foreground = Color.white
        navStyle.showToday = true
        navStyle.strokeToday = Color.white
        navStyle.strokeNav = Color.white
        calendarStyle.nav =  navStyle
        
        return calendarStyle
    }
 
}
