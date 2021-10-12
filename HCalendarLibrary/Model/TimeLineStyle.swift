//
//  TimeLineStyle.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 5/10/2021.
//

import Foundation
import SwiftUI

public struct TimeLineStyle {
    public var background = Color.black
    public var border = Color.clear
    
    public var dividerColor = Color.white
    public var dividerHeight : CGFloat = 1
    
    public var eventHeight : CGFloat = 100
    public var eventBackground = Color.black
    
    public var timeWidth : CGFloat = 70
    public var timeFont = "SF"
    public var timeSize : CGFloat = 16
    public var timeColor = Color.black
    public var timeBackground = Color.white
    
    public var amText = "AM"
    public var pmText = "PM"
    
    public var nowLineColor = Color.black
    public var nowLineHeight : CGFloat = 2
    
    public init() {
        
    }
    
}
