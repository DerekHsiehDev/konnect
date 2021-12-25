//
//  LoginView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/22/21.
//

import SwiftUI


// json decoding

struct GetStudent: Decodable {
    let name: String
    let year: Int
}


struct LoginView: View {
    
    // user defaults
    @AppStorage("name") var name: String = ""
    @AppStorage("year") var year: String = ""
    
    @StateObject private var dataVM = DataViewModel()
    @State private var studentID: String = ""
    @State private var password: String = ""
    var body: some View {
        
        
        VStack {
            
            Image(systemName: "k.circle.fill")
                .font(.system(size: 150, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .padding()
                .padding()
            
            Text("welcome to konnect!")
                .font(.largeTitle)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                
            Text("student connect client")
                .font(.callout)
                .foregroundColor(.secondary)
                .fontWeight(.bold)
                
            
            VStack(spacing: 0) {
                if dataVM.isFetching {
                    ProgressView()
                }
                Text(dataVM.errorMessage)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .padding(dataVM.errorMessage == "" ? 0 : 10)
                
                CustomTextField(textLimit: 6, placeholder: "student id", imageString: "person", text: $studentID)
                CustomSecureTextField(password: $password)
                
                Button {
                    
                    login()
                   
                } label: {
                   RoundedRectangle(cornerRadius: 15)
                        .fill(Color.blue)
                        .frame(height: 50)
                        .overlay(
                            Text("login")
                                .bold()
                                .font(.headline)
                                .foregroundColor(.white)
                                
                            
                        )
                        .padding()
                        .padding(.top)
                }

            }
            .padding(.horizontal)
           
     

        }
        
    }
    
    private func login() {
        dataVM.fetch(studentID: self.studentID, password: self.password) { isSuccessful in
            if isSuccessful {
                withAnimation {
                    name = (dataVM.student?.student.name)!
                    year = (dataVM.student?.student.year)!
                    UserDefaults.standard.set(self.password, forKey: "password")
                    UserDefaults.standard.set(self.studentID, forKey: "studentID")
                }
          
            }
        }
    }
    

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
