//
//  ContentView.swift
//  2020_iOS_bonus2
//
//  Created by Hannn on 2020/4/18.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0
    @State private var number2 = 0
    @State private var showFriendView = false
    @State private var showSelfView = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                Text("奧樂雞今天要跟誰玩呢？")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(40)
                
                Image("main")
                    .frame(width: geometry.size.width-50)
                
                HStack (spacing: 50){
                    
                    Button(action: {self.showFriendView = true}) {
                        Text("跟朋友玩")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.yellow, lineWidth: 5))
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
                            self.number += 1
                        }
                    }
                    .sheet(isPresented: self.$showFriendView) {
                        FriendsView(number: self.number)
                    }
                    
                    Button(action: {self.showSelfView = true}) {
                        Text("自己玩")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.yellow, lineWidth: 5))
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
                            self.number2 += 1
                        }
                    }
                    .sheet(isPresented: self.$showSelfView) {
                        selfView(number: self.number2)
                    }
                }.frame(width: geometry.size.width-50)
            }
        }
            
        .background(Color(red:91/255, green:179/255, blue:199/255)
        .edgesIgnoringSafeArea(.all))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
