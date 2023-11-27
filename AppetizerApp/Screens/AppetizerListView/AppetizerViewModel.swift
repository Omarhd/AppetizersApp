//
//  AppetizerViewModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = true
    @Published var faildToLoad: Bool = false

    @Published var isShowingDetailsView: Bool = false

    // Assuming you have an asynchronous function that can call the request method
    func loads() {
        Task {
            do {
                appetizers = try await NetworkManager.shared.requestAsync(path: "appetizers", method: .get)
                isLoading = false
                faildToLoad = false
                // Handle the result
                print("results = \(appetizers)")
            } catch {
                // Handle the error
                self.alertItem = AlertContext.invalidData
                isLoading = false
                faildToLoad = true
            }
        }
    }

    func getAppetizers() {
        isLoading = true
        faildToLoad = false
        NetworkManager.shared.request(path: "appetizers", method: .get) { (result: Result<AppetizerResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers.request
                    self.isLoading = false
                    self.faildToLoad = false
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .noData:
                        self.alertItem = AlertContext.invalidData
                    case .decodingError:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        print("")
                        self.alertItem = AlertContext.unableToComplete
                    }
                    print("Error fetching post: \(error)")
                }
            }
        }
        isLoading = false
        faildToLoad = false
    }
    
    func loadImage(path: String) {
        NetworkManager.shared.downloadImage(fromURLString: path) { image in
            switch image {
            case .none:
                print("no images")
            case .some(_):
                print("hellloo")
            }
        }
    }
    
}
