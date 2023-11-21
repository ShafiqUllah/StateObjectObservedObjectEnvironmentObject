//
//  ContentView.swift
//  StateObjObservedObjEnvironmentObjDemo
//
//  Created by Shafiq  Ullah on 11/20/23.
//

//https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject
//https://www.avanderlee.com/swiftui/stateobject-observedobject-differences/

import SwiftUI


class DemoViewModel: ObservableObject{
    
    @Published var count = 0
    
    func increase(){
        count += 1
    }
    
}

//This is secendary view/ child view
struct ContentView: View {
    /*
     any views that watch an @StateObject will refresh their body when the object changes.
     */
    @ObservedObject var viewModel = DemoViewModel()
//    @StateObject var viewModel = DemoViewModel()
    
    
    var body: some View {
        Text("Count value is \(viewModel.count)")
            .padding()
        
        Button("Increase "){
            viewModel.increase()
        }
        
        
    }
}

// This is main view/ parent view
struct SecondView: View {
    @State var randomNumber  = 0
    
    var body: some View{
        VStack{
            Text("Random number is \(randomNumber)")
            Button("Random Number"){
                randomNumber = (0..<100).randomElement()!
            }
        }
        
        /*
         Observed objects marked with the @StateObject property wrapper don’t get destroyed and
         re-instantiated at times their containing view struct redraws.
         */
        
        /*
         It’s unsafe to create an @ObservedObject inside a view since SwiftUI might create or recreate a view at any time.
         Unless you inject the @ObservedObject as a dependency, you want to use the @StateObject wrapper to ensure consistent
         results after a view redraw.
         */
        
        /*
         The rule is this: whichever view is the first to create your object must use @StateObject, to tell SwiftUI it is the owner of the data and is responsible for keeping it alive. All other views must use @ObservedObject, to tell SwiftUI they want to watch the object for changes but don’t own it directly.
         */
        ContentView()
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
