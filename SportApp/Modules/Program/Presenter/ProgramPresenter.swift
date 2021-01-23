//
//  ProgramPresenter.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import Foundation
import FirebaseStorage

final class ProgramPresenter: ProgramPresenterProtocol {
    // MARK: - Properties
    weak var view: ProgramViewProtocol?
    var networkService: NetworkServiceProtocol
    var program: Program
    
    private var downloadTasks: [String: StorageDownloadTask] = [:]
    private var dispathGroup: DispatchGroup = DispatchGroup()
    
    // MARK: - Initializer
    required init(view: ProgramViewProtocol, networkService: NetworkServiceProtocol, program: Program) {
        self.view = view
        self.networkService = networkService
        self.program = program
        
        configureView()
    }
    
    // MARK: - Methods
    private func configureView() {
        view?.configure(with: program)
    }
    func showExercise(index: Int) {
        view?.showExercise(ex: program.exercises[index])
    }
    func showProgram() {
        let urls = program.exercises.map { $0.videoUrl }
        for url in urls {
            dispathGroup.enter()
            if !isDownloaded(url: url) {
                self.downloadExercise(url: url) {
                    self.dispathGroup.leave()
                }
            } else {
                dispathGroup.leave()
            }
        }
        dispathGroup.notify(queue: DispatchQueue.main) {
            let vc = VideoViewController(program: urls, time: self.program.time)
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            self.view?.showProgram(vc: vc)
        }
    }
    func downloadExercise(index: Int) {
        let task = networkService.firebaseService?.downloadVideo(program.exercises[index].videoUrl,
                                                                 completion: { [weak self] in
                                                                    guard let self = self else { return }
                                                                    self.downloadTasks[self.program.exercises[index].name] = nil
                                                                    self.showExercise(index: index)
                                                                 })
        
        downloadTasks[program.exercises[index].name] = task
    }
    private func downloadExercise(url: String, completion: @escaping (() -> Void)) {
        networkService.firebaseService?.downloadVideo(url, completion: {
            completion()
        })
    }
    func isDownloaded(index: Int) -> Bool {
        let path = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(self.program.exercises[index].videoUrl)
            .path
        return FileManager.default.fileExists(atPath: path)
    }
    private func isDownloaded(url: String) -> Bool {
        let path = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(url)
            .path
        return FileManager.default.fileExists(atPath: path)
    }
}
