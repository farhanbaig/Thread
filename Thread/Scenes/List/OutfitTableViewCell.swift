
import UIKit

class OutfitTableViewCell: UITableViewCell {
    
    var previewImage = UIFactory.shared.imageView(contentMode: .scaleAspectFit)
    var descriptionLabel =  UIFactory.shared.label(text: "")
    var dateLabel = UIFactory.shared.label(text: "",fontName: Font.demiBold,fontSize: 12)
    
    var outfit: OutfitViewModel? {
        didSet {
            previewImage.setImage(from: outfit?.photoURL ?? "")
            descriptionLabel.text = outfit?.description
            dateLabel.text = outfit?.when
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI & Constraints Setup 
extension OutfitTableViewCell {
    private func setupUI() {
        selectionStyle = .none
        [previewImage,descriptionLabel,dateLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            previewImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewImage.topAnchor.constraint(equalTo: topAnchor),
            previewImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            previewImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
            
            dateLabel.topAnchor.constraint(equalTo: previewImage.bottomAnchor,constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
    }
}
