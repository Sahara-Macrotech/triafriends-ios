//
//  Profile.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 02/11/20.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct Profile: View {
    
    //TODO : UNSAFE. ADD GUARD
    let userID = Auth.auth().currentUser?.uid
    var dummyUID = "t7SQhXlozrMnWOghRaXHh4HWuUC3"
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Profile")
                    .font(.custom(nameExtraBold, size: 24))
                Spacer()
            }
            
            HStack{
                Image("2")
                    //Mask it round
                VStack{
                    HStack{
                    Text("dr. Abil Wijaya")
                        .font(Font.custom(nameExtraBold, size: 18))
                    Spacer()
                    }
                    HStack{
                    Text("abilwijaya@gmail.com")
                        .font(.custom(nameRegular, size: 12))
                        .foregroundColor(colorTextGray)
                    Spacer()
                    }
                    HStack{
                    Text("081310883036")
                        .font(.custom(nameRegular, size: 12))
                        .foregroundColor(colorTextGray)
                        Spacer()
                    }
                       
                        
                }
                
            }
            HStack{
                Text("General")
                    .font(.custom(nameBold, size: 18))
                Spacer()
            }
            
            HStack{
                Text("Setting")
                    .font(.custom(nameBold, size: 18))
                Spacer()
            }
            VStack{
                
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(colorLightGray)
                        .cornerRadius(radius)
                    ZStack{
                        HStack{
                            Text("Notification")
                                .padding()
                                .font(.custom(nameSemiBold, size: 14))
                            Spacer()
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(colorLightGray)
                        .cornerRadius(radius)
                    ZStack{
                        HStack{
                            Text("Account Privacy")
                                .font(.custom(nameSemiBold, size: 14))
                                .padding()
                            Spacer()
                            
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            
            ZStack{
                Rectangle()
                    .frame(width: 336, height: 57, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(radius)
                    .foregroundColor(colorLightPurple)
                Text("Log Out")
                    .font(.custom(nameBold, size: 15))
                
                
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
