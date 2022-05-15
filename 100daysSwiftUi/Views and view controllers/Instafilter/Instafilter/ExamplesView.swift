//
//  ExamplesView.swift
//  Instafilter
//
//  Created by Andre Silva on 14/05/2022.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ExamplesView: View {
    @State private var blurAmount = 0.0
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        // Example 1
        //        VStack {
        //            Text("Hello, world!")
        //                .blur(radius: blurAmount)
        //
        //            Slider(value: $blurAmount, in: 1...20)
        //
        //            Button("Random Blur") {
        //                blurAmount = Double.random(in: 1...20)
        //            }
        //        }
        //        .onChange(of: blurAmount) { newValue in
        //            print("New value is \(newValue)")
        //        }
        
        // Example 2
        //        Text("Hello world")
        //            .frame(width: 300, height: 300)
        //            .background(backgroundColor)
        //            .onTapGesture {
        //                showingConfirmation = true
        //            }
        //            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
        //                Button("Red") { backgroundColor = .red }
        //                Button("Green") { backgroundColor = .green }
        //                Button("Blue") { backgroundColor = .blue }
        //                Button("Cancel", role: .cancel) { }
        //            } message: {
        //                Text("Select a new color")
        //            }
        
        // Example 3
        //        VStack {
        //            image?
        //                .resizable()
        //                .scaledToFit()
        //        }
        //        .onAppear(perform: loadImage)
        
        // Example 4
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
        
    }
    
    //    func loadImage() {
    //        guard let inputImage = UIImage(named: "Example") else { return }
    //
    //        let beginImage = CIImage(image: inputImage)
    //
    //        let context = CIContext()
    //        let currentFilter = CIFilter.pixellate()
    //        currentFilter.inputImage = beginImage
    //        currentFilter.scale = 100
    //
    //        guard let outputImage = currentFilter.outputImage else { return }
    //
    //        if let cgimage = context.createCGImage(outputImage, from: outputImage.extent) {
    //            let uiImage = UIImage(cgImage: cgimage)
    //            image = Image(uiImage: uiImage)
    //        }
    //    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimage)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
