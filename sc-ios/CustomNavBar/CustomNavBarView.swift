//
//  CustomNavBarView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/21/21.
//

import SwiftUI

struct CustomNavBarView: View {
    @StateObject var menuVM = MenuViewModel.shared
    @Environment(\.presentationMode) var presentationMode
    let  showBackButton: Bool
    let title: String
    let subtitle: String?
    let color: Color
    let showSignOutButton: Bool
    
    var body: some View {
        HStack {
            if showBackButton {
                
                backButton
            }
            
            if showBackButton {
                Spacer()
            }
            
            titleSection
            Spacer()
            
            
            if showBackButton {
                
                backButton
                    .opacity(0)
            } else {
                signOutButton
            }
            
        }
        .padding()
        .accentColor(.white)
        
        .foregroundColor(.white)
        .font(.headline)
        .background(
            color
                .ignoresSafeArea(edges: [.top, .leading, .trailing])
                .frame(maxWidth: .infinity)
        )
    }
}

//struct CustomNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            CustomNavBarView(showBackButton: false, title: "grades", subtitle: nil, color: Color.blue, showSignOutButton: true)
//            Spacer()
//        }
//    }
//}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
    
    private var signOutButton: some View {
        Button {
            // sign out logic here
            
            print("open menu")
            
            
            withAnimation(.default) {
                menuVM.isMenuOpen.toggle()
            }
            
            
        } label: {
            
            if menuVM.isMenuOpen {
                Circle()
                    .fill(Color.white)
                    .frame(width: 40, height: 40, alignment: .center)
                
                    .padding()
                
                    .overlay(
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .padding()
                        
                        
                    )
                
            } else {
                Circle()
                    .fill(Color.white)
                    .frame(width: 40, height: 40, alignment: .center)
                
                    .padding()
                
                    .overlay(
                        
                        Text("DH")
                            .foregroundColor(Color.blue)
                            .padding()
                        
                        
                    )
                
            }
            
            
            
            
            //                .padding()
            //                .clipShape(Circle().fill(Color.white))
            
        }
        
    }
}
