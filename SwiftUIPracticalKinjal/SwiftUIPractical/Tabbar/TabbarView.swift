//
//  TabbarView.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import SwiftUI

struct TabbarView: View {
    let tabBarImagesNmaes = ["multiply.circle.fill","heart"]
    @State var selectedIndex: Int
    var onClickedAtIndex: ((Int) -> Void)?

    var body: some View {
        VStack {
            Divider()
            HStack {
                ForEach(0..<tabBarImagesNmaes.count) { i in
                    Button {
                        selectedIndex = i
                        onClickedAtIndex?(selectedIndex)
                    } label: {
                        Spacer()
                        
                        let fontsize:CGFloat = i == 2 ? 44 : 24
                        let color = i == 2 ?  Color.red : selectedIndex == i ? Color.black : Color.gray.opacity(0.4)
                        
                        Image(systemName: tabBarImagesNmaes[i]).font(.system(size: fontsize, weight: .bold)).foregroundColor(color)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedIndex: 0)
    }
}
