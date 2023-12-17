//
//  ViewModel.swift
//  GuessTheDog
//
//  Created by Andy Huang on 8/12/23.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var imageURLString: String = "" // url of the dog image
    @Published var breed: String = "" // breed of the dog displayed (the hidden answer)
    @Published var currentStreak: Int = 0 // current streak
    @Published var bestStreak: Int = 0 // longest streak
    @Published var guess: String = "" // the user's current guess
    @Published var showingAlert: Bool = false // will toggle alert to popup if true
    
    init() {
        self.fetchNewDog()
    }
    
    /*
     Fetches an image of a new dog from the dog API via GET request.
     */
    func fetchRandomDogImage() {
        // TODO: Implement
        let urlString: String = "https://dog.ceo/api/breeds/image/random"
        guard let url: URL = URL(string:urlString) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let fetchRandomDogImageTask = URLSession.shared.dataTask(with: request){
            data, response, error in
            
            //Check if there is an error
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            //Get and check the HTTP Response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else{
                print("Bad http response code")
                return
            }
            let decoder = JSONDecoder()
            
            //Unrap the data
            
            guard let data = data else {
                print("Theres no data")
                return
            }
            
            //Deocde data into RandomDogImage
            guard let result = try? decoder.decode(RandomDogImage.self, from : data) else{
                print("Error decoding data")
                return
            }
            
            guard let fetchedImageUrl : String = result.message else {
                print("Ain't got image url")
                return
            }
            
            
            DispatchQueue.main.async{
                self.imageURLString = fetchedImageUrl
                self.breed = self.parseImageURLForBreed(imageURL: fetchedImageUrl).lowercased()
            }
        }
        fetchRandomDogImageTask.resume()
    }
    /*
     Resets dog related parameters and fetches a new dog.
     */
    func fetchNewDog() {
        // TODO: Implement
        DispatchQueue.main.async{
            self.guess = ""
            self.imageURLString = ""
            self.fetchRandomDogImage()
        }
    }
    
    /*
     Triggers alert if user guesses incorrectly, otherwise update scores and fetch a new dog.
     */
    func tryGuess() {
        // TODO: Implement
        if self.breed == ""{
            return
        }
        
        if self.guess.lowercased() != self.breed {
            self.showingAlert = true
            }
            else {
                self.currentStreak += 1
                self.bestStreak = max(self.currentStreak, self.bestStreak)
                self.fetchNewDog()
            }
        }
    }
