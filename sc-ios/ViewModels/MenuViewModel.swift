//
//  MenuViewModel.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/23/21.
//

import Foundation
import SwiftUI


class MenuViewModel: ObservableObject {
    static var shared = MenuViewModel()
    @Published var isMenuOpen: Bool = false
}
