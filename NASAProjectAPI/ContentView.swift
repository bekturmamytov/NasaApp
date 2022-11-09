//
//  ContentView.swift
//  NASAProjectAPI
//
//  Created by Matthew Garlington on 10/30/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataManager = DataManager()
    var body: some View {
        VStack {
            Text(dataManager.nASAImage?.title ?? "")
                .font(.title)
                .bold()
            Text("Date: \(dataManager.nASAImage?.date ?? "")")
                .font(.title2)
                .bold()
            
            AsyncImage(url: dataManager.nASAImage?.url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .frame(width: 350, height: 350)
                .cornerRadius(25)
            
            
            Spacer()
        }
        .padding()
        .onAppear {
            dataManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
