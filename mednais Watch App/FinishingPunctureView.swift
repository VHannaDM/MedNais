//
//  FinishingPunctureView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 31/03/2024.
//

import SwiftUI

struct FinishingPunctureView: View {
    @State private var showPostSampling: Bool = false
    @ObservedObject var viewModel: VenusBloodViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                informationView
                nextButton
            }
            .navigationDestination(isPresented: $showPostSampling) {
                PostSamplingView(viewModel: viewModel)
            }
        }
    }
    
    var titleView: some View {
        Text("FINISHING\nPUNCTURE")
            .bold()
            .foregroundColor(Color(red: 0.5, green: 0.7, blue: 0.8))
            .multilineTextAlignment(.center)
    }
    
    var informationView: some View {
        Text("\nRemove and\ndispose the needle\n\nInvert all tubes at\nleast 4 more times\n\nRemove gloves")
            .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.6))
            .multilineTextAlignment(.center)
    }
    
    var nextButton: some View {
        Button {
            showPostSampling = true
            viewModel.finishingPunctureDate = Date()
        } label: {
            Text("NEXT")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct FinishingPunctureView_Previews: PreviewProvider {
    static var previews: some View {
        FinishingPunctureView(viewModel: VenusBloodViewModel())
    }
}
