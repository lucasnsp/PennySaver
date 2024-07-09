//
//  OnboardingItem.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 09/07/24.
//

import SwiftUI
import Lottie

struct OnboardingItem: Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init()
}
