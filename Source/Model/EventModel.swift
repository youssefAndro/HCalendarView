//
//  EventModel.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 28/9/2021.
//

import Foundation
import SwiftUI

public struct EventModel: Equatable {
    public static func == (lhs: EventModel, rhs: EventModel) -> Bool {
        return lhs.eName == rhs.eName
    }
   
    public var id : Int = -1
    public var eStartTime : Date?
    public var eEndTime : Date?
    public var eName : String?
    public var eColor :String?
    public var eAllDay: Bool = false
    /// Location  related to this event.
    public var location = EventLocationModel()
    /// Storage for values or objects related to this event.
    public var eventInfo: [AnyHashable : Any]?
    
    public init(){
        
    }
    
    public init(id: Int, name: String ,startTime: Date, endTime : Date, color : String) {
        self.id = id
        self.eStartTime = startTime
        self.eEndTime = endTime
        self.eAllDay = false
        self.eColor = color
        self.eName = name
    }
    
    public init(id: Int, startTime: Date, endTime : Date, allDay: Bool) {
        self.id = id
        self.eStartTime = startTime
        self.eEndTime = endTime
        self.eAllDay = allDay
        self.eColor = "#ffffff"
        self.eName = ""
    }
}

public struct EventLocationModel {
    var id = UUID()
    var posX : CGFloat = 0
    var posY :  CGFloat = 0
    var width :  CGFloat = 0
    var height : CGFloat = 0
    var posInRange : Int = 0
}
