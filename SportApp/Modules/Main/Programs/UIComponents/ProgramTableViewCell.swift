//
//  ProgramTableViewCell.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {
    // MARK: - UI
    lazy var backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var programLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Font.header.make(25)
        return label
    }()
    lazy var calView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    lazy var timeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    lazy var calStack: UIStackView = UIStackView.createStack(image: Assets.fire.image() ?? UIImage(),
                                                                     label: "",
                                                                     color: .black)
    lazy var timeStack: UIStackView = UIStackView.createStack(image: Assets.time.image() ?? UIImage(),
                                                                     label: "",
                                                                     color: .black)
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
        initLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.calView.layer.cornerRadius = self.calView.frame.height / 2
        self.timeView.layer.cornerRadius = self.timeView.frame.height / 2
    }
    
    // MARK: - Methods
    func initUI() {
        addSubview(backImage)
        backImage.addSubview(programLabel)
        backImage.addSubview(calView)
        backImage.addSubview(timeView)
        calView.addSubview(calStack)
        timeView.addSubview(timeStack)
    }
    func initLayout() {
        backImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview().inset(5)
        }
        programLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(20)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        timeView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.height.equalTo(timeView.snp.width).multipliedBy(0.3)
        }
        calView.snp.makeConstraints {
            $0.trailing.equalTo(timeView.snp.leading).offset(-10)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.height.equalTo(timeView.snp.width).multipliedBy(0.3)
        }
        calStack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        timeStack.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
