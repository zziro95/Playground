//
//  SearchTextFieldStyle.swift
//  MyPlayground
//
//  Created by Jinho Choi on 2023/04/22.
//

import SwiftUI

// 방법 1. TextFieldStyle 생성

// 재사용성을 고려하지 않은 케이스
// 패딩, 색상등 각 값들이 변경될 때마다 스타일을 만들어줘야함
struct SearchTextFieldStyleTest: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.gray)
            .cornerRadius(20)
    }
}

// 패딩, 색상등 각 값들의 변경을 원할때 설정해 줄 수 있음
struct SearchTextFieldStyle: TextFieldStyle {

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

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}
