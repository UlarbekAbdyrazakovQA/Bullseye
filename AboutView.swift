//
//  AboutView.swift
//  Bullseye
//
//  Created by Ularbek Abdyrazakov on 09.10.2020.
//

import SwiftUI

struct AboutView: View {
    
    let backgr = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct aboutTextPage: ViewModifier{
        func body(content: Content) -> some View {
            content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.top, 20)
        }
    }
    
    struct aboutHeadingPage: ViewModifier{
        func body(content: Content) -> some View {
            content
                .foregroundColor(.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.bottom, 20)
                .padding(.top, 20)
        }
    }
    
    
    var body: some View {
        Group{
        VStack{
            Text("🎯The Bullseye🎯").modifier(aboutHeadingPage())
            Text("This is the bullseye, the game where you can win the points and earn fame by dragging a slider").modifier(aboutTextPage()).lineLimit(nil)
            Text("Your goal is place the slider as close to the target value as you can. The closer you are the morepoints you will earn").modifier(aboutTextPage()).lineLimit(nil)
            Text("Enjoy!").modifier(aboutTextPage())
        }
        .navigationBarTitle("About Bullseye")
        .background(backgr)
        }.background(Image("Background"))
   }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 812, height: 375))
    }
}
