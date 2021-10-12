//
//  HCalendarViewModel.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 24/9/2021.
//

import Foundation
import SwiftUI

class HCalendarViewModel : ObservableObject {
    
    //@Published var selectedTab = 0
   // var weeksOrigin = [WeekModel]()
    //@Published var weeks = [WeekModel]()
    
    //@Published var maxWeekNum = 7
    //@Published var minWeekNum = 0
    
    @Published var selectedDate = DateUtils.getTodayDateWithTZ()
    @Published var todayDate = DateUtils.getTodayDateWithTZ()
    
    @Published var currentMonth = Date()
/*
    func fillWeeks(){
        for index in minWeekNum...maxWeekNum {
            var weekModel = WeekModel()
            weekModel.id = index
            weekModel.days = DateUtils.getDaysOfWeek(index: index)
            weeksOrigin.append(weekModel)
            
        }
        weeksOrigin.sort {
            $0.id < $1.id
        }
        weeks.append(contentsOf: weeksOrigin)
    }
    
    func addWeeks(index : Int, isLast : Bool = false){
        var weekModel = WeekModel()
        weekModel.id = index
        weekModel.days = DateUtils.getDaysOfWeek(index: index)
        //print(weekModel)
       
        if(isLast){
            weeksOrigin.append(weekModel)
        }else{
            weeksOrigin.insert(weekModel, at: 0)
        }
        weeksOrigin.sort {
            $0.id < $1.id
        }
        weeks = weeksOrigin
    }*/
}
