//
//  EventUtils.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 1/10/2021.
//

import Foundation
public struct EventUtils {
    
    public static func onDayChanged() {
        NotificationCenter.default.post(name: NSNotification.dayChanged,object: nil, userInfo: nil)
    }
    
    public static func onEventAdded() {
        NotificationCenter.default.post(name: NSNotification.eventAdded,object: nil, userInfo: nil)
    }
    
    public static func onEventRemoved() {
        NotificationCenter.default.post(name: NSNotification.eventRemoved,object: nil, userInfo: nil)
    }
    
    public static func onEventUpdated() {
        NotificationCenter.default.post(name: NSNotification.eventUpdated,object: nil, userInfo: nil)
    }
    
    public static func onEventRemovedAll() {
        NotificationCenter.default.post(name: NSNotification.eventsRemoved,object: nil, userInfo: nil)
    }
}
