//
//  ChangingValueView.swift
//  StateObjObservedObjEnvironmentObjDemo
//
//  Created by Shafiq  Ullah on 11/20/23.
//

import SwiftUI

struct ChangingValueView: View {
    
    @EnvironmentObject var viewModel:DataExample
    
    var body: some View {
        Button("Increase Value"){
            viewModel.count += 1
        }
    }
}

struct ChangingValueView_Previews: PreviewProvider {
    static var previews: some View {
        ChangingValueView().environmentObject(DataExample())
    }
}
