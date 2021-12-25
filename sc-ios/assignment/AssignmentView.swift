//
//  AssignmentView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/24/21.
//

import SwiftUI

struct AssignmentView: View {
    @Environment(\.colorScheme) var colorScheme
    let assignments: [Assignment]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(assignments, id: \.self) { assignment in
                    AssignmentCell(title: assignment.name, pointsPoss: assignment.pointsPossible, pointsScored: assignment.pointsScored)
                    
                    // divider
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            
                            Color(colorScheme == .dark ? .white : .black).opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1.5)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct AssignmentView_Previews: PreviewProvider {

    static var previews: some View {
        AssignmentView(assignments: [
            Assignment(name: "Chapter 18 Quiz", pointsPossible: "23", pointsScored: "21"),
            Assignment(name: "Chapter 17 Quiz", pointsPossible: "24", pointsScored: "21"),
            Assignment(name: "Chapter 16 Quiz", pointsPossible: "29", pointsScored: "21"),
            Assignment(name: "Chapter 15 Quiz", pointsPossible: "30", pointsScored: "30"),
        ])
    }
}
