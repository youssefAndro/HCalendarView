//
//  TimeLineConfig.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 4/10/2021.
//

import Foundation
import SwiftUI


public struct TimeLineConfig {
    public var showCurrentDate = true
    public var locale = Locale.current
    public var dateFormat = "yyyy-MM-dd"
    
    public var use24Format = true
    public var startHour = 0
    public var endHour = 23
    public var adaptTimeToEvent = false
    public var adaptHour = 1
    
    public var nowLineEnabled = true
    public var isScaleEnabled = true
    public var minScale : CGFloat = 0.5
    public var maxScale : CGFloat = 5
    
    public init() {
        
    }
    
    public init(use24Format: Bool, startH: Int, endH: Int, adaptTimeToEvent: Bool,  nowLineEnabled: Bool) {
        self.use24Format = use24Format
        self.startHour = startH
        self.endHour = endH
        self.adaptTimeToEvent = adaptTimeToEvent
        self.nowLineEnabled = nowLineEnabled
    }
    
    public init(use24Format: Bool, startH: Int, endH: Int, adaptTimeToEvent: Bool) {
        self.use24Format = use24Format
        self.startHour = startH
        self.endHour = endH
        self.adaptTimeToEvent = adaptTimeToEvent
    }
    
    public init(adaptTimeToEvent: Bool) {
        self.adaptTimeToEvent = adaptTimeToEvent
    }
    
    public init(use24Format: Bool) {
        self.use24Format = use24Format
    }
    
    public init(startH: Int, endH: Int) {
        self.startHour = startH
        self.endHour = endH
    }
    
    public init(nowLineEnabled: Bool) {
        self.nowLineEnabled = nowLineEnabled
    }
   
}
