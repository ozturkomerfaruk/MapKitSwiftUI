//
//  LocationPreviewView.swift
//  SwiftUIMapApp
//
//  Created by Ömer Faruk Öztürk on 15.02.2023.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0) {
            VStack (alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack (spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 85)
            .cornerRadius(10))
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
