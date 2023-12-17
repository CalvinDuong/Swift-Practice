//
//  ContentView.swift
//  checklist
//
//  Created by Andy Huang on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack {
            HeaderView(viewModel: viewModel)
            List {
                CheckListSectionView(sectionTitle: "In Progress", viewModel: viewModel)
                CheckListSectionView(sectionTitle: "Completed", viewModel: viewModel)
            }
        }
    }
}

struct CheckListSectionView: View {
    var sectionTitle: String
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Section(sectionTitle) {
            ForEach(sectionTitle == "In Progress" ? viewModel.inProgressList: viewModel.completedList, id: \.self) {
                todoName in
                Button(action: {
                    if (sectionTitle == "In Progress") {
                        viewModel.swapToComplete(task: todoName)
                    } else {
                        viewModel.swapToInProgress(task: todoName)
                    }
                }, label: {
                    if (sectionTitle == "Completed") {
                        HStack {
                            Image(systemName: "checkmark")
                            Text(todoName)
                        }
                    } else {
                        Text(todoName).foregroundColor(.primary)
                    }
                })
            }
        }
    }
}

struct HeaderView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image("oski")
                        .resizable()
                        .offset(x: 5)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle()
                            .stroke(Color.gray,
                                    lineWidth: 1))
                    Text("Oski the Bear")
                        .font(.title).bold()
                        .padding()
                }
                HStack {
                    TextField("Enter todo", text: $viewModel.todo)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        viewModel.add()
                    }, label: {
                        Text("Add")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                }
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
