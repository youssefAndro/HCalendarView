//
//  TimeLineTheme.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 5/10/2021.
//

import Foundation
import SwiftUI

public struct TimeLineTheme {
    
    public static var grayRed : TimeLineStyle  {
        var timeLineStyle = TimeLineStyle()
        timeLineStyle.background = Color(hex: "#0F0F0F")
        timeLineStyle.border = Color.clear
        
        timeLineStyle.dividerColor = Color.red.opacity(0.5)
        timeLineStyle.eventBackground = Color(hex: "#2a2a2a")
        
        timeLineStyle.timeColor = Color.red
        timeLineStyle.timeBackground = Color(hex: "#0F0F0F")
        
        timeLineStyle.nowLineColor = Color.red
        return timeLineStyle
    }
    
    
    public static var grayOr : TimeLineStyle  {
        
        var timeLineStyle = TimeLineStyle()
        timeLineStyle.background = Color(hex: "#0F0F0F")
        timeLineStyle.border = Color.clear
        
        timeLineStyle.dividerColor = Color(hex: "#FED6A3")
        timeLineStyle.eventBackground = Color(hex: "#2a2a2a")
        
        timeLineStyle.timeColor = Color(hex: "#FED6A3")
        timeLineStyle.timeBackground = Color(hex: "#0F0F0F")
        
        timeLineStyle.nowLineColor = Color(hex: "#FED6A3")
        return timeLineStyle
        
    }
}
