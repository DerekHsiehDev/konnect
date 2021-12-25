//
//  AppNavBarView.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/21/21.
//

import SwiftUI

struct AppNavBarView: View {
    @StateObject var menuVM = MenuViewModel.shared
    @StateObject var dataVM = DataViewModel()
    @AppStorage("password") var pass = ""
    @AppStorage("studentID") var studentID = ""
    
    
    let colors: [Color] = [
        Color.myRed,
        Color.myGreen,
        Color.myBlue,
        Color.myPuple,
        Color.myOrange,
        Color.myBlack
        
    ]
    
    var body: some View {
        
        ZStack {
            CustomNavView {
                ZStack {
                    ZStack {
                        
                        ScrollView {
                            if dataVM.student?.classes != nil {
                                LazyVStack(spacing: 8) {
                                    
                                    ForEach(0..<dataVM.student!.classes.count) { i in
                                        
                                        CustomNavLink(destination:

                                                        AssignmentView(assignments: dataVM.returnAssignmentArrayForSpecificClass(period: i+1))
                                                      
                                            .customNavigationBarSignOutButton(false)
                                                        .customNavigationTitle(dataVM.student!.classes[i].period.sanitizeClassName())
                                                        .customNavigationSubtitle(dataVM.student!.classes[i].teacherName.lowercased())
                                                        .customNavigationBarColor(colors[i])
                                                      
                                        ){
                                            ClassView(color: colors[i], classData: dataVM.student!.classes[i])
                                        }
                                        
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                        
                        //                    CustomNavLink(destination:      Text("destination")
                        //                                    .customNavigationBarSignOutButton(false)
                        //                                    .customNavigationTitle("hist of the americas")
                        //                                    .customNavigationSubtitle("zierer, melissa")
                        //                                    .customNavigationBarColor(Color.green)
                        //                                  )
                        //                    {
                        //                        Text("navigate")
                        //                    }
                    }
                    .customNavBarItems(title: "grades", subtitle: nil, backButtonHidden: true, color: Color.blue)
                    .customNavigationBarSignOutButton(true)
                    
                    if menuVM.isMenuOpen {
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                if menuVM.isMenuOpen {
                                    withAnimation {
                                        menuVM.isMenuOpen.toggle()
                                    }
                                
                                }
                        }
                    }
                  
                }
            }
            
            MenuView()
                .offset(x: menuVM.isMenuOpen ? 0 : -UIScreen.main.bounds.width)
            
            //                .rotation3DEffect(Angle(degrees: menuVM.isMenuOpen ? 0 : 45), axis: (x: 0, y: 20, z: 0))
                .onTapGesture {
                    withAnimation(.default) {
                        self.menuVM.isMenuOpen.toggle()
                    }
                    
                }
        }
        .onAppear {
            dataVM.fetch(studentID: studentID, password: pass) { isSuccessful in
                print("finished fetching")
            }
        }
    }
}


struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(destination: Text("destination")
                                .navigationTitle("title 2")
                                .navigationBarHidden(false)
                               , label: {
                    Text("navigate")
                })
            }
            .navigationTitle("nav title here")
        }
    }
}
