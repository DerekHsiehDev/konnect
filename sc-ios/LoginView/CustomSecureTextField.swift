//
//  CustomSecureTextField.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/22/21.
//

import SwiftUI

struct CustomSecureTextField: View {
    @Binding var password: String
    @State private var isHidden: Bool = true
    
    // animation propertiesi
    @State var isTapped = false
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15) {
                    
                    
                    ZStack {
                                            
                        SecureField("", text: $password) {
                            if password == "" {
                                
                                withAnimation(.easeOut) {
                                    isTapped = false
                                }
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeIn ) {
                                isTapped = true
                            }
                        }
                        .opacity(isHidden ? 1 : 0)
                        
                        TextField("", text: $password) { status in
                            // runs when textfield is clicked
                            if status {
                                withAnimation(.easeIn ) {
                                    isTapped = true
                                }
                                
                            }
                        } onCommit: {
                            // runs when return button is pressed
                            if password == "" {
                                
                                withAnimation(.easeOut) {
                                    isTapped = false
                                }
                            }
                        }
                        .opacity(isHidden ? 0 : 1)
                        
                        
                        
                    }
              
                    
                    
                    
                    Button {
                        isHidden.toggle()
                    } label: {
                        Image(systemName: isHidden ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text("password")
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                        .foregroundColor(isTapped ? .accentColor : .gray)
                    , alignment: .leading
                )
                
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .cornerRadius(15)
            })
                .padding(.vertical, 12)
                .padding(.horizontal)
            
                .background(Color.gray.opacity(0.09))
                .cornerRadius(8)
            
            
            
            
            // test
        }
        .padding()
    }
}

