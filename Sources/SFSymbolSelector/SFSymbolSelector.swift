import SwiftUI

/// A curated, app-neutral set of SF Symbols suitable for user-defined categories,
/// collections, statuses, and similar app content.
public enum SFSymbolCatalog {
    public static let commonSymbols = [
        // Home and storage
        "folder.fill", "tag.fill", "tray.fill", "tray.2.fill", "archivebox.fill", "shippingbox.fill",
        "shippingbox.and.arrow.backward.fill", "box.truck.fill", "house.fill", "building.2.fill",
        "door.left.hand.open", "door.right.hand.open", "bed.double.fill", "sofa.fill", "chair.fill",
        "lamp.floor.fill", "lightbulb.fill", "fireplace.fill", "stairs", "window.vertical.open",
        "refrigerator.fill", "washer.fill", "dryer.fill", "air.conditioner.horizontal.fill",
        "fan.fill", "humidifier.fill", "heater.vertical.fill", "vacuum.fill", "sink.fill",
        "trash.fill", "trash.slash.fill", "lock.fill", "key.fill", "bell.fill",

        // Shopping, kitchen, and food
        "cart.fill", "basket.fill", "bag.fill", "handbag.fill", "wallet.pass.fill", "barcode.viewfinder",
        "fork.knife", "fork.knife.circle.fill", "cup.and.saucer.fill", "mug.fill", "wineglass.fill",
        "takeoutbag.and.cup.and.straw.fill", "waterbottle.fill", "birthday.cake.fill", "carrot.fill",
        "fish.fill", "bird.fill", "hare.fill", "tree.fill", "apple.logo", "popcorn.fill",
        "birthday.cake", "flame.fill", "fork.knife.circle", "square.split.2x2.fill",

        // Clothing and personal items
        "tshirt.fill", "shoe.fill", "shoe.2.fill", "hat.wide.brim.fill", "eyeglasses",
        "comb.fill", "theatermasks.fill", "mustache.fill", "face.smiling.fill", "figure.dress.line.vertical.figure",
        "figure.arms.open", "figure.child", "figure.2.and.child.holdinghands", "backpack.fill",
        "umbrella.fill", "rainbow", "sunglasses.fill", "scissors", "sewing.needles",

        // Health, care, and household supplies
        "heart.fill", "cross.case.fill", "cross.fill", "pills.fill", "bandage.fill", "stethoscope",
        "thermometer.medium", "medical.thermometer", "toothbrush.fill", "mouth.fill", "lungs.fill",
        "allergens.fill", "drop.fill", "shower.fill", "bathtub.fill", "hands.sparkles.fill",
        "soap.fill", "comb.fill", "mustache.fill", "shield.fill", "figure.roll",

        // Transport and outdoors
        "car.fill", "car.side.fill", "fuelpump.fill", "ev.charger.fill", "bus.fill", "tram.fill",
        "train.side.front.car", "bicycle", "scooter", "motorcycle.fill", "airplane", "ferry.fill",
        "figure.walk", "figure.run", "figure.hiking", "figure.pool.swim", "figure.skiing.downhill",
        "tent.fill", "mountain.2.fill", "beach.umbrella.fill", "binoculars.fill", "map.fill",
        "location.fill", "suitcase.fill", "globe.europe.africa.fill", "parkingsign.circle.fill",

        // Work, school, hobbies, and games
        "book.fill", "books.vertical.fill", "newspaper.fill", "magazine.fill", "graduationcap.fill",
        "pencil.and.outline", "pencil.tip.crop.circle", "highlighter", "paperclip", "note.text",
        "briefcase.fill", "calendar", "clock.fill", "checklist", "ruler.fill", "paintbrush.fill",
        "paintpalette.fill", "wrench.and.screwdriver.fill", "hammer.fill", "screwdriver.fill",
        "gearshape.fill", "wrench.adjustable.fill", "gamecontroller.fill", "puzzlepiece.fill",
        "dice.fill", "die.face.5.fill", "chess.queen.fill", "music.note", "guitars.fill",
        "headphones", "mic.fill", "camera.fill", "photo.fill", "film.fill", "ticket.fill",
        "balloon.fill", "party.popper.fill", "gift.fill", "sparkles", "star.fill",

        // Electronics and finance
        "bolt.fill", "wifi", "antenna.radiowaves.left.and.right", "iphone", "ipad", "laptopcomputer",
        "desktopcomputer", "applewatch", "airpods", "tv.fill", "display.2", "printer.fill",
        "keyboard.fill", "computermouse.fill", "externaldrive.fill", "gamecontroller.fill",
        "creditcard.fill", "banknote.fill", "dollarsign.circle.fill", "eurosign.circle.fill",
        "sterlingsign.circle.fill", "yensign.circle.fill", "chart.pie.fill", "chart.line.uptrend.xyaxis",
        "percent", "building.columns.fill", "arrow.left.arrow.right"
    ]
}

/// A visible SF Symbol picker that can be embedded alongside a text field.
public struct SFSymbolSelector: View {
    @Binding private var selection: String
    private let suggestedSymbolName: String
    private let tint: Color
    private let symbols: [String]

    public init(
        selection: Binding<String>,
        suggestedSymbolName: String = "",
        tint: Color = .accentColor,
        symbols: [String] = SFSymbolCatalog.commonSymbols
    ) {
        _selection = selection
        self.suggestedSymbolName = suggestedSymbolName
        self.tint = tint
        self.symbols = symbols
    }

    private var uniqueSymbols: [String] {
        ([suggestedSymbolName] + symbols).reduce(into: []) { result, symbolName in
            guard !symbolName.isEmpty, !result.contains(symbolName) else { return }
            result.append(symbolName)
        }
    }

    public var body: some View {
        DisclosureGroup("Symbols") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 38), spacing: 10)], spacing: 10) {
                ForEach(uniqueSymbols, id: \.self) { symbolName in
                    Button {
                        selection = symbolName
                    } label: {
                        Image(systemName: symbolName)
                            .imageScale(.medium)
                            .frame(width: 34, height: 34)
                            .foregroundStyle(selection == symbolName ? Color.white : tint)
                            .background(
                                selection == symbolName ? tint : tint.opacity(0.12),
                                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(symbolName)
                }
            }
            .padding(.vertical, 6)
        }
    }
}
