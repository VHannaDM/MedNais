//
//  ObtainSupplies.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 22/03/2024.
//

import SwiftUI

struct ObtainSupplies: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("OBTAIN\nSUPPLIES")
                .bold()
            Text("Follow the EFLM\nrecommended\norder of draw")
                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                .multilineTextAlignment(.center)
            NavigationStack {
                Button(action: {
                    isPresented = true
                }) {
                    Text("Confirm")
                }
                .background(Color.red)
                .cornerRadius(10)
                .navigationDestination(isPresented: $isPresented) {
                    Text("Details screen")
                }
            }
        }
    }
}

struct ObtainSupplies_Previews: PreviewProvider {
    static var previews: some View {
        ObtainSupplies()
    }
}
