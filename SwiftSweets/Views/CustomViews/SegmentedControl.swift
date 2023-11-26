//
//  SegmentedControl.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/26/23.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var tabSelection: TabSelection
    var body: some View {
        HStack {
            ForEach(TabSelection.allCases, id: \.self) { selection in
                ZStack {
                    Text(selection.rawValue)
                        .textCase(.uppercase)
                        .padding(.horizontal)
                        .font(.custom(tabSelection == selection  ? "PlayfairDisplay-Bold" : "PlayfairDisplay-Regular", size: 18))
                        .onTapGesture {
                            tabSelection = selection
                        }
                    Rectangle().stroke(lineWidth: 1.0)
                        .frame(width: 115, height: 1)
                        .offset(y: 20)
                        .foregroundStyle(tabSelection == selection ? Color.black : Color.clear)
                }
            }
        }
    }
}

#Preview {
    SegmentedControl(tabSelection: .constant(TabSelection.ingredients))
}
