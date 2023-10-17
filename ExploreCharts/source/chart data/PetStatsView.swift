//
//  PetStatsView.swift
//  ExploreCharts
//
//  Created by Nitesh on 17/10/23.
//

import SwiftUI
import Charts

struct PetStatsView: View {
    
    let catData = PetData.catExample
    let dogData = PetData.dogExamples
    
    var body: some View {
        Chart {
            ForEach(catData) { dataPoint in
                BarMark(x: .value("Year", dataPoint.year), y: .value("Population", dataPoint.population))
            }
            
            ForEach(dogData) { dataPoint in
                BarMark(x: .value("Year", dataPoint.year), y: .value("Population", dataPoint.population))
            }
            .foregroundStyle(.orange)
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct SecondPetStatsView: View {
    
//    let catData = PetData.catExample
//    let dogData = PetData.dogExamples
    
    var data: [(type: String, petData: [PetData])] {
        [(type: "cat", petData: PetData.catExample),
         (type: "dog", petData: PetData.dogExamples)]
    }
    
    var body: some View {
        Chart {
            
            ForEach(data, id: \.type) { dataSeries in
                ForEach(dataSeries.petData) { dataPoint in
                    LineMark(x: .value("Year", dataPoint.year),
                            y: .value("Population", dataPoint.population))
                }
                .foregroundStyle(by: .value("Pet type", dataSeries.type))
                .symbol(by: .value("Pet type", dataSeries.type))
            }
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct ThirdPetStatsView: View {
    
    struct PetDataSeries: Identifiable {
        let type: String
        let petData: [PetData]
        var id: String { type }
    }
    
    var data: [PetDataSeries] {
        [PetDataSeries(type: "cat", petData: PetData.catExample),
         PetDataSeries(type: "dog", petData: PetData.dogExamples)]
    }
    
    var body: some View {
        Chart (data) { dataSeries in
            ForEach(dataSeries.petData) { dataPoint in
                LineMark(x: .value("Year", dataPoint.year),
                         y: .value("Population", dataPoint.population))
            }
            .foregroundStyle(by: .value("Pet type", dataSeries.type))
            .symbol(by: .value("Pet type", dataSeries.type))
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    PetStatsView()
}

#Preview {
    SecondPetStatsView()
}

#Preview {
    ThirdPetStatsView()
}
