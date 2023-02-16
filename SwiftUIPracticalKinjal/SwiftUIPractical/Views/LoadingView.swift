//
//  LoadingView.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 11/02/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            ProgressView()
            .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
