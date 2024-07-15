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

// MARK: Onboarding Slides Model Data
struct OnboardingData {
    static let items: [OnboardingItem] = [
        .init(title: "Organize Sua Vida Financeira",
              subTitle: "Nosso aplicativo permite gerenciar suas receitas e despesas de forma simples e eficiente. Ideal para experts e iniciantes, ele oferece a estrutura e a facilidade necessárias para atingir seus objetivos financeiros.",
              lottieView: .init(name: "track2",bundle: .main)),
        .init(title: "Controle Suas Finanças com Facilidade",
              subTitle: "Utilize nosso gráfico interativo para acompanhar receitas e despesas, filtrando gastos antigos para uma análise clara e eficiente. Oferecemos a transparência e o controle que você precisa para gerenciar suas finanças com confiança.",
              lottieView: .init(name: "graphs",bundle: .main)),
        .init(title: "Segurança e Privacidade Garantidas",
              subTitle: "Nosso aplicativo protege suas finanças com a segurança do Face ID da Apple, garantindo que apenas você tenha acesso às suas informações.",
              lottieView: .init(name: "faceid",bundle: .main))
    ]
}
