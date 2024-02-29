//
//  ContentView.swift
//  Memorize
//
//  Created by dylan on 2/28/24.
//
// 한 함수가 20줄 넘지 않게 ( 12줄 권장 )

import SwiftUI

// 2).
// View = Lego
// ContentView Lego is built with combinations of other '~'Lego.
// Lego란 결국 다른 레고들의 특정 방식을 이용한 조합
struct ContentView: View {
    var body: some View { // 2). has to be any struct in the world that behaves like a 'View' => 그니까 그 View protocol을 conform 하는 그 struct가 뭔데? => { } 안을 돌려서 => 어떤 스트럭트인지 안다면 => 바로 그거야!
//        ZStack(content: {
//            //~~~~~~~~~~~~~~~~~~~~~~~~~~
//            RoundedRectangle(cornerRadius: 12)
//                .foregroundColor(.white)
//            RoundedRectangle(cornerRadius: 12)
//                .strokeBorder(lineWidth: 2)
//            Text("🙏🏻")
//                .font(.largeTitle)
//                .imageScale(.small) // free function for View conformers
            
            // ~~~~~~~~~~~~~~~~~~~~~~~~~
            // 3). Post process: take a list of struct that behaves like a 'View' => package it up into 'TupleView' => so { } is a 'function' that returns the 'TupleView' of 2 View-structs.
            // TupleView = it's a bag of View - View
            // So it's nothing on its own but it functions as 'argument'
            
            // a bag of lego View를 반환하는 함수에 대해서는
            // 1). 조건문
            // 2). 구성뷰 나열
            // 3). 함수내 지역 변수 선언만 가능하다
            
            // @ViewBuilder
            // list of Views with conditionals and local variables를 후처리하여 a TupleView로 반환하는 역할을 한다.
//        })
        // 4). VStack은 하나의 인자를 받는데 그것은 TupleView를 반환하는 함수이다. VStack은 a-bag-of-View에 있는 :View struct들을 배치하여 만들어지는 :View sturct이다.
        
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

/* 1).
 functional progamming
 : object 'behaves' like 'sth'
 : (-) : satisfy conditions from the protocol
 : (+) : get all the 'functionality' that it entails.
 <-> OOP: Data Encapsulation
 : 함수가 객체로서 자유롭게 돌아다님
 */

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body :some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🥰")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
        .foregroundStyle(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
