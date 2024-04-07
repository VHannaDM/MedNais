//
//  SelectModeView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 05/02/2024.
//

import SwiftUI

struct SelectModeView: View {
    @State private var showMode: Mode? = nil
    
    @State private var modes: [Mode] = [Mode(title: "Venous blood"), Mode(title: "Capillary Blood"), Mode(title: "Arterial Blood Gases"), Mode(title: "Urinalysis"), Mode(title: "Transportation")]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(modes.indices, id: \.self) { index in
                        NavigationLink(value: modes[index]) {
                            Text(modes[index].title)
                        }
                    }
                }
            }
            .navigationTitle("Select Mode")
            .navigationDestination(for: Mode.self) { mode in
                if mode.title == "Venous blood" {
                    PreSamplingView()
                } else {
                    Text("hello")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectModeView()
    }
}
