//
//  ContentView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 05/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showPreSampling: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    titleView
                    iconView
                    modeView
                    startButton
                }
            }
            .navigationDestination(isPresented: $showPreSampling) {
                PreSamplingView()
            }
        }
    }
    
    var titleView: some View {
        Text("SELECT MODE")
            .bold()
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("TUBES")
                .foregroundColor(.black)
        }
    }
    
    var modeView: some View {
        Text("FLEBOTOMIST\nMODE")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var startButton: some View {
        Button {
            showPreSampling = true
        } label: {
            Text("START")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
