//
//  ProgramsView.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit
import FirebaseStorage

final class ProgramsViewController: UIViewController {
    // MARK: - Properties
    var presenter: ProgramsPresenterProtocol?
    lazy var ref = Storage.storage().reference()
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
    lazy var line: UIView = UIView.line()
    lazy var courseInfoView: CourseInfoView = CourseInfoView()
    lazy var avaliableProgramsLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("availablePrograms", comment: "")
        label.textColor = .black
        label.font = Font.header.make(17.5)
        return label
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.register(ProgramTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar(with: NSLocalizedString("trainingPrograms", comment: ""))
        setupBackButton()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCornerRadiusFor(courseInfoView.moreButton)
    }
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(line)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(courseInfoView)
        contentView.addSubview(avaliableProgramsLabel)
        contentView.addSubview(tableView)
        
        line.snp.makeConstraints {
            $0.top.equalTo(self.view.snp_topMargin)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(self.view)
        }
        courseInfoView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.view.snp.height).multipliedBy(0.25)
        }
        avaliableProgramsLabel.snp.makeConstraints {
            $0.top.equalTo(courseInfoView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        tableView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.top.equalTo(avaliableProgramsLabel.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Extensions
extension ProgramsViewController: ProgramsViewProtocol {
    func push(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ProgramsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.push(index: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
extension ProgramsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter?.programs.count else { return 0 }
        tableView.snp.updateConstraints {
            $0.height.equalTo(count * 200 + 20)
        }
        self.view.layoutSubviews()
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard presenter?.programs.count != 0 else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProgramTableViewCell else { return UITableViewCell() }
        
        cell.backImage.downloadImage(for: presenter?.programs[indexPath.row].imageUrl ?? "", ref: ref)
        cell.programLabel.text = presenter?.programs[indexPath.row].name
        (cell.calStack.arrangedSubviews[1] as? UILabel)?.text = "\(presenter?.programs[indexPath.row].cal ?? 0)" + " cal"
        (cell.timeStack.arrangedSubviews[1] as? UILabel)?.text = "\(presenter?.programs[indexPath.row].time ?? 0)" + " min"
        
        cell.selectionStyle = .none
        return cell
    }
}
