//
//  ContentView.swift
//  ExploreCharts
//
//  Created by Nitesh on 12/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bell")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Ring the bell")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
