//
//  SwiftUIView.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/22/24.
//

import SwiftUI

struct WonView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Congratulations!")
                    .font(.title)
                    .bold()
                
                Text("You solved the Mini in")
            }
        }
    }
}

#Preview {
    WonView()
}
