//
//  SearchTextFieldModifier.swift
//  MyPlayground
//
//  Created by Jinho Choi on 2023/04/22.
//

import SwiftUI

// 방법 2. ViewModifier 적용

struct SearchTextFieldModifier: ViewModifier {

    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat

    init(verticalPadding: CGFloat = 10,
         horizontalPadding: CGFloat = 16,
         backgroundColor: Color = Color.gray,
         cornerRadius: CGFloat = 20) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }

    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}
