//
//  EnvieView2.swift
//  StateObjObservedObjEnvironmentObjDemo
//
//  Created by Shafiq  Ullah on 11/20/23.
//

import SwiftUI

struct EnvieView2: View {
    
    @EnvironmentObject var viewModel : DataExample
    
    var body: some View {
        Text("Second view \(viewModel.text) = \(viewModel.count)")
    }
}

struct EnvieView2_Previews: PreviewProvider {
    static var previews: some View {
        EnvieView2().environmentObject(DataExample())
    }
}
