//
//  AppetizerListView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerListView: View {
   
    @StateObject private var viewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                if viewModel.isLoading {
                    VStack {
                        ForEach(0..<5) { _ in
                            AppetizerSkeletonView()
                                .padding(.vertical, 8)
                        }
                    }
                    .padding(.horizontal, 16)
                } else {
                    List(viewModel.appetizers) { appetizer in
                        withAnimation {
                            AppetizerCell(appetizer: appetizer)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.selectedAppetizer = appetizer
                                        viewModel.isShowingDetailsView = true
                                    }
                                }
                                .contextMenu {
                                    Button("Add to Cart") {
                                        // Handle adding to favorites
                                    }

                                    Button("Share") {
                                        // Handle sharing
                                    }
                                }
                        }
                    }
                    .listStyle(.inset)
                    .navigationTitle("🥘 Appetizers")
                    .transition(.opacity)
                    .disabled(viewModel.isShowingDetailsView)
                }
            }
            
            .blur(radius: viewModel.isShowingDetailsView ? 20 : 0)
            .onAppear {
                viewModel.getAppetizers()
            }
            
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            
            if viewModel.isShowingDetailsView {
                AppetizerDetilsView(appetizer: viewModel.selectedAppetizer!, isShowingDetailsView: $viewModel.isShowingDetailsView)
            }
    
        }
    }
}

#Preview {
    AppetizerListView()
}
