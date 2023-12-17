//
//  q1.swift
//  CoinToss
//
//  Created by Andy Huang on 8/13/23.
//

import SwiftUI

struct q1: View {
    // Degree of rotation of the circle.
    @State var rotation = 0.0
    // Color of the circle.
    @State var color = Color.green
    
    var body: some View {
        Button("Click Me!") {
            // TODO: Implement State Change Logic
            
            rotation += 360.0
            
            if color == Color.green{
                color = Color.red
            } else {
                color = Color.green
            }
        }
        // TODO: Implement Button Modifiers
        .frame(width: 200, height: 200)
        .background(color)
        .animation(.default, value:color)
        .clipShape(Circle())
        .rotation3DEffect(Angle(degrees: rotation), axis: (x:0.0, y:1.0, z:0.0))
        .animation(.interpolatingSpring(stiffness: 30, damping:5), value: rotation)
        }
    }

struct q1_Previews: PreviewProvider {
    static var previews: some View {
        q1()
    }
}
