//
//  videoDetailView.swift
//  Project03(IOS App)
//
//  Created by Sarfaroz on 3/7/22.
//

import SwiftUI

struct VideoDetailView: View {
    var video: Video
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .cornerRadius(10)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 4)
            
            HStack(spacing: 40) {
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Video upload date: \(video.uploadDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                StandardButton(title: "Proceed!")
            })
        }
    }
}

struct videoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen.first!)
    }
}



struct StandardButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .background(Color(.systemRed))
            .cornerRadius(20)
    }
}
