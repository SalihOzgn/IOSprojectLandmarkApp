//
//  PageView.swift
//  Landmarks
//
//  Created by Salih Özgen on 15.11.2023.
//

import SwiftUI


struct PageView<Page: View>: View {
    var pages: [Page]


    var body: some View {
        PageViewController(pages: pages)
    }
}


#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
        .aspectRatio(3 / 2, contentMode: .fit)
}
