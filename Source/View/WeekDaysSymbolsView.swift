//
//  WeekDaySymbols.swift
//  HorizontalCalendar
//
//  Created by user196417 on 9/21/21.
//

import SwiftUI

public struct WeekDaysSymbolsView: View {
    var calendarConfig : HCalendarConfig
    var calendarWeekStyle = HCalendarWeekStyle()
    
    public var body: some View {
        HStack(spacing: 0){
            ForEach(DateUtils.weekDaySymbols(weekDayFormat: calendarConfig.weekdaySymbolFormat, firstWeekday: calendarConfig.firstWeekday, local: calendarConfig.locale), id: \.self) { item in
                Spacer()
                Text(item)
                    .font(.custom(calendarWeekStyle.font, size: calendarWeekStyle.fontSize))
                    .foregroundColor(calendarWeekStyle.foreground)
                Spacer()
            }
        }
    }
}

struct WeekDaySymbols_Previews: PreviewProvider {
    static var previews: some View {
        WeekDaysSymbolsView(calendarConfig: HCalendarConfig())
    }
}
