//
//  DataManager.swift
//  NASAProjectAPI
//
//  Created by Matthew Garlington on 10/30/22.
//

import Foundation
import Combine


class DataManager: ObservableObject {
    @Published var nASAImage: NASAImage? = nil
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=02Kg5wT7XqvVYQvpP0VS6uwboGF7xrzbCw8wI02x")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: NASAImage.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { image in
                self.nASAImage = image 
            }
            .store(in: &cancellables)
    }
}
