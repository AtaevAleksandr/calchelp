//
//  SwiftUIView.swift
//  CalcHelper
//
//  Created by Ataev Aleksandr on 14.12.2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var isShow: Bool = true
    
    var body: some View {
        ProgressView()
            .fullScreenCover(isPresented: $isShow) {
                TabBarView()
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
