//
//  ContentView.swift
//  GuessTheDog
//
//  Created by Andy Huang on 8/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                ScoreHeader()
                    .padding()
                
                Spacer()
                
                // TODO: Implement AsyncImage here
                
                AsyncImage(url: URL(string: viewModel.imageURLString)){
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(gradient: Gradient(colors:[.blue, .pink]), startPoint: .top, endPoint: .bottom), lineWidth: 5)
                )
                .shadow(radius: 20)
                
                
                HintAndTextField()
                
                SubmitButton()
                
                Spacer()
                Spacer()
                Spacer()
                
                Text(viewModel.breed)
            }
        }
        .environmentObject(viewModel)
    }
}

struct ScoreHeader: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        HStack {
            Text("Streak: \(viewModel.currentStreak)")
            Spacer()
            Text("Best Streak: \(viewModel.bestStreak)")
        }
        .foregroundColor(.white)
    }
}

struct HintAndTextField: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Text(viewModel.generateHintString())
                .padding()
            
            TextField("Enter guess", text: $viewModel.guess)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 50)
                .onSubmit {
                    viewModel.tryGuess()
                }
        }
    }
}

struct SubmitButton: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.tryGuess()
        } label: {
            Text("Submit")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .alert("Wrong!", isPresented: $viewModel.showingAlert) {
            Button(role: .cancel) {
                viewModel.currentStreak = 0
                viewModel.fetchNewDog()
            } label: {
                Text("Try again")
            }
        } message: {
            Text("The answer is \(viewModel.breed)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
