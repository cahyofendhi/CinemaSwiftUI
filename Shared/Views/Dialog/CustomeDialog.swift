//
//  CustomeDialog.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 24/01/22.
//

import SwiftUI
import Combine

public struct CustomeDialog<DialogContent: View>: ViewModifier {
    @Binding var isShowing: Bool
    let cancelOnTapOutside: Bool
    let cancelAction: (() -> Void)?
    let dialogContent: DialogContent
    
    public init(isShowing: Binding<Bool>,
                cancelOnTapOutside: Bool,
                cancelAction: (() -> Void)?,
                @ViewBuilder dialogContent: () -> DialogContent) {
        _isShowing = isShowing
        self.cancelOnTapOutside = cancelOnTapOutside
        self.cancelAction = cancelAction
        self.dialogContent = dialogContent()
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.1))
                    .onTapGesture {
                        if cancelOnTapOutside {
                            cancelAction?()
                            isShowing = false
                        }
                    }
                ZStack {
                    dialogContent
                        .background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white))
                }.padding(40)
                .transition(AnyTransition.scale(scale: 0.8).combined(with: .opacity))
            }
        }
    }
}

public extension View {
    func customeDialog<DialogContent: View>(isShowing: Binding<Bool>,
                                            cancelOnTapOutside: Bool = true,
                                            cancelAction: (() -> Void)? = nil,
                                            @ViewBuilder dialogContent: @escaping () -> DialogContent) -> some View {
        self.modifier(CustomeDialog(isShowing: isShowing,
                                    cancelOnTapOutside: cancelOnTapOutside,
                                    cancelAction: cancelAction,
                                    dialogContent: dialogContent))
    }
    
    func showMessage(_ isShowing: Binding<Bool>, _ title: String, _ message: String) {
        self.customeDialog(isShowing: isShowing) {
            VStack {
                Text(title)
                    .fontWeight(.bold)
                Text(message)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
    }
    
}
