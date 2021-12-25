//
//  CustomTextField.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/22/21.
//

import SwiftUI
import Combine

struct CustomTextField: View {
    
    let textLimit: Int?
    let placeholder: String
    let imageString: String
    @Binding var text: String
    
    // animation propertiesi
    @State var isTapped = false
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15) {
                    
                    
                    
                    TextField("", text: $text) { status in
                        // runs when textfield is clicked
                        if status {
                            withAnimation(.easeIn ) {
                                isTapped = true
                            }
                            
                        }
                    } onCommit: {
                        // runs when return button is pressed
                        if text == "" {
                            
                            withAnimation(.easeOut) {
                                isTapped = false
                            }
                        }
                    }
                    .onReceive(Just(text)) { _ in
                        if let textLimit = textLimit {
                            limitText(textLimit)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: imageString)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.top, isTapped ? 15 : 0)
                .background(
                    Text(placeholder)
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
            
            // text count
            
            if textLimit != nil {
                
                HStack {
                    Spacer()
                    Text("\(text.count)/" + String(textLimit!))
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.trailing)
                        .padding(.top, 4)
                }
            }
            
            // test
        }
        .padding()
    }
    
    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
    
}

