//
//  ProgramViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import UIKit
import FirebaseStorage

class ProgramViewController: UIViewController {
    // MARK: - Properties
    var presenter: ProgramPresenterProtocol?
    var ref: StorageReference = Storage.storage().reference()
    // MARK: - UI
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.isUserInteractionEnabled = true
        return contentView
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Font.header.make(25)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Font.mainMedium.make(15)
        button.setTitle(NSLocalizedString("startProgram", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapStartProgram), for: .touchUpInside)
        return button
    }()
    lazy var programDescription: UILabel = {
        let label = UILabel()
        label.font = Font.mainRegular.make(15)
        label.numberOfLines = 0
        return label
    }()
    lazy var exLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("ex", comment: "")
        label.font = Font.header.make(20)
        label.textColor = .gray
        return label
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 140)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
        initLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar(with: presenter?.program.name ?? "")
        
        self.mainLabel.text = presenter?.program.name
        self.programDescription.text = presenter?.program.description
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCornerRadiusFor(startButton)
    }
    
    // MARK: - Methods
    private func initUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        imageView.addSubview(mainLabel)
        contentView.addSubview(startButton)
        contentView.addSubview(programDescription)
        contentView.addSubview(exLabel)
        contentView.addSubview(collectionView)
    }
    private func initLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(self.view)
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        mainLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        startButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(startButton.snp.width).multipliedBy(0.15)
        }
        programDescription.snp.makeConstraints {
            $0.top.equalTo(startButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        exLabel.snp.makeConstraints {
            $0.top.equalTo(programDescription.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(exLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.2)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }

    
    // MARK: - @objc methods
    @objc
    private func tapStartProgram() {
        presenter?.showProgram()
    }
}
// MARK: - Extensions
extension ProgramViewController: ProgramViewProtocol {
    func configure(with program: Program) {
        self.imageView.downloadImage(for: program.imageUrl, ref: ref)
        self.mainLabel.text = program.name
        self.programDescription.text = program.description
    }
    func showExercise(ex: Exercise) {
        let vc = VideoViewController(ex: ex.videoUrl, time: ex.lenght)
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    func showProgram(vc: UIViewController) {
        self.present(vc, animated: true, completion: nil)
    }
}
extension ProgramViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if presenter!.isDownloaded(index: indexPath.row) {
            presenter?.showExercise(index: indexPath.row)
        } else {
            presenter?.downloadExercise(index: indexPath.row)
        }
    }
}
extension ProgramViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.program.exercises.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProgramCollectionViewCell else { return UICollectionViewCell() }
        
        cell.exNameLabel.text = presenter?.program.exercises[indexPath.row].name
        cell.timeLabel.text = Int.toTime(presenter?.program.exercises[indexPath.row].lenght ?? 0, formatter: DateComponentsFormatter())
        cell.imageView.downloadImage(for: presenter?.program.exercises[indexPath.row].previewUrl ?? "", ref: ref)
        
        return cell
    }
}
