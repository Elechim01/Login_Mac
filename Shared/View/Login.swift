//
//  Login.swift
//  Login_Mac
//
//  Created by Michele Manniello on 17/02/21.
//

import SwiftUI

struct Login: View {
//    getting screen frame...
    var screen = NSScreen.main?.visibleFrame
//    Email and password TextFiels...
    @State var email = ""
    @State var password = ""
//    Keep Logged
    @State var keepLogged = false
//    Alert
    @State var alert = false
    
    var body: some View {
        HStack(spacing:0){
            VStack {
                Spacer(minLength: 0)
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
//                Google Login...
                Button(action: {}, label: {
                    HStack{
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        Spacer(minLength: 0)
                        Text("Log in with Google")
                            .foregroundColor(.black)
                        Spacer(minLength: 0)
                    }
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.white)
//                    Shadow
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical)
                HStack{
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                    Text("OR")
                        .foregroundColor(.gray)
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                }
                Group{
//                    Email
                    TextField("Email",text:$email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
//                    Border
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7),lineWidth: 1))
//                    Password
                    SecureField("Password",text:$password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
//                    Border
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7),lineWidth: 1))
                        .padding(.vertical)
//               Keep Login And Forget Password...
                    HStack{
                        Toggle("",isOn: $keepLogged)
                            .labelsHidden()
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Keep Logged In")
                            .foregroundColor(.black)
                        Spacer(minLength: 0)
                        Button(action: {}, label: {
                            Text("Forget Password")
                                .foregroundColor(.black)
//                            Under Line
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
//                    Loding Button
                    Button(action: {
                        alert.toggle()
                    }, label: {
                        HStack{
                            Spacer()
                            
                            Text("Login")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top)
//                    SignUP
                    HStack{
                        Text("Don't have account yet?")
                            .foregroundColor(.gray)
                        Button(action: {}, label: {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top,10)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal,50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            
            VStack{
                Spacer()
//                Welcome Image
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                moving image slightly outside...
                    .padding(.leading,-35)
                Spacer()
            }
//            half of the width
            .frame(width: (screen!.width / 1.8) / 2)
            .background(Color.white)
        }
        .ignoresSafeArea(.all,edges: .all)
        .frame(width: screen!.width / 1.8, height: screen!.height - 100)
//        always Light Mode
        .preferredColorScheme(.light)
        .alert(isPresented: $alert, content: {
            Alert(title: Text("Message"), message: Text("Logged Succefully"), dismissButton: .destructive(Text("OK")))
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
