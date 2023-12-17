//
//  q3.swift
//  CoinToss
//
//  Created by Andy Huang on 8/13/23.
//

import SwiftUI

struct q3: View {
    @State var faces: [String] = ["heads", "tails"]
    @State var face: String = "heads"
    @State var rotation: CGFloat = 0.0
    @State var offset_y: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text(face)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .background(Color.brown)
                .clipShape(Circle())
                // TODO: Add 3D rotation and offset modifiers.
                .rotation3DEffect(Angle(degrees: rotation), axis: (x:1.0, y:0.0, z:0.0))
                .offset(x:0, y: offset_y)
                .onTapGesture {
                    face = ""
                    
                    // TODO: Implement two explicit animations below.
                    withAnimation(.easeOut(duration: 1)){
                        rotation += 1080.0
                        offset_y = -300.0
                    }
                    
                    withAnimation(.easeIn(duration: 1).delay(1)){
                        rotation += 1080.0
                        offset_y = 0
                    }
                    
                    // Do not modify code below.
                    Task {
                        try await Task.sleep(nanoseconds: 1_900_000_000)
                        face = faces.randomElement()!
                    }
                }
        }
    }
}

struct q3_Previews: PreviewProvider {
    static var previews: some View {
        q3()
    }
}
