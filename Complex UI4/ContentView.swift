//
//  ContentView.swift
//  Complex UI4
//
//  Created by Mahesh Prasad on 14/08/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var width = UIScreen.main.bounds.width
    
    //though were going to change content onClick so it must be in @state for dynamic changes...
    
    @State var data = [
        
        DataType(name: "Breaking Banana", price: "$5/Dozen", content: "Bananas are high in potassium and contain goog levels of protien and dietary fiber.One medium-sized banana contains 422 milligrams of potassium.", calories: "89", expand: ["0.3 g","23 g","1.1 g"],color: Color("ban"),image: "ban"),
        
        DataType(name: "Amazing Avacado", price: "$25/Kg", content: "Avocodo contributes nearly 20 vitamins and minerals,making it a great nutrient-dense food choice.It also contains heart-healthy monounsaturated fat - good dat! ", calories: "160", expand: ["15 g","9 g","2 g"],color: Color("ava"),image: "ava"),
        
        DataType(name: "Seductive Strawberry", price: "$100/Kg", content: "They're an excellent source of vitamin C and manganese and also contain decent amounts of folate(vitamin B9) and potassium.", calories: "33", expand: ["0.3 g","8 g","0.7 g"],color: Color("sta"),image: "sta")
    ]
    
    @State var index = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        HStack(spacing: 10) {
                            Image("back")
                                .renderingMode(.original)
                            
                            Text("Back")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("bag")
                            .renderingMode(.original)
                    }
                }
                .padding()
                
                HStack{
                    Button(action: {
                        if self.index != 0 {
                            self.index -= 1
                        }
                    }) {
                        Image("left")
                            .renderingMode(.original)
                    }
                    .opacity(self.index != 0 ? 1 : 0.5)
                    .disabled(self.index != 0 ? false : true)
                    
                    
                    Image(self.data[self.index].image)
                    
                    Button(action: {
                        if self.index != self.data.count - 1 {
                            self.index += 1
                        }
                    }) {
                        Image("right")
                            .renderingMode(.original)
                    }
                    .opacity(self.index != self.data.count - 1 ? 1 : 0.5)
                    .disabled(self.index != self.data.count - 1 ? false : true)
                    
                    
                }
                .padding(.top, 50)
                
                VStack(spacing: 20) {
                    
                    Text(self.data[self.index].name)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text(self.data[self.index].price)
                        .fontWeight(.bold)
                    
                    Text(self.data[self.index].content)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Text("Nutrition Value")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack{
                        Image(systemName: "flame.fill")
                            .resizable()
                            .frame(width: 25, height: 35)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(self.data[self.index].calories)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            Text("Calories")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                        }
                        .padding(.leading, 20)
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    
                    HStack {
                        VStack(alignment: .center, spacing: 10) {
                            
                            Text(self.data[self.index].expand[0])
                                .fontWeight(.bold)
                            
                            Text("Fat")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 10) {
                            Text(self.data[self.index].expand[1])
                                .fontWeight(.bold)
                            
                            Text("Carbohydrade")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 10) {
                            Text(self.data[self.index].expand[2])
                                .fontWeight(.bold)
                            
                            Text("Protien")
                                .foregroundColor(.gray)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: self.width - 50)
                        .background(Color.purple)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 25)
            }
            .zIndex(1)
            
            //now going to create top curve....
            //follow me....
            
            Circle()
                .fill(self.data[self.index].color)
                .frame(width: self.width + 200, height: self.width + 200)
                .padding(.horizontal, -100)
                
                //moving view up ...
                .offset(y: -self.width)
            
        }
        .animation(.default)
        
    }
}


struct DataType {
    var name : String
    var price : String
    var content : String
    var calories : String
    var expand : [String]
    var color : Color
    var image : String
}


