//
//  CourseInfoView.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit
import SnapKit

class CourseInfoView: UIView {
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "courseImage"))
        return imageView
    }()
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("more", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = Font.mainRegular.make(17.5)
        return button
    }()
    lazy private var courseNameLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("courseName", comment: "")
        label.textColor = .white
        label.font = Font.header.make(20)
        label.numberOfLines = 0
        return label
    }()
    lazy var calStack: UIStackView = UIStackView.createStack(image: Assets.fire.image() ?? UIImage(),
                                                                     label: "180 cal",
                                                                     color: .buttonText)
    lazy var timeStack: UIStackView = UIStackView.createStack(image: Assets.time.image() ?? UIImage(),
                                                                     label: "45 min",
                                                                     color: .buttonText)

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        initLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func initUI() {
        addSubview(imageView)
        imageView.addSubview(moreButton)
        imageView.addSubview(courseNameLabel)
        imageView.addSubview(calStack)
        imageView.addSubview(timeStack)
    }
    private func initLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        courseNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(15)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        calStack.snp.makeConstraints {
            $0.top.equalTo(courseNameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        timeStack.snp.makeConstraints {
            $0.top.equalTo(courseNameLabel.snp.bottom).offset(15)
            $0.leading.equalTo(calStack.snp.trailing).offset(15)
        }
        moreButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalTo(moreButton.snp.width).multipliedBy(0.25)
        }
    }
}
