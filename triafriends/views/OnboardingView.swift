//
//  OnboardingView.swift
//  OnboardingScreenEN
//
//  Created by Farukh IQBAL on 14/03/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    
    
    @State var currentPageIndex = 0
    @State private var current: Int? = 0
    var body: some View {
        if current == 0 {
            VStack {
    //            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
    //                .frame(height: 300)
                Image("assets")
                    .resizable()
                       //will it distort an image?
                    .frame(width: 200, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(1, contentMode: .fit)
                    //Mask it round
                HStack{
                    Text("Triafriends")
                        .padding(.leading,32)
                        .font(.custom(nameExtraBold, size: 32))
                    Spacer()
                }
                HStack{
                    Image("realtime")
                        .resizable()
                           //will it distort an image?
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //                    .padding(.horizontal)
                        .aspectRatio(1, contentMode: .fit)
                        //Mask it round
                    VStack(alignment: .leading){
                        HStack{
                            Text("Fast Triage")
                            .font(Font.custom(nameExtraBold, size: 20))
                        Spacer()
                        }
                        HStack{
                            Text("Do triage process faster than usual")
                            .font(.custom(nameExtraBold, size: 16))
                            .foregroundColor(colorTextGray)
    //                    Spacer()
    //                    }
    //                    HStack{
    //                        Text(accountData.phone )
    //                        .font(.custom(nameRegular, size: 12))
    //                        .foregroundColor(colorTextGray)
    //                        Spacer()
    //                    }
                           
                            
                    }
                    
                }.padding(.horizontal)
                .padding(.vertical, 20)
     
              
                }.padding(.leading,32)
                //accurate
                HStack{
                    Image("digital")
                        .resizable()
                           //will it distort an image?
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //                    .padding(.horizontal)
                        .aspectRatio(1, contentMode: .fit)
                        //Mask it round
                    VStack(alignment: .leading){
                        HStack{
                            Text("Accurrate Triage")
                            .font(Font.custom(nameExtraBold, size: 20))
                        Spacer()
                        }
                        HStack{
                            Text("Get the result more accurate")
                            .font(.custom(nameExtraBold, size: 16))
                            .foregroundColor(colorTextGray)
    //                    Spacer()
    //                    }
    //                    HStack{
    //                        Text(accountData.phone )
    //                        .font(.custom(nameRegular, size: 12))
    //                        .foregroundColor(colorTextGray)
    //                        Spacer()
    //                    }
                           
                            
                    }
                    
                }.padding(.horizontal)
                .padding(.vertical, 20)
     
              
                }.padding(.leading,32)
                //history
                HStack{
                    Image("history")
                        .resizable()
                           //will it distort an image?
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //                    .padding(.horizontal)
                        .aspectRatio(1, contentMode: .fit)
                        //Mask it round
                    VStack(alignment: .leading){
                        HStack{
                            Text("History Record")
                            .font(Font.custom(nameExtraBold, size: 20))
                        Spacer()
                        }
                        HStack{
                            Text("Record all your patient data")
                            .font(.custom(nameExtraBold, size: 16))
                            .foregroundColor(colorTextGray)
    //                    Spacer()
    //                    }
    //                    HStack{
    //                        Text(accountData.phone )
    //                        .font(.custom(nameRegular, size: 12))
    //                        .foregroundColor(colorTextGray)
    //                        Spacer()
    //                    }
                           
                            
                    }
                    
                }.padding(.horizontal)
                .padding(.vertical, 20)
     
              
                }.padding(.leading,32)
                HStack {
        //                PageControl(numberOfpages: subviews.count, currentPageIndex: $currentPageIndex)
        //                Spacer()
                    
                   
                    Button(action: {
                             LoginView()
                            self.current = 1
                            Print("habiss")
                      
                    }) {
                        HStack {
                            
                            //                                       .accessibility(label: Text("Sign in with Google"))
                            Spacer()
                            Text("Get Started").font(.title3)
                                .foregroundColor(.white).bold()
                            Spacer()
                        }
                        
                    }  .padding()
                    
                    .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
                    .cornerRadius(20)
                    .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
                    .frame(width: UIScreen.main.bounds.width-60, height: 60)
                    .padding(23)
                }
                .padding()
        }
        }else{
            LoginView()
        }
        
       
    }
}

struct ButtonContent: View {
    var body: some View {
        Image(systemName: "arrow.right")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.black)
            .cornerRadius(30)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
