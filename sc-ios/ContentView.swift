//
//  ContentView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/18/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("name") var name: String = ""
  
    var body: some View {
//        AppNavBarView
        
        if name != "" {
            AppNavBarView()
            
        } else {
            LoginView()
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
