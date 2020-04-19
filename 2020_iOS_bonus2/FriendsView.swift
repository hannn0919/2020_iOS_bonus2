//
//  FriendsView.swift
//  2020_iOS_bonus2
//
//  Created by Hannn on 2020/4/18.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI

struct FriendsView: View {
    
    var number: Int
    @State private var picNum: CGFloat = 0
    @State private var autoPlay: Bool = true
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            
            Toggle("自動播放", isOn: $autoPlay)
            
            picView(picNum: autoPlay ? number % 15 : Int(picNum))
            
            Slider(value: $picNum, in: 0...CGFloat(datas.count-1), step: 1)
                .accentColor(.orange)
            
        }
            
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 255/255, green: 221/255, blue: 51/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1.3))
        .edgesIgnoringSafeArea(.all))
    }
}

struct picView: View {
    var picNum: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Image(datas[self.picNum].img)
                    .resizable()
                    .scaledToFit()
                    .border(Color.white, width: 5)
                    .frame(width: geometry.size.width-50, height: 450)
                
                
                Text(datas[self.picNum].description)
                    .frame(width: geometry.size.width-50)
            }
        }
        .frame(height: 650)
    }
}
