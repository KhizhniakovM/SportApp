//
//  Timer.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import UIKit

protocol VideoTimerDelegate {
    func timerStopped()
}

class VideoTimer: UIView {
    // MARK: - Properties
    var formatter: DateComponentsFormatter = DateComponentsFormatter()
    var time: Int!
    var delegate: VideoTimerDelegate?
    // MARK: - UI
    lazy private var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Font.header.make(25)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    lazy private var view: UIView = {
        let view = UIView()
        view.backgroundColor = .mail
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Initializers
    convenience init(_ time: Int) {
        self.init(frame: .zero)
        self.time = time
        self.label.text = Int.toTime(time, formatter: formatter)
    }
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
        addSubview(view)
        view.addSubview(label)
    }
    private func initLayout() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            self.time -= 1
            if self.time == 0 {
                self.label.text = "0:00"
                timer.invalidate()
                self.delegate?.timerStopped()
            }
            self.label.text = Int.toTime(self.time, formatter: self.formatter)
        }
    }
}
