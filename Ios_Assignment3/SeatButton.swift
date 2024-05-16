import SwiftUI

struct SeatButton: View {
    var isSelected: Bool
    var isReserved: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isReserved ? "square.fill" : (isSelected ? "checkmark.square.fill" : "square"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isReserved ? .red : (isSelected ? .green : .gray))
        }
        .frame(width: 30, height: 30)
        .padding(2)
    }
}
