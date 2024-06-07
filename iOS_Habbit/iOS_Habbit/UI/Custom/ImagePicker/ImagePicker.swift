//
//  ImagePicker.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/2/24.
//

import SwiftUI
import UIKit

//struct ImagePicker: UIViewControllerRepresentable {
//    @Environment(\.presentationMode) private var presentationMode
//    @Binding var selectedImage: UIImage?
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImagePicker
//
//        init(parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.selectedImage = uiImage
//            }
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .photoLibrary // 앨범에서 가져오도록 설정
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//}
