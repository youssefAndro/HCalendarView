//
//  TimeLineViewModel.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 28/9/2021.
//

import Foundation
import SwiftUI

class TimeLineViewModel : ObservableObject {
    @Published var style = TimeLineTheme.grayRed
    @Published var config = TimeLineConfig()
    @Published var events = [EventModel]()
    var maxColumn = 0
    
    @Published var selectedDate : Date = Date()
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var nowLinePosY : CGFloat = 0
    @Published var nowLineAvailable = false
    
    func initConfig(config : TimeLineConfig) {
        self.config = config
        setConfig()
    }
    
    func setConfig(){
        if(self.config.endHour < self.config.startHour){
            let end = self.config.endHour
            self.config.endHour = self.config.startHour
            self.config.startHour = end
        }
        if( self.config.endHour > 23){
            self.config.endHour = 23
        }
        if(self.config.startHour < 0){
            self.config.startHour = 0
        }
        if(config.adaptTimeToEvent){
            let (min, max) = getRangeEvent()
            self.config.startHour = min
            self.config.endHour = max
        }
    }
    
    func calculatePosition(reader : CGRect, scale : CGFloat){
        setConfig()
        updateDayEvents(adapt: true)
        initEventPosition(reader: reader, scale : scale)
    }
    
    func updateDayEvents(adapt : Bool){
        for (index, event) in events.enumerated() {
            if(event.eStartTime! > event.eEndTime!){
                let endTime = event.eEndTime
                events[index].eEndTime = event.eStartTime
                events[index].eStartTime = endTime
            }
            if(event.eAllDay){
                events[index].eStartTime = adapt ? selectedDate.changeTo(hour: config.startHour, minute: 0) :  selectedDate
                events[index].eEndTime = adapt ? selectedDate.changeTo(hour: config.endHour , minute: 59) : selectedDate.addDays(days: 1)
                continue
            }
            var startTime = event.eStartTime!
            var endTime = event.eEndTime!
            
            if(adapt){
                if(startTime < selectedDate.changeTo(hour: config.startHour, minute: 0)){
                    startTime = selectedDate.changeTo(hour: config.startHour, minute: 0)
                }
                if(endTime < selectedDate.changeTo(hour: config.startHour, minute: 0)){
                    endTime = selectedDate.changeTo(hour: config.startHour, minute: 0)
                }else if(endTime > selectedDate.changeTo(hour: config.endHour, minute: 59)){
                    endTime = selectedDate.changeTo(hour: config.endHour, minute: 59)
                }
            }else{
                if(!endTime.isInSameDay(as: selectedDate)){
                    endTime = selectedDate.changeTo(hour: 23, minute: 59)
                } else if(!startTime.isInSameDay(as: selectedDate)){
                    startTime = selectedDate
                }
            }
            events[index].eStartTime = startTime
            events[index].eEndTime = endTime
        }
        
        events.sort {
            $0.eStartTime!.compare($1.eStartTime!) == .orderedAscending
        }
    }
    
    func initEventPosition(reader : CGRect, scale : CGFloat){
        for (index, event) in events.enumerated() {
           
            let startTime = event.eStartTime!
            let endTime = event.eEndTime!
            let diffMinute = endTime.getMinutesDiff(dateStart: startTime)
            
            var location = EventLocationModel()
           
            location.posY = reader.minY + ( (CGFloat(startTime.hour - config.startHour)) * (style.eventHeight * scale)) + ((CGFloat(startTime.minute) * (style.eventHeight * scale)) / 60)
            
            location.width = UIScreen.main.bounds.width - style.timeWidth
            location.height = (CGFloat(diffMinute) * (style.eventHeight * scale)) / 60
            location.posX = style.timeWidth
            events[index].location = location
        }
        updateOverlapedEventPosition()
    }
    
    func updateOverlapedEventPosition() {
        var starIndex = 0
        for (index, event) in events.enumerated() {
            if(index == 0){
                continue
            }
            var eventsOverlap = [EventModel]()
            var eventsNotOverlap = [EventModel]()
            for n in starIndex...index-1 {
                if DateUtils.doEventsOverlap(events[index], events[n]){
                    eventsOverlap.append(events[n])
                }else{
                    eventsNotOverlap.append(events[n])
                }
            }
            
            if(eventsNotOverlap.count == 0 && eventsOverlap.count > 0){
                eventsOverlap.append(event)
                reDrawOverLapedEvent(overLaped: eventsOverlap)
            }else if(eventsOverlap.count == index){
                eventsOverlap.append(event)
                reDrawOverLapedEvent(overLaped: eventsOverlap)
            }else if(eventsNotOverlap.count  > 0 && eventsOverlap.count > 0){
                moveOverLapedEvent(overLaped: eventsOverlap, notOverLaped: eventsNotOverlap, eventIndex : index)
            }else{
                starIndex = index
            }
        }
       
    }

    func reDrawOverLapedEvent(overLaped : [EventModel]){
        maxColumn = overLaped.count > maxColumn ? overLaped.count : maxColumn
        var startX = style.timeWidth
        let width = Int((UIScreen.main.bounds.width - style.timeWidth)) / maxColumn
       
        for (index, overLapedEvent) in overLaped.enumerated() {
            for (index1, event) in events.enumerated() {
                if(overLapedEvent.id == event.id){
                    events[index1].location.width = CGFloat(width)
                    events[index1].location.posX = startX
                    events[index1].location.posInRange = index
                    startX = startX + CGFloat(width)
                }
            }
        }
    }
    
    func moveOverLapedEvent(overLaped : [EventModel], notOverLaped : [EventModel], eventIndex : Int){
      
        if(maxColumn == overLaped.count){
            var duplicateArray = overLaped
            duplicateArray.append(events[eventIndex])
            maxColumn += 1
            updateOverlapedEventPosition()
            return
        }else if(maxColumn > overLaped.count){
            
            let availablePos = getAvailablePosition(overLaped: overLaped)
            
            let width = Int((UIScreen.main.bounds.width - style.timeWidth)) / maxColumn
            events[eventIndex].location.width = CGFloat(width)
            events[eventIndex].location.posX = style.timeWidth + CGFloat(width * availablePos)
            events[eventIndex].location.posInRange = availablePos
            return
        }
       
    }
    
    func getAvailablePosition(overLaped : [EventModel]) -> Int{
        var duplicateArray = overLaped
        duplicateArray.sort {
            $0.location.posInRange < $1.location.posInRange
        }
        for c in 0...maxColumn {
            var posEmpty = true
            for (_, overLapedEvent) in duplicateArray.enumerated() {
                if(c ==  overLapedEvent.location.posInRange){
                    posEmpty = false
                    break
                }
            }
            if(posEmpty){
                return c
            }
        }
        return 0
    }
    
    func getRangeEvent() -> (min: Int , max: Int ){
        
        updateDayEvents(adapt: false)
        
        let maxEvent = events.max(by: {
           $0.eEndTime! < $1.eEndTime!
        })
        let minEvent = events.min(by: {
           $0.eStartTime! < $1.eStartTime!
        })
        
        let minHour = (minEvent?.eStartTime?.hour ?? 0) - config.adaptHour
        let maxHour = (maxEvent?.eEndTime?.hour ?? 23) + config.adaptHour
        return ( minHour  <= 0 ? 0 : minHour , maxHour  >= 23 ? 23 : maxHour )
    }
    
    func updateNowLine(reader : CGRect, scale : CGFloat){
        let now = DateUtils.getNowDateWithTZ()
        
        if(now.isInSameDay(as: selectedDate)){
            if(now.hour >= config.startHour && now.hour <= config.endHour && config.nowLineEnabled){
                nowLinePosY = reader.minY  + ( (CGFloat(now.hour - config.startHour)) * (style.eventHeight * scale)) + ((CGFloat(now.minute) * (style.eventHeight * scale)) / 60)
                nowLineAvailable = true
            }else{
                nowLineAvailable = false
            }
        }else{
            nowLineAvailable = false
        }
       
    }
}
