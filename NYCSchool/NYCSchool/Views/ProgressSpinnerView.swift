//
//  ProgressView.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/5/22.
//

import SwiftUI

struct ProgressSpinnerView: View {
    var title: String

    var body: some View {
        ZStack {
            Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 244.0 / 255.0).edgesIgnoringSafeArea(.all)

            ProgressView(title)
                .foregroundColor(Color.black)
                .tint(Color.orange)
                .background(Color.clear)
                .font(.headline)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ProgressSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSpinnerView(title: "Welcome")
    }
}
