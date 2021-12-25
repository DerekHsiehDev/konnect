//
//  Fetchdata.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/22/21.
//

import Foundation



class DataViewModel: ObservableObject {
    @Published var isFetching = false
    
    @Published var student: All? = nil
    @Published var errorMessage = ""
    
    
    func fetch(studentID: String, password: String, _ completion: @escaping (_ isSuccessful: Bool) -> ()) {
        DispatchQueue.main.async {
            self.isFetching = true
        }
        
        // dummmy url string bc student connect is down
        let urlString = "https://stud-konnect.herokuapp.com/dummy/data/" + studentID + "/" + password
//        let urlString = "http://localhost:3000/get-all/" + studentID + "/" + password
        print(urlString)
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data,error == nil else {
                completion(false)
                return

            }
            
            do {
                let student = try JSONDecoder().decode(All.self, from: data)
                // do json
                
                DispatchQueue.main.async {
                    self?.isFetching = false
                    self?.student = student
                    self?.errorMessage = ""
                    print(student.classes)
                    completion(true)
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = "login failed. please check id or password"
                    self?.isFetching = false
                    completion(false)
                }
                print(error)
            }
        }
        task.resume()
    }
    
    func returnAssignmentArrayForSpecificClass(period: Int) -> [Assignment] {
        let index = period - 1
        var numOfAssignments = student?.classes[index].assignmentCount ?? 0
        var assignmentArray: [Assignment] = []
        var numOfAssignmentsBefore = 0
        var currentAssignmentCount = 0
        // get prev assignment counts
        
        var i = 0;
        while(i < index) {
            numOfAssignmentsBefore += student?.classes[i].assignmentCount ?? 0
            i += 1
        }
        
        for assignment in student!.assignments {
            if numOfAssignmentsBefore == 0 && numOfAssignments > 0 {
                // go
                assignmentArray.append(assignment)
                currentAssignmentCount += 1
                numOfAssignments -= 1
            } else if numOfAssignments == 0 {
                break
            } else {
                numOfAssignmentsBefore -= 1
            }
   
        }
        
        return assignmentArray
    }
    
}
