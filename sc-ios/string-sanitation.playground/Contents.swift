import UIKit

var string = "Per: 1 IB HIST OF AMER HL 1A (942003)"

// split apart per: 1 and ib hist of amer hl...
//let period = string.prefix(6)
var newStr = string.dropFirst(7).lowercased()


let characters = Array(newStr)


var counter = 0
for character in characters {
    if character == "(" {
        break
    }
    counter += 1
}

let className = newStr.prefix(counter)

//
//for(char in characters) {
//    if char == "(" {
//        print("end")
//    }
//
//}


let period = 1
let index = period - 1
let numOfAssignments = 32
//var assignmentArray = []
var numOfAssignmentsBefore = 0
// get prev assignment counts

let classes = [32,34,100]
var i = 0;
while(i < index) {
    numOfAssignmentsBefore += classes[i]
    i += 1
}

let double = 1.1
let int = Int(double)

if (double - Double(int)).isZero {
    print("is int")
} else {
    print("is double")
}
