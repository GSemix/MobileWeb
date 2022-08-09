//
//  ContentView.swift
//  3DMap
//
//  Created by Семен Безгин on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel() // @ObservedObject
    @State var isLoaderVisible = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                WebNavigationView(viewModel: viewModel)
//                WebView(type: .local, url: "Site/local", viewModel: viewModel)
//                WebView(type: .public, url: "https://go.2gis.com/csytr", viewModel: viewModel)
                WebView(type: .local, url: "Site/index", viewModel: viewModel)
                
            }
            .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                self.isLoaderVisible = value
            }
            
            if isLoaderVisible {
                LoaderView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
