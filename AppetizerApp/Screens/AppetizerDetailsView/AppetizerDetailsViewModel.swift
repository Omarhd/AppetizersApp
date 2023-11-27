//
//  AppetizerDetailsViewModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 27/11/2023.
//

import SwiftUI

final class AppetizerDetailsViewModel: ObservableObject {
    
    let appetizer: Appetizer
    @Published var isShowingDetail: Binding<Bool>

    init(appetizer: Appetizer, isShowingDetail: Binding<Bool>) {
        self.appetizer = appetizer
        self.isShowingDetail = isShowingDetail
    }
}
