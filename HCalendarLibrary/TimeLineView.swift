//
//  TimeLineView.swift
//  HCalendarLibrary
//
//  Created by macbook pro on 28/9/2021.
//

import SwiftUI

public struct TimeLineView<EventView>:  View  where EventView: View {
    
    @StateObject var timeLineVM = TimeLineViewModel()
    
    public var config : TimeLineConfig = TimeLineConfig()
    public var timeLineStyle = TimeLineTheme.grayRed
    @Binding var selectedDate : Date
    @Binding var events: [EventModel]
    public let eventView: (EventModel) -> EventView
    public var onEventTaped : (_ value: EventModel) -> ()
    
    public init(date : Binding<Date>,
                events :  Binding<[EventModel]>,
                @ViewBuilder content: @escaping (EventModel) -> EventView,
                onEventTaped : @escaping (EventModel) -> ()){
        self._selectedDate = date
        self._events = events
        self.eventView = content
        self.onEventTaped = onEventTaped
    }
    
    public init(config: TimeLineConfig, date : Binding<Date>,
                events :  Binding<[EventModel]>,
                @ViewBuilder content: @escaping (EventModel) -> EventView,
                onEventTaped : @escaping (EventModel) -> ()){
        self.config = config
        self._selectedDate = date
        self._events = events
        self.eventView = content
        self.onEventTaped = onEventTaped
    }
    
   
    public init(config: TimeLineConfig,
                style: TimeLineStyle,
                date : Binding<Date>,
                events :  Binding<[EventModel]>,
                @ViewBuilder content: @escaping (EventModel) -> EventView,
                onEventTaped : @escaping (EventModel) -> ()){
        self.config = config
        self.timeLineStyle = style
        self._selectedDate = date
        self._events = events
        self.eventView = content
        self.onEventTaped = onEventTaped
    }
    
    @State var lastScaleValue: CGFloat = 1.0
    @State var scale: CGFloat = 1.0
    @State var frame = CGRect()
    
    public var body: some View {
        VStack(){
            if(timeLineVM.config.showCurrentDate){
                Text(selectedDate.toString(format: timeLineVM.config.dateFormat, locale: timeLineVM.config.locale)).foregroundColor(.white)
            }
            
            GeometryReader{ reader in
                ScrollView(.vertical, showsIndicators: false, content: {
                    ZStack(alignment: .topLeading){
                        
                        VStack(spacing: 0){
                            ForEach(timeLineVM.config.startHour..<timeLineVM.config.endHour+1, id: \.self) { index in
                                HStack(spacing: 0){
                                    VStack(alignment: .trailing, spacing: 0){
                                        HStack(alignment: .top){
                                            Spacer()
                                            if(timeLineVM.config.use24Format){
                                                Text("\(index)")
                                                    .foregroundColor(timeLineStyle.timeColor)
                                                    .offset(y: index == timeLineVM.config.startHour ? 0: -12)
                                                    .padding(.trailing , 5)
                                                    .font(.custom(timeLineStyle.timeFont, size: timeLineStyle.timeSize))
                                            }else{
                                                HStack(spacing: 0){
                                                    Text(index <= 12 ? "\(index)" : "\(index - 12)")
                                                        .font(.custom(timeLineStyle.timeFont, size: timeLineStyle.timeSize))
                                                        .padding(.trailing , 2)
                                                    Text(index <= 12 ? timeLineStyle.amText : timeLineStyle.pmText )
                                                        .padding(.trailing , 5)
                                                }
                                                .foregroundColor(timeLineStyle.timeColor)
                                                .offset(y: index == timeLineVM.config.startHour ? 0: -12)
                                            }
                                            
                                        }
                                        Spacer()
                                    }
                                    .frame(width: timeLineStyle.timeWidth, height: timeLineStyle.eventHeight * scale)
                                    .background(timeLineStyle.timeBackground)
                                    
                                    Spacer(minLength: 0)
                                    
                                    if(index != timeLineVM.config.endHour){
                                        VStack(spacing: 0){
                                            Spacer()
                                            Divider()
                                                .frame(height: timeLineStyle.dividerHeight).background(timeLineStyle.dividerColor)
                                        }
                                    }
                                    
                                    
                                }.frame(width: UIScreen.main.bounds.width, height: timeLineStyle.eventHeight * scale, alignment: .center)
                                .background(timeLineStyle.background)
                                
                            }
                        }
                           
                        ForEach(timeLineVM.events, id: \.id) { event in
                            
                            self.eventView(event)
                                .frame(width: event.location.width, height: event.location.height)
                                .background(timeLineStyle.eventBackground)
                                .offset(x: event.location.posX, y: event.location.posY)
                                .onTapGesture {
                                    onEventTaped(event)
                                }
                        }
                        if(timeLineVM.config.nowLineEnabled && timeLineVM.nowLineAvailable){
                            Rectangle()
                                .fill(timeLineStyle.nowLineColor)
                                .frame(width: timeLineStyle.timeWidth, height: timeLineStyle.nowLineHeight, alignment: .center)
                                .offset( y : timeLineVM.nowLinePosY)
                                .animation(.spring())
                        }
                        
                    }
                })
                .gesture(MagnificationGesture().onChanged { val in
                    let delta = val / self.lastScaleValue
                    self.lastScaleValue = val
                    let newScale = self.scale * delta
                    if(newScale > config.minScale && newScale < config.maxScale){
                        self.scale = newScale
                        timeLineVM.initEventPosition(reader: frame, scale: self.scale )
                        
                    }
                }.onEnded { val in
                    lastScaleValue = 1.0
                })
                .onAppear(){
                    frame = reader.frame(in: .local)
                    timeLineVM.calculatePosition(reader: frame, scale: scale)
                }
            }
        }.onReceive(timeLineVM.timer) { _ in
            timeLineVM.updateNowLine(reader: frame, scale: scale)
        }
        .onAppear(){
            //DebugHelper.debug(config)
            timeLineVM.config = config
            timeLineVM.style = timeLineStyle
            NotificationCenter.default.addObserver(forName: NSNotification.dayChanged, object: nil, queue: nil,
                                                   using: self.onDayChanged)
            
            NotificationCenter.default.addObserver(forName: NSNotification.eventAdded, object: nil, queue: nil,
                                                   using: self.onEventAdded)
            NotificationCenter.default.addObserver(forName: NSNotification.eventsRemoved, object: nil, queue: nil,
                                                   using: self.onEventsRemoved)
            
            NotificationCenter.default.addObserver(forName: NSNotification.eventUpdated, object: nil, queue: nil,
                                                   using: self.onEventUpdated)
        }
        
    }
    
    func onEventAdded(_ notification: Notification) {
        timeLineVM.events = events
        timeLineVM.calculatePosition(reader: frame, scale: scale)
    }
    
    func onEventsRemoved(_ notification: Notification) {
        timeLineVM.events = events
        timeLineVM.maxColumn = 0
        timeLineVM.calculatePosition(reader: frame, scale: scale)
    }
    
    func onEventUpdated(_ notification: Notification) {
        timeLineVM.events = events
        timeLineVM.calculatePosition(reader: frame, scale: scale)
    }
    func onDayChanged(_ notification: Notification) {
        timeLineVM.selectedDate = selectedDate
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView(date:.constant(Date()), events: .constant([EventModel]())) { event in
            
        } onEventTaped: { event in
            
        }  
    }
}
