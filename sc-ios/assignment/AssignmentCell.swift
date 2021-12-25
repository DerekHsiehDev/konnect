//
//  AssignmentCell.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/24/21.
//

import SwiftUI

struct AssignmentCell: View {
    let title: String
    let pointsPoss: Double
    let pointsScored: Double
    
    let percentage: Double
    
    init(title: String, pointsPoss: String, pointsScored: String) {
        self.title = title
        self.pointsPoss = Double(pointsPoss) ?? 0.0
        self.pointsScored = Double(pointsScored) ?? 0.0
        
        self.percentage = ((Double(pointsScored) ?? 0)/(Double(pointsPoss) ?? 0) * 100)
        
        
    }
    var body: some View {
        
        HStack {
            Text((title).lowercased())
                .font(.title2)
                .bold()
            
            Spacer()
            VStack {
                Text((String(format: "%.0f", self.percentage)) + "%")
                    .font(.title3)
                    .bold()
                
                Text("\(   (checkIfIsDouble(double: self.pointsScored) ? String(format: "%.1f", self.pointsScored) : String(format: "%.0f", self.pointsScored)))/\(      (checkIfIsDouble(double: self.pointsPoss) ? String(format: "%.1f", self.pointsPoss) : String(format: "%.0f", self.pointsPoss)))")
                
                
                
                
            }
            
            // 21/23
        }
        .padding()
        
    }
    
    func checkIfIsDouble(double: Double) -> Bool {
        let int = Int(double)
        
        if (double - Double(int)).isZero {
            return false
        } else {
            return true
        }
    }
}

struct AssignmentCell_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentCell(title: "chapter 18 quiz", pointsPoss: "23", pointsScored: "21")
            .previewLayout(.sizeThatFits)
    }
}
