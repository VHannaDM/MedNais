//
//  PunctureView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 24/03/2024.
//

import SwiftUI

struct PunctureView: View {
    @State private var showTourniquet: Bool = false
    @StateObject var viewModel = VenusBloodViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 12) {
                titleView
                instructionsView
                startButton
            }
            .navigationDestination(isPresented: $showTourniquet) {
                TourniquetView()
            }
        }
    }
    
    var titleView: some View {
        Text("PUNCTURE")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var instructionsView: some View {
        Text("Put on the gloves\n\nApply the\ntourniquet\n\nClean the site\n\nPuncture (bevel\nup, 5-30 degree\nangle")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var startButton: some View {
        Button {
            showTourniquet = true
            viewModel.punctureDate = Date()
        } label: {
            Text("START")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct PunctureView_Previews: PreviewProvider {
    static var previews: some View {
        PunctureView()
    }
}
