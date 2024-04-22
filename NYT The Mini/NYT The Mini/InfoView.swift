//
//  InfoView.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/19/24.
//

import SwiftUI

struct InfoView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE\nMMM d, yyyy"
        return formatter
    }()

    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Spacer()
                Text(Date(), formatter: dateFormatter)
                    .font(.title)
                    .padding(.bottom, 20)
                    .bold()
                    .multilineTextAlignment(.center)
                
                
                Text("By SANJANA GOPALSWAMY")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                
                Text("Edited by SANJANA GOPALSWAMY")
                    .font(.subheadline)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 50)
                
                Divider()
                Text("© 2024 The New York Times")
                    .font(.footnote)
                    .foregroundColor(.black)
                
            }
            .padding()
            .navigationBarTitle("Puzzle Info", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())


    }
}

//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView()
//    }
//}

#Preview {
    InfoView()
}
