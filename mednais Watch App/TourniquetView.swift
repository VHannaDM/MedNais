//
//  TourniquetView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 24/03/2024.
//

import SwiftUI
import Combine

struct TourniquetView: View {
    @State private var showFinishingPuncture: Bool = false
    @State private var timeRemaining = 60
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
    @StateObject var viewModel = VenusBloodViewModel()
    
    @State private var cancellable: Cancellable?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                timeOfEnsureTourniquet
                HStack(spacing: 24) {
                    Text("0:\(timeRemaining)")
                    startTimerButton
                }
                instructionsView
                nextButton
            }
            .navigationDestination(isPresented: $showFinishingPuncture) {
                FinishingPunctureView()
            }
        }
        .onReceive(timer) {_ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
    
    var titleView: some View {
        Text("TOURNIQUET")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var timeOfEnsureTourniquet: some View {
        Text("Ensure tourniquet\nis applied less\nthan 1 min")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    
    
    var instructionsView: some View {
        Text("Release tourniquet\nafter first tube\n\nMix tubes 1 time")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var nextButton: some View {
        Button {
            showFinishingPuncture = true
            viewModel.tourniquetDate = Date()
        } label: {
            Text("NEXT")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var startTimerButton: some View {
        Button {
            if cancellable == nil {
                cancellable = timer.connect()
                viewModel.timerDate = Date()
            } else {
                cancellable?.cancel()
                timer = Timer.publish(every: 1, on: .main, in: .common)
                cancellable = nil
            }
        } label: {
            Image("timer")
                .resizable()
                .renderingMode(.template)
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
                .tint(.white)
        }
        .fixedSize()
        .buttonStyle(PlainButtonStyle())
    }
}

struct TourniquetView_Previews: PreviewProvider {
    static var previews: some View {
        TourniquetView()
    }
}
