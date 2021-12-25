//
//  AssignmentsView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/24/21.
//

import SwiftUI

struct ClassView: View {
    let color: Color
    
    let classData: Classes
    let period: String
    let className: String
    
    init(color: Color, classData: Classes) {
        self.classData = classData
        self.color = color
        
        
        // sanitize period string
        let string = classData.period
        self.period = String(string.prefix(6))
        let newStr = string.dropFirst(7).lowercased()


        let characters = Array(newStr)


        var counter = 0
        for character in characters {
            if character == "(" {
                break
            }
            counter += 1
        }

        self.className = String(newStr.prefix(counter))
    }
    
    var body: some View {
        
        
        VStack {
            VStack {
                HStack {
                    Text(className)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                    Spacer()
                    
                    Text(period.lowercased())
                        .font(.title3)
                        .fontWeight(.light)
                    
                }
                .padding(.bottom)
                
                HStack {
                    Text(classData.teacherName.lowercased())
                        .font(.title3)
                        .fontWeight(.light)
                    Spacer()
                    
                    
                    Text(classData.currentPercentage)
                        .font(.title3)
                        .bold()
                    
                    Text(classData.currentGrade)
                        .font(.title2)
                        .bold()
                    
                  
                }
                
                
            }
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
            )
        }
        .padding()
    }
    
    
    

}

struct ClassView_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            ClassView(color: Color.myRed, classData: Classes(period: "Per: 1 IB HIST OF AMER HL 1A (942003)", currentGrade: "A-", currentPercentage: "94.2%", teacherName: "Zierer, Milissa", assignmentCount: 51) )
                
        }
        .padding()
        
    }
}
