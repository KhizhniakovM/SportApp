//
//  VideoViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import UIKit

class VideoViewController: UIViewController {
    // MARK: - Properties
    var urls: [URL]?
    var player: Player?
    
    // MARK: - UI
    private var timer: VideoTimer!
    lazy private var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(Assets.exitVideo.image(), for: .normal)
        button.addTarget(self, action: #selector(exit), for: .touchUpInside)
        return button
    }()
    // MARK: - Initializers
    convenience init(urls: [URL], time: Int) {
        self.init(nibName: nil, bundle: nil)
        
        self.urls = urls
        
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
        makePlaylistFrom(urls: urls)
        initPlayer()
        
        startVideo()
        
        initUI()
        initLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Methods
    private func makePlaylistFrom(urls: [URL]?) {
//        guard let urls = urls else { return }
    }
    private func initPlayer() {
        self.player = Player()
        self.player?.playerDelegate = self
        self.player?.playbackDelegate = self
        self.player?.view.frame = self.view.bounds
        self.player?.fillMode = .resizeAspectFill
        
        self.player?.playbackLoops = true
    }
    private func startVideo() {
        self.addChild(self.player!)
        self.view.addSubview((self.player?.view)!)
        self.player?.didMove(toParent: self)
        
        let url = Bundle.main.url(forResource: "video", withExtension: "MP4")
        self.player?.url = url
        self.player?.playFromBeginning()
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
    func playerCurrentTimeDidChange(_ player: Player) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    func playerPlaybackDidLoop(_ player: Player) {
                
    }
}
