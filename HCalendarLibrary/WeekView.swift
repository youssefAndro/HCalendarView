//
//  WeekView.swift
//  HorizontalCalendar
//
//  Created by macbook pro on 27/9/2021.
//

import Foundation
import SwiftUI

struct WeekView<DateView>: View where DateView: View {
    let days: [Date]
    let content: (Date) -> DateView

    init(
        days:  [Date],
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.days = days
        self.content = content
    }

    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                HStack {
                    self.content(date)
                }
            }
        }
    }
}
