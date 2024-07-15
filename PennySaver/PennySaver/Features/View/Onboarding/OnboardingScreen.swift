//
//  OnboardingScreen.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 09/07/24.
//

import SwiftUI

struct OnboardingScreen: View {
    // MARK: OnBoarding Slides Model Data
    @State var onboardingItems: [OnboardingItem] = [
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

    // MARK: Current Slide Index
    @State var currentIndex: Int = 0
    var body: some View {
        GeometryReader{
            let size = $0.size

            TabView(selection: $currentIndex) {
                ForEach($onboardingItems) { $item in
                    let isLastSlide = (currentIndex == onboardingItems.count - 1 && currentIndex == indexOf(item))
                    VStack{
                        VStack(spacing: 15){
                            // MARK: Resizable Lottie View
                            ResizableLottieView(onboardingItem: $item)
                                .frame(height: size.width)
                                .onAppear {
                                    // MARK: Intially Playing First Slide Animation
                                    if currentIndex == indexOf(item){
                                        item.lottieView.play(toProgress: 1.0)
                                    }
                                }

                            Text(item.title)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)

                            Text(item.subTitle)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal,15)
                                .foregroundColor(.gray)
                        }
                        .padding(.top,50)

                        Spacer(minLength: 0)

                        // MARK: Next / App Button
                        VStack(spacing: 15){
                            Text(isLastSlide ? "Ir para o app" : "Continuar")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,isLastSlide ? 13 : 12)
                                .frame(maxWidth: .infinity)
                                .background {
                                    Capsule()
                                        .fill(appTint)
                                }
                                .padding(.horizontal,isLastSlide ? 30 : 100)
                                .onTapGesture {
                                    // MARK: Updating to Next Index
                                    if currentIndex < onboardingItems.count - 1 {
                                        // MARK: Pausing Previous Animation
                                        let currentProgress = onboardingItems[currentIndex].lottieView.currentProgress
                                        onboardingItems[currentIndex].lottieView.currentProgress = (currentProgress == 0 ? 0.7 : currentProgress)
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            currentIndex += 1
                                        }
                                        // MARK: Playing Next Animation from Start
                                        playAnimation()
                                    } else {
                                        print("DO LOGIN ACTION")
                                    }
                                }

                            HStack{
                                Text("Termos de Serviço")

                                Text("Política de Privacidade")
                            }
                            .font(.caption2)
                            .underline(true, color: .primary)
                            .offset(y: 5)
                        }
                    }
                    .animation(.easeInOut, value: isLastSlide)
                    .padding(15)
                    .tag(indexOf(item))
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .top, content: {
                // MARK: Top Nav Bar
                HStack{
                    Button("Voltar"){
                        if currentIndex > 0{
                            withAnimation(.easeInOut(duration: 0.5)) {
                                currentIndex -= 1
                            }
                            playAnimation()
                        }
                    }
                    .opacity(currentIndex > 0 ? 1 : 0)

                    Spacer(minLength: 0)

                    Button("Pular"){
                        withAnimation(.easeInOut(duration: 0.5)) {
                            currentIndex = onboardingItems.count - 1
                        }
                        playAnimation()
                    }
                    .opacity(currentIndex == onboardingItems.count - 1 ? 0 : 1)
                }
                .animation(.easeInOut, value: currentIndex)
                .tint(appTint)
                .fontWeight(.bold)
                .padding(15)
            })
            .onChange(of: currentIndex) { newValue in
                for index in onboardingItems.indices {
                    if index == currentIndex {
                        playAnimation()
                    } else {
                        onboardingItems[index].lottieView.pause()
                    }
                }
            }
        }
    }

    func playAnimation(){
        onboardingItems[currentIndex].lottieView.currentProgress = 0.0
        onboardingItems[currentIndex].lottieView.play(toProgress: 0.7)
    }

    // MARK: Retreving Index of the Item in the Array
    func indexOf(_ item: OnboardingItem)->Int{
        if let index = onboardingItems.firstIndex(of: item){
            return index
        }
        return 0
    }
}

#Preview {
    OnboardingScreen()
}
