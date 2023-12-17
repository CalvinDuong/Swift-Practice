//
//  q4.swift
//  CoinToss
//
//  Created by Andy Huang on 8/13/23.
//

import SwiftUI

struct q4: View {
    @State var toggle_wifi = false
    @State var scale_y: CGFloat = 6.0
    var body: some View {
        HStack {
            // TODO: YOUR CODE HERE
        }
        .onTapGesture {
            // TODO: YOUR CODE HERE
            
            Task {
                try await Task.sleep(nanoseconds: 1_500_000_000)
                withAnimation(.easeIn) {
                    toggle_wifi.toggle()
                }
            }
        }
    }
}

struct q4_Previews: PreviewProvider {
    static var previews: some View {
        q4()
    }
}
