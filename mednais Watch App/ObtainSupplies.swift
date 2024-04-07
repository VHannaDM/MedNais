//
//  ObtainSupplies.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 22/03/2024.
//

import SwiftUI

struct ObtainSupplies: View {
    @State private var showPuncture: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                titleView
                iconView
                obtainSuppliesInformation
                confirmButton
            }
            .navigationDestination(isPresented: $showPuncture) {
                PunctureView()
            }
        }
    }
    
    var titleView: some View {
        Text("OBTAIN\nSUPPLIES")
            .bold()
            .multilineTextAlignment(.center)
    }
    
    var iconView: some View {
        HStack {
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.blue)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.red)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.green)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.purple)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
        }
    }
    
    var obtainSuppliesInformation: some View {
        Text("Follow the EFLM\nrecommended\norder of draw")
            .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
            .multilineTextAlignment(.center)
    }
    
    var confirmButton: some View {
        Button {
            showPuncture = true
        } label: {
            Text("Confirm")
        }
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct ObtainSupplies_Previews: PreviewProvider {
    static var previews: some View {
        ObtainSupplies()
    }
}
