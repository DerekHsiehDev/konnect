//
//  CustomNavBarPreferenceKeys.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/21/21.
//

import Foundation

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarSubtitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
    
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

struct CustomNavBarColorPreferenceKey: PreferenceKey {
    static var defaultValue: Color = Color.blue
    
    static func reduce(value: inout Color, nextValue: () -> Color) {
        value = nextValue()
    }
}

struct CustomNavBarSignOutButtonPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


extension View {
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationBarColor(_ color: Color) -> some View {
       preference(key: CustomNavBarColorPreferenceKey.self, value: color)
    }
    
    func customNavigationBarSignOutButton(_ isShowing: Bool) -> some View {
        preference(key: CustomNavBarSignOutButtonPreferenceKey.self, value: isShowing)
    }
    
        
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false, color: Color = Color.blue) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
            .customNavigationBarColor(color)
    }
}
