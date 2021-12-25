//
//  MenuView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/23/21.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("name") var name = ""
    @AppStorage("year") var year = ""
    
    var body: some View {
        
        VStack {
            HStack {
                
                ZStack {
                   
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        
                    Text("DH")
                        .foregroundColor(.blue)
                        .font(.system(size: 30, weight: .semibold, design: .default))
                    
                }

            }
            .padding(.top, 40)
            
            
            Spacer()
            
            Text((name).lowercased())
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .semibold))
                .padding(.top, 10)

            
            Text("year: \(year)")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .semibold))
                
                .padding(.bottom, 40)
            
            HStack {
                Spacer()
            }
            Spacer()
            
            Button(action: {
                
                // log out
                logout()
                
            }) {
                Text("log out")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    .background(
                    Rectangle()
                        .fill(Color.red)
                        .edgesIgnoringSafeArea(.bottom)
                    )
            }
        }
        .padding(.vertical, 30)
        .background(Color.blue)
        .padding(.trailing, 80)
        .edgesIgnoringSafeArea(.vertical)
    }
    
    func logout() {
        // reset defaults
        withAnimation {
            UserDefaults.standard.set("", forKey: "year")
            UserDefaults.standard.set("", forKey: "name")
            UserDefaults.standard.set("", forKey: "password")
            UserDefaults.standard.set("", forKey: "studentID")
            MenuViewModel.shared.isMenuOpen = false
        }
    
        
    }
}


