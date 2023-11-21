//
//  EnvirViewDemo.swift
//  StateObjObservedObjEnvironmentObjDemo
//
//  Created by Shafiq  Ullah on 11/20/23.
//

import SwiftUI

class DataExample : ObservableObject{
    @Published var text = "Counter"
    @Published var count = 0
}

struct EnvirViewDemo: View {
    @StateObject var viewModel = DataExample()
    
    
    var body: some View {
        VStack{
            Text("\(viewModel.text) = \(viewModel.count)")
            EnvieView2()
            ChangingValueView()
        }.environmentObject(viewModel)
    }
}

struct EnvirViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnvirViewDemo()
    }
}
