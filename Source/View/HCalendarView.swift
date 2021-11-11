//
//  HCalendarView.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 24/9/2021.
//

import SwiftUI
import SwiftUIPager

public struct HCalendarView: View {
    
    @StateObject var hCalendarVM = HCalendarViewModel()
    
    public var calendarStyle = HCalendarTheme.grayOr
    public var config = HCalendarConfig()
    
    @State var isMonthChanged = false
    @State var fromNext = false
    
    public let onDaySelected : (_ value: Date) -> ()
    
    @StateObject var selectedPage = Page.withIndex(0)
    @State var data = Array(0..<6)
    @State var todayIndex = 0
    
    public init(config : HCalendarConfig , onDaySelected : @escaping (Date) -> ()) {
        self.config = config
        self.onDaySelected = onDaySelected
    }
    
    public init(calendarStyle : HCalendarStyle =  HCalendarTheme.grayOr, onDaySelected : @escaping (Date) -> ()) {
        self.calendarStyle = calendarStyle
        self.onDaySelected = onDaySelected
    }
    
    public init(config : HCalendarConfig , calendarStyle : HCalendarStyle =  HCalendarTheme.grayOr, onDaySelected : @escaping (Date) -> ()) {
        self.config = config
        self.calendarStyle = calendarStyle
        self.onDaySelected = onDaySelected
    }
    
    
    public var body: some View {
        VStack(){
            
            HStack(spacing: 0){
                
                Button{
                    if selectedPage.index == 0 && config.showPastWeek {
                        self.onPrevious()
                    }
                    withAnimation {
                         selectedPage.update(.previous)
                    }
                    fromNext = false
                    onMonthChanged(page: selectedPage.index)
                } label:{
                    calendarStyle.nav.navLeftIcon
                        .font(.body.bold())
                        .foregroundColor(calendarStyle.nav.navFg)
                        .frame(width: calendarStyle.nav.navImageW, height: calendarStyle.nav.navImageH)
                        .background(RoundedRectangle(cornerRadius: calendarStyle.nav.navRadius).strokeBorder(calendarStyle.nav.navStrokeColor, lineWidth: calendarStyle.nav.navStrokeWidth).background(RoundedRectangle(cornerRadius:  calendarStyle.nav.navRadius).fill(calendarStyle.nav.navBg)))
                       
                }.opacity((selectedPage.index == 0 && !config.showPastWeek) ? 0 : 1)
                
                Spacer()
                
                ZStack(){
                    Text("\(hCalendarVM.currentMonth.monthName(format: config.monthFormat, locale: config.locale))").foregroundColor(calendarStyle.nav.navFg)
                        .offset(x: isMonthChanged ? 0 : fromNext ? 150 : -150)
                        .opacity(isMonthChanged ? 1 : 0)
                    
                    Text("\(hCalendarVM.currentMonth.monthName(format: config.monthFormat, locale: config.locale))").foregroundColor(calendarStyle.nav.navFg)
                        .offset(x: !isMonthChanged ? 0 : fromNext ? -150 : 150)
                        .opacity(isMonthChanged ? 0 : 1)
                }
                
                Spacer()
                
                if(config.showToday){
                    Text("T")
                        .font(.body.bold())
                        .foregroundColor(calendarStyle.nav.todayFg)
                        .frame(width: calendarStyle.nav.navImageW, height: calendarStyle.nav.navImageH)
                        .background(RoundedRectangle(cornerRadius: calendarStyle.nav.navRadius).strokeBorder(calendarStyle.nav.todayStrokeColor, lineWidth: calendarStyle.nav.todayStrokeWidth).background(RoundedRectangle(cornerRadius:  calendarStyle.nav.navRadius).fill(calendarStyle.nav.todayBg)))
                        .padding(.trailing, 20)
                        .onTapGesture {
                            //hCalendarVM.selectedDate =  hCalendarVM.todayDate
                            withAnimation(.easeInOut(duration: 0.5)) {
                                hCalendarVM.selectedDate = hCalendarVM.todayDate
                            }
                            onDaySelected(hCalendarVM.selectedDate)
                            withAnimation {
                                selectedPage.update(.new(index: todayIndex))
                            }
                            onMonthChanged(page: selectedPage.index)
                        }
                }
                
                Button{
                    
                    if selectedPage.index == self.data.count - 2 {
                        self.onNext()
                    }
                    withAnimation {
                        selectedPage.update(.next)
                    }
                    fromNext = true
                    onMonthChanged(page: selectedPage.index)
                } label:{
                    calendarStyle.nav.navRightIcon
                        .font(.body.bold())
                        .foregroundColor(calendarStyle.nav.navFg)
                        .frame(width: calendarStyle.nav.navImageW, height: calendarStyle.nav.navImageH)
                        .background(RoundedRectangle(cornerRadius: calendarStyle.nav.navRadius).strokeBorder(calendarStyle.nav.navStrokeColor, lineWidth: calendarStyle.nav.navStrokeWidth).background(RoundedRectangle(cornerRadius:  calendarStyle.nav.navRadius).fill(calendarStyle.nav.navBg)))
                }
                
            }.padding()
            
            VStack(){
                WeekDaysSymbolsView(calendarConfig: config, calendarWeekStyle: calendarStyle.weekSymbol)
                
                Pager(page: selectedPage,
                      data: data,
                      id: \.self) {
                        self.pageView($0)
                }
                .singlePagination(ratio: 0.5, sensitivity: .high)
                .onPageWillChange({ (page) in
                    if(selectedPage.index > page){
                        fromNext = false
                    }else{
                        fromNext = true
                    }
                   
                    if page == 0 && config.showPastWeek {
                        self.onPrevious()
                    } else if page == self.data.count - 2 {
                        self.onNext()
                    }
                    onMonthChanged(page: page)
                })
                .onPageChanged({ page in
                    //print("Page changed to: \(page)")
                    
                })
                .pagingPriority(.simultaneous)
                .preferredItemSize(CGSize(width: UIScreen.main.bounds.width, height: 50))
                .itemSpacing(0)
                .frame( height: 50, alignment: .center)
                .onAppear(){
                    if selectedPage.index == 0 && config.showPastWeek {
                        self.onPrevious()
                    }
                }
            }
        }
        .padding(.bottom)
        .background(calendarStyle.background)
        .border(calendarStyle.border)
    }
    
    func pageView(_ page: Int) -> some View {
        
        WeekView(days: DateUtils.getDaysOfWeek(index: page, firstWeekday: config.firstWeekday)) { date in
            HStack(spacing: 0){
                Spacer()
                Text("10")
                    .hidden()
                    .padding(8)
                    .background(date.isEqual(to: hCalendarVM.selectedDate) ? calendarStyle.day.selectedBg  : date == hCalendarVM.todayDate ? calendarStyle.day.unSelectedBg :  calendarStyle.day.unSelectedBg)
                    .cornerRadius(calendarStyle.day.selectedRadius)
                    .padding(.vertical, 5)
                    .overlay(
                        Text(date.day(locale: config.locale))
                            .foregroundColor(date.isEqual(to: hCalendarVM.selectedDate) ? calendarStyle.day.selectedFg : date == hCalendarVM.todayDate ? calendarStyle.day.current : date >= hCalendarVM.todayDate ? calendarStyle.day.future : calendarStyle.day.past)
                    ).onTapGesture {
                        if(config.showPastWeek || date >= hCalendarVM.todayDate){
                            withAnimation(.easeInOut(duration: 0.5)) {
                                hCalendarVM.selectedDate = date
                            }
                            onDaySelected(date)
                        }
                    }
                Spacer()
            }.padding(.leading, 5)
        }
        
    }
    
    func onNext(){
        guard let last = self.data.last else { return }
        let newData = (1...5).map { last + $0 }
        withAnimation {
            data.append(contentsOf: newData)
        }
    }
    
    func onPrevious(){
        let newData = (1...5).map { data.first! - $0 }.reversed()
        withAnimation {
            todayIndex += newData.count
            selectedPage.index += newData.count
            data.insert(contentsOf: newData, at: 0)
        }
    }
    
    func onMonthChanged(page: Int){
        withAnimation(.linear(duration: 0.3)) {
            let firstDayOfweek = DateUtils.getStartOfWeek(index: data[page] , firstWeekday: config.firstWeekday)
            if(!hCalendarVM.currentMonth.isInSameMonth(as: firstDayOfweek)){
                hCalendarVM.currentMonth = firstDayOfweek
                isMonthChanged = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [self] in
                    isMonthChanged = false
                }
            }
        }
    }

}

struct HCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HCalendarView(config: HCalendarConfig()) { date in
            
        }
    }
}
