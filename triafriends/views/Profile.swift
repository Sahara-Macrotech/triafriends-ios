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
    var accountData = AccountData()
    
    @State private var isShowPhotoLibrary = false
    @State var image = UIImage()
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    }
    
    @ObservedObject var profilePicture = ProfilePicture()
    
    var body: some View {
        
        VStack{
            VStack{
            HStack{
                Text("Profile")
                    .padding(.horizontal)
                    .font(.custom(nameExtraBold, size: 24))
                Spacer()
            }
            
            HStack{
                if let images = profilePicture.profpic {
                    Image(uiImage: images)
                        .resizable()
                           //will it distort an image?
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .aspectRatio(1, contentMode: .fit)
                        .rotationEffect(.degrees(90.0))
                        .onTapGesture(perform: {
                            self.isShowPhotoLibrary = true
                        })
                } else {
                    Image("2")
                        .resizable()
                           //will it distort an image?
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture(perform: {
                            self.isShowPhotoLibrary = true
                        })
                }
                    //Mask it round
                VStack{
                    HStack{
                        Text(accountData.username)
                        .font(Font.custom(nameExtraBold, size: 18))
                    Spacer()
                    }
                    HStack{
                        Text(accountData.email )
                        .font(.custom(nameRegular, size: 12))
                        .foregroundColor(colorTextGray)
                    Spacer()
                    }
                    HStack{
                        Text(accountData.phone )
                        .font(.custom(nameRegular, size: 12))
                        .foregroundColor(colorTextGray)
                        Spacer()
                    }
                       
                        
                }.padding(.horizontal)
                
            }.padding(.horizontal)
            .padding(.vertical, 20)
            HStack{
                Text("General")
                    .font(.custom(nameBold, size: 18))
                    .padding(.horizontal)
                Spacer()
            }
            VStack{
                
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(colorLightGray)
                        .cornerRadius(radius)
                    ZStack{
                        HStack{
                           
                            Text("Terms & Conditions")
                                .padding()
                                .font(.custom(nameSemiBold, size: 14))
                           
                            Spacer()
                            Image(systemName: "lock")
                                .font(.custom(nameBold, size: 14))
                                .padding(.horizontal, 7)
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(colorLightGray)
                        .cornerRadius(radius)
                    ZStack{
                        HStack{
                           
                            Text("Privacy Policy")
                                .font(.custom(nameSemiBold, size: 14))
                                .padding()
                            
                            Spacer()
                            Image(systemName: "lock")
                                .font(.custom(nameBold, size: 14))
                                .padding(.horizontal, 7)
                            
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                ZStack{
                    
                    
                    Rectangle()
                        .foregroundColor(colorLightGray)
                        .cornerRadius(radius)
                    ZStack{
                        HStack{
                           
                            Text("Rate Our App")
                                .font(.custom(nameSemiBold, size: 14))
                                .padding()
                            
                          
                            Spacer()
                            Image(systemName: "lock")
                                .font(.custom(nameBold, size: 14))
                                .padding(.horizontal, 7)
                            
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            
            HStack{
                Text("Setting")
                    .padding(.horizontal)
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
                            Image(systemName: "lock")
                                .font(.custom(nameBold, size: 14))
                                .padding(.horizontal, 7)
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
                            Image(systemName: "lock")
                                .font(.custom(nameBold, size: 14))
                                .padding(.horizontal, 7)
                            
                        }
                    }
                    
                }.frame(width: 350, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            }
            Spacer()
            ZStack{
                Rectangle()
                    .frame(width: 336, height: 57, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(radius + 14)
                    .foregroundColor(colorLightPurple)
                Text("Log Out")
                    .font(.custom(nameBold, size: 15))
                   
                
                
            }.padding()
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
        .onChange(of: image, perform: { value in
            profilePicture.profpic = image
        })
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
