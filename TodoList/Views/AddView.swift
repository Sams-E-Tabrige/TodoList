//
//  AddView.swift
//  TodoList
//
//  Created by Sams Tabrige on 8/7/23.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.green)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
    }
    
    func saveButtonPressed() {
        
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
