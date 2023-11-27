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
    @Published var isShowingDetailsView: Bool = false

    // Assuming you have an asynchronous function that can call the request method
    func loads() {
        Task {
            do {
                let respnose: AppetizerResponse = try await NetworkManager.shared.requestAsync(path: "appetizers", method: .get)
                appetizers = respnose.request
                isLoading = false
                print("results = \(respnose)")
            } catch {
                // Handle the error
                isLoading = false
                if let appError = error as? NetworkError {
                    switch appError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    
                    case .noData:
                        alertItem = AlertContext.invalidData

                    case .decodingError:
                        alertItem = AlertContext.decodingError

                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete

                    }
                }
            }
        }
    }

    func getAppetizers() {
        NetworkManager.shared.request(path: "appetizers", method: .get) { (result: Result<AppetizerResponse, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers.request
                    self.isLoading = false
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .noData:
                        self.alertItem = AlertContext.invalidData
                    case .decodingError:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                    print("Error fetching post: \(error)")
                }
            }
        }
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
