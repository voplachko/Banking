//
//  SuccessView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.08.2024.
//

//  SuccessView.swift
//  Banking
//
//  Created by Всеволод Оплачко on 10.08.2024.
//

import SwiftUI
import Lottie

struct SuccessView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var transaction: Transaction
    
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    @State private var animation: LottieAnimation?
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            VStack {
                if let animation = animation {
                    LottieView(animation: animation, loopMode: .playOnce)
                        .frame(width: 300, height: 300)
                }
            }
            .onAppear {
                loadLottieAnimation(from: "https://lottie.host/60b6b5ab-aa70-4ace-a179-5a020e8acf9c/t78IYb2avz.json")
            }
                    
            Text("Transaction Successful!")
                .font(.custom("Poppins", size: 24))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                    
            Text("You have sent \(transaction.amount, specifier: "%.2f") \(transaction.currency.rawValue) to \(transaction.recipientsOfMoney.map { $0.name }.joined(separator: ", "))")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                    
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                        .font(.custom("Poppins", size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
            
            Spacer()
            }
            .padding(.horizontal, 20)
            .background(Color.bankingPrimary)
    }
    
    func loadLottieAnimation(from url: String) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let animation = try LottieAnimation.from(data: data)
                DispatchQueue.main.async {
                    self.animation = animation
                }
            } catch {
                print("Failed to load animation:", error)
            }
        }.resume()
    }
    
}

#Preview {
    SuccessView(transaction: Transaction(
        status: .success,
        amount: 100.0,
        currency: .USD,
        card: CardItem(id: UUID(), pan: "1234", cardHolder: "John Doe", expDate: "12/24", cvv: "123"),
        recipientsOfMoney: [Recipient(name: "Alice", avatar: "AvatarImage")]
    ))
}
