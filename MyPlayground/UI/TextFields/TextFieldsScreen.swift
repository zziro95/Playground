//
//  TextFieldsScreen.swift
//  MyPlayground
//
//  Created by Jinho Choi on 2023/04/22.
//

import SwiftUI

//
struct TextFieldsScreen: View {

    @State private var text: String = ""

    @State private var date: Date = .init()

    var body: some View {
        VStack(spacing: 10) {
            TextField("Search...", text: $text)
                .textFieldStyle(SearchTextFieldStyleTest())

            TextField("Search...", text: $text)
                .textFieldStyle(SearchTextFieldStyle(backgroundColor: Color.orange))

            HStack(spacing: 0) {
                TextField("Search...", text: $text)
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .background(Color.blue)
            }.modifier(SearchTextFieldModifier())

            HStack(spacing: 10) {
                TextField("Search...", text: $text)
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .background(Color.blue)
            }.modifier(SearchTextFieldModifier(backgroundColor: .red))

            HStack {
                TextField("Search...", text: $text)

                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .foregroundColor(.white)
            }.modifier(customViewModifier(roundedCornes: 6, startColor: .orange, endColor: .purple, textColor: .blue))
                .padding()
        }
    }
}

struct TextFieldsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsScreen()
    }
}

/*
 1,2의 차이와 사용성
 1. 순수하게 TextField만 사용하고 Custom TextFieldStyle이 필요한 경우
 2. 아이콘과 같은 다른 뷰 요소와 TextField가 함께 묶여 표현되어야 경우
 */

/// [Reference](https://thehappyprogrammer.com/custom-textfield-in-swiftui)
struct customViewModifier: ViewModifier {

    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 10)
    }
}

