//
//  DynamicChartView.swift
//  ExploreCharts
//
//  Created by Nitesh on 17/10/23.
//

import SwiftUI
import Charts

struct CharData: Identifiable, Equatable {
    let type: String
    let count: Int
    
    var id: String { return type }
}


struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Int
    
    var id: String { return type }
}
struct DynamicChartView: View {
    
    let data = [CharData(type: "bird", count: 1),
                CharData(type: "dog", count: 2),
                CharData(type: "cat", count: 5),
                CharData(type: "snake", count: 3)]
    
    var maxChartData: CharData? {
        data.max { $0.count < $1.count }
    }
    
    var body: some View {
        Chart {
            
            ForEach(data) { dataPoint in
                BarMark(x: .value("Type", dataPoint.type), y: .value("Population", dataPoint.count))
                    .opacity(maxChartData == dataPoint ? 1 : 0.5)
                    .foregroundStyle(maxChartData == dataPoint ? Color.accentColor : Color.gray)
            }
            
//            BarMark(x: .value("Type", "bird"), y: .value("Population", 1))
//            BarMark(x: .value("Type", "dog"), y: .value("Population", 2))
//            BarMark(x: .value("Type", "cat"), y: .value("Population", 5))
//                .opacity(0.5)
//            BarMark(x: .value("Type", "snake"), y: .value("Population", 3))
//                .foregroundStyle(.indigo)
            
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    DynamicChartView()
}
