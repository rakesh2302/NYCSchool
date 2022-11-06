//
//  SchoolView.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import SwiftUI
import CoreData
import Resolver

// MARK: Struct

/// This struct represent school data view
///
///  There are four state: idle, loading, failed and loaded.
struct SchoolView: View {

    // MARK: ObservedObject Properties

    @ObservedObject var viewModel: SchoolViewModel = Resolver.resolve()

    // MARK: Properties

    /// A view that displays School View idle / loading / error / loaded state
    ///
    /// There are idle, loading, loaded, failed state
    /// In idle state, call and get schools and score array
    /// In loading state, use ProgressView to show loading spinner
    /// In loaded state, setup SchoolListView and SchoolDetailView
    /// In error state, show error alert
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressSpinnerView(title: "Welcome NYC Schools...")
                .onAppear {
                    viewModel.getSchools()
                }
        case .loading:
            ProgressSpinnerView(title: "Loading NYC Schools...")
        case let .loaded(schools):
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(schools) { school in
                            let score = viewModel.scores.first { $0.dbn == school.dbn }
                            let imageName = ["School1", "School2"].shuffled().first ?? "School1"
                            NavigationLink {
                                SchoolDetailView(score: score,
                                                 school: school,
                                                 imageName: imageName)
                            } label: {
                                SchoolListView(school: school,
                                               imageName: imageName)
                            }
                            .foregroundColor(Color.black)
                        }
                        .padding(EdgeInsets(top: 10.0, leading: 20.0, bottom: 10.0, trailing: 20.0))
                        .navigationTitle("NYC Schools")
                    }
                }
                .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 244.0 / 255.0))
            }
            .navigationViewStyle(StackNavigationViewStyle())
        case let .failed(error):
            ErrorView(errorMessage: error.localizedDescription)
        }
    }
}

// MARK: Struct

/// This is to preview SchoolView without running project
///
///  Here viewmodel is in default idle state so there will be porgress view
struct SchoolView_Previews: PreviewProvider {

    // MARK: Static Properties

    static var previews: some View {
        SchoolView()
    }
}
