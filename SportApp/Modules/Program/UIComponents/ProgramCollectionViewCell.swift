//
//  ProgramCollectionViewCell.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import UIKit

class ProgramCollectionViewCell: UICollectionViewCell {
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Font.mainMedium.make(12.5)
        return label
    }()
    lazy var playIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.play.image()
        return imageView
    }()
    lazy var exNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.mainRegular.make(12.5)
        return label
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        
        initUI()
        initLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func initUI() {
        addSubview(imageView)
        imageView.addSubview(timeLabel)
        imageView.addSubview(playIcon)
        addSubview(exNameLabel)
    }
    private func initLayout() {
        imageView.snp.makeConstraints {
            $0.width.equalTo(imageView.snp.height)
            $0.top.leading.trailing.equalToSuperview().inset(5)
        }
        playIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(playIcon.snp.height)
            $0.width.equalTo(imageView.snp.width).multipliedBy(0.2)
        }
        timeLabel.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(5)
        }
        exNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(2.5)
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.bottom.equalToSuperview().inset(2.5)
        }
    }
}
