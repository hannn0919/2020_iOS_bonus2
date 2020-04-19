//
//  selfView.swift
//  2020_iOS_bonus2
//
//  Created by Hannn on 2020/4/19.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI

struct selfView: View {
    @State private var picTime = Date()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyyMM"
        return dateFormatter
    }()
    
    var year: Int {
        Calendar.current.component(.year, from: picTime)
    }
    
    var number: Int
    let today: Date = Date()
    @State private var picNum: Int = 2015
    @State private var autoPlay2: Bool = true
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            
            Toggle("自動播放", isOn: $autoPlay2)
            
            GeometryReader { geometry in
                Image("\(self.autoPlay2 ? (self.number % 6) + 2015 : self.year )")
                    .resizable()
                    .scaledToFit()
                    .border(Color.white, width: 5)
                    .frame(width: geometry.size.width-50)
            }
            .frame(height: 450)
            
            
            DatePicker("", selection: $picTime, in: dateFormatter.date(from: "201501")! ... today, displayedComponents: .date)
                .padding()
                .labelsHidden()
            
        }
        
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 255/255, green: 221/255, blue: 51/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1.3))
        .edgesIgnoringSafeArea(.all))
    }
}
