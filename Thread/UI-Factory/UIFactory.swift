
import UIKit

class UIFactory {
    static let shared = UIFactory()
    private init() {}
}

//MARK: - UILabel
extension UIFactory {
    func label(text: String, aligment: NSTextAlignment = .left, fontName: String = Font.regular, fontSize: CGFloat = 13,numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = aligment
        label.numberOfLines = numberOfLines
        label.font = UIFont(name: fontName, size: fontSize)
        return label
    }
}

//MARK: - UIImageVIew
extension UIFactory {
    func imageView(contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView {
        let imageView =  UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode
        return imageView
    }
}

