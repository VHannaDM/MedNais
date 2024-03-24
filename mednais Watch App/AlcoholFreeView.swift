//
//  AlcoholFreeView.swift
//  mednais Watch App
//
//  Created by VAITSIKHOUSKAYA on 07/02/2024.
//

import SwiftUI

struct AlcoholFreeView: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("ALCOHOL FREE")
                .bold()
            Text("alcohol free\nfor 24h")
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

struct AlcoholFreeView_Previews: PreviewProvider {
    static var previews: some View {
        AlcoholFreeView()
    }
}
