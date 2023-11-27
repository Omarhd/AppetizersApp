//
//  AppetizerListView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerViewModel()
    @EnvironmentObject var order: CartViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    withAnimation {
                        AppetizerCell(appetizer: appetizer)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedAppetizer = appetizer
                                    viewModel.isShowingDetailsView = true
                                }
                            }
                            .contextMenu {
                                Button {
                                    order.add(appetizer)
                                } label: {
                                    Image(systemName: "plus")
                                        .resizable()
                                    
                                    Text("Add to Cart")
                                        .bold()
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
            
            if viewModel.isLoading {
                LoadingSkeletonView()
            }
        }
        
        .blur(radius: viewModel.isShowingDetailsView ? 20 : 0)
        .onAppear {
            //                viewModel.getAppetizers()
            viewModel.loads()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
        if viewModel.isShowingDetailsView {
            AppetizerDetilsView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetailsView)
        }
    }
}

#Preview {
    AppetizerListView()
}
