//
//  SwiftUIView.swift
//  RickAndMorty
//
//  Created by Данила on 21.08.2023.
//

import SwiftUI

struct MySwiftUIView: View {
    var body: some View {
        NavigationView {
            Text("This is a SwiftUI View")
                .font(.title)
                .navigationBarTitle("SwiftUI View", displayMode: .inline)
        }
    }
}
