//
//  Landmarklist.swift
//  Landmarks
//
//  Created by Salih Özgen on 11.11.2023.
//

import SwiftUI

struct Landmarklist: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                    
                    /*
                     LandmarkRow(landmark: landmarks[0])
                     LandmarkRow(landmark: landmarks[1])
                     */
                }
            }
            .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a landmark")
        }
            
    }
}

#Preview {
    Landmarklist()
        .environment(ModelData())
}
