//
//  ExtensionHelper.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 1/10/2021.
//

import Foundation
import Combine
import SwiftUI


extension NSNotification {
    static let dayChanged = NSNotification.Name.init("day_changed")
    static let eventAdded = NSNotification.Name.init("event_added")
    static let eventUpdated = NSNotification.Name.init("event_updated")
    static let eventRemoved = NSNotification.Name.init("event_removed")
    static let eventsRemoved = NSNotification.Name.init("all_event_removed")
    
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    func capitalizeFirstLetter() -> String{
        return self.capitalizingFirstLetter()
    }
}
