//
//  VideoViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import UIKit

class VideoViewController: UIViewController {
    // MARK: - Properties
    private var urls: [URL?] = []
    private var player: Player?
    private var currentVideo: Int = 0
    private var repeatCounter: Int = 1
    
    // MARK: - UI
    private var timer: VideoTimer!
    lazy private var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(Assets.exitVideo.image(), for: .normal)
        button.addTarget(self, action: #selector(exit), for: .touchUpInside)
        return button
    }()
    // MARK: - Initializers
    convenience init(ex: String, time: Int) {
        self.init(nibName: nil, bundle: nil)
        
        let path = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(ex)
        
        urls.append(path)
        
        let timer = VideoTimer(time)
        timer.delegate = self
        self.timer = timer
    }
    convenience init(program: [String], time: Int) {
        self.init(nibName: nil, bundle: nil)
        
        urls = program.map {
            FileManager.default
                .urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent($0)
        }
        
        let timer = VideoTimer(time)
        timer.delegate = self
        self.timer = timer
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayer()
        
        startVideo()
        
        initUI()
        initLayout()
    }

    // MARK: - Methods
    private func initPlayer() {
        self.player = Player()
        self.player?.playerDelegate = self
        self.player?.playbackDelegate = self
        self.player?.view.frame = self.view.bounds
        self.player?.fillMode = .resizeAspectFill
        
        self.player?.playerView.backgroundColor = .white
    }
    private func startVideo() {
        self.addChild(self.player!)
        self.view.addSubview((self.player?.view)!)
        self.player?.didMove(toParent: self)
        
        self.player?.url = urls[0]
        self.player?.playFromBeginning()
        self.timer.startTimer()
    }
    // MARK: - Methods
    private func initUI() {
        view.addSubview(timer)
        view.addSubview(exitButton)
    }
    private func initLayout() {
        timer.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottomMargin).inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        exitButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).inset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    // MARK: - @objc methods
    @objc
    private func exit() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions
extension VideoViewController: VideoTimerDelegate {
    func timerStopped() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension VideoViewController: PlayerDelegate {
    func playerReady(_ player: Player) {
        
    }
    func playerPlaybackStateDidChange(_ player: Player) {
                
    }
    func playerBufferingStateDidChange(_ player: Player) {
            
    }
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
}
extension VideoViewController: PlayerPlaybackDelegate {
    func playerPlaybackDidEnd(_ player: Player) {
        while repeatCounter < 2 {
            player.playFromBeginning()
            repeatCounter += 1
            return
        }
        guard urls.count > currentVideo + 1 else { exit(); return }
        repeatCounter = 1
        currentVideo += 1
        player.url = urls[currentVideo]
        player.playFromBeginning()
    }
    func playerCurrentTimeDidChange(_ player: Player) {}
    func playerPlaybackWillStartFromBeginning(_ player: Player) {}
    func playerPlaybackWillLoop(_ player: Player) {}
    func playerPlaybackDidLoop(_ player: Player) {}
}
