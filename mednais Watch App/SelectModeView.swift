//
//  SelectModeView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 05/02/2024.
//

import SwiftUI

class SelectModeViewodel: ObservableObject {
    
   @Published var modes: [Mode] = [
        Mode(title: "Venous blood"),
        Mode(title: "Capillary Blood"),
        Mode(title: "Arterial Blood Gases"),
        Mode(title: "Urinalysis"),
        Mode(title: "Transportation")
    ]
}

struct SelectModeView: View {
    @State private var showMode: Mode? = nil
    @StateObject var viewModel = SelectModeViewodel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.modes.indices, id: \.self) { index in
                        NavigationLink(value: viewModel.modes[index]) {
                            Text(viewModel.modes[index].title)
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
