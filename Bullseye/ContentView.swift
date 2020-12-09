//
//  ContentView.swift
//  Bullseye
//
//  Created by Ularbek Abdyrazakov on 02.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score: Int = 0
    @State var roundnum: Int = 1
    @State var startOver = false
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LableView: ViewModifier{
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.white)
                .font(Font.custom("AvenirNext-DemiBoldItalic", size: 18))
                .modifier(Arial())
        }
    }
    
    struct valueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.yellow)
                .font(Font.custom("AvenirNext-DemiBoldItalic", size: 24))
                .modifier(Arial())
        }
    }
   
    
    struct Arial: ViewModifier{
        func body(content: Content) -> some View {
            content.shadow(color: Color.black, radius: 5,x: 2, y: 2 )
        }
    }
    
    struct buttonSmallstyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.black)
                .font(Font.custom("AvenirNext-DemiBoldItalic", size: 12))
             
        }
    }
    struct buttonBigstyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.black)
                .font(Font.custom("AvenirNext-DemiBoldItalic", size: 18))
             
        }
    }
    
var body: some View {
    
      
        VStack {
            //Target row
            HStack {
                Text("Put the bullseye as close as you can do:").modifier(LableView())
                Text("\(self.target)").modifier(valueStyle())
               
                    
            }
            Spacer()

            //Slider row
            
            HStack{
                Text("1")
                    .modifier(LableView())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(.green)
                Text("100")
                    .modifier(LableView())
                
            }
            Spacer()

            //Buttow row
            Button(action: {
                    print("Button pressed!")
                self.alertIsVisible = true
                
            }) {
                Text("Hit me!")
            }
            
            .alert(isPresented: $alertIsVisible, content: {
               
                
                return Alert(title: Text(alertTitle()),
                             message: Text("The slider's value is \(roundedSliderValue()).\n" + "You scored \(self.pointsForCurrentRound()) points this round."),
                             dismissButton: .default(Text("Awesome")){
                                    self.score = self.score + pointsForCurrentRound()
                                    self.roundnum += 1
                                    self.target = Int.random(in: 1...100)
                                })
            })
            .background(Image("Button")).modifier(buttonBigstyle())
            Spacer()

                //Score row
            HStack{
                Button(action: {
                    self.starrtOver()
                }) {
                    HStack{
                    Image("StartOverIcon")
                    Text("Start over")
                    }
                    
                }
                .background(Image("Button")).modifier(buttonSmallstyle())
                
                Spacer()
                Text("Score:").modifier(LableView())
                Text("\(score)").modifier(valueStyle())
                Spacer()
                Text("Round:").modifier(LableView())
                Text("\(roundnum)").modifier(valueStyle())
                Spacer()

                
                NavigationLink(destination: AboutView()) {
                    
                    HStack{
                        Image("InfoIcon")
                        Text("Info")
                    }
                    
                }
                .background(Image("Button")).modifier(buttonSmallstyle())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
     
    func roundedSliderValue() -> Int {
        return Int(self.sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int{
        let difference: Int = abs(self.target - roundedSliderValue())
        var awardedPoints: Int = 100 - difference
        if difference == 0 {
            awardedPoints += 100
        }
        else if difference == 1 {
            awardedPoints += 50
        }
        
        
        return awardedPoints
    }
    
    func alertTitle() -> String{
        let difference: Int = abs(self.target - roundedSliderValue())
        var title:String
        if difference == 0 {
            title = "Perfect!"
        }
        else if difference < 5{
            title = "Good,almost done!"
        }
        else{
            title = "Not even close!"
        }
        return title
    }
    func starrtOver(){
        self.score = 0
        self.roundnum = 1
        self.sliderValue = 50.0
        self.target = Int.random(in: 1...100)
        
    }
    
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 812, height: 375))
    }
}
