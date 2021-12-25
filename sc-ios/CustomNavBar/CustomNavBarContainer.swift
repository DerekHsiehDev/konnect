//
//  CustomNavBarContainer.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/21/21.
//


import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    @State private var color: Color = Color.blue
    @State private var showSignOutButton: Bool = false


    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle, color: color, showSignOutButton: true)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarSignOutButtonPreferenceKey.self, perform: { value in
            self.showSignOutButton = value
        })
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
        
        .onPreferenceChange(CustomNavBarColorPreferenceKey.self) { value in
            self.color = value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, world!")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubtitle("subtitle")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}

