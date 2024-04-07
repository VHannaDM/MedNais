//
//  PostSamplingView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 31/03/2024.
//

import SwiftUI

struct PostSamplingView: View {
    @State private var showParameters: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                instructionView
                finishButton
            }
        }
    }
    
    var titleView: some View {
        Text("POST-\nSAMPLING")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var iconView: some View {
        ZStack {
            Circle()
                .frame(width: 75, height: 75)
            Text("REST")
                .foregroundColor(.black)
        }
    }
    
    var instructionView: some View {
        Text("Advise the patient\nto rest for 5 min\n\nThank the patient")
    }
    
    var finishButton: some View {
        Button {
            showParameters = true
        } label: {
            Text("FINISH")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct PostSamplingView_Previews: PreviewProvider {
    static var previews: some View {
        PostSamplingView()
    }
}
