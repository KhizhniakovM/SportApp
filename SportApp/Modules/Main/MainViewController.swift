//
//  MainViewController.swift
//  SportApp
//
//  Created by Max Khizhniakov on 18.01.2021.
//

import UIKit

class MainViewController: UITabBarController {
    // MARK: - Properties
    var networkService: NetworkServiceProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTabs()
    }
    
    // MARK: - Methods
    private func configureTabBar() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }
    private func createTabs() {
        let programsView = ProgramsViewController()
        let programsPresenter = ProgramsPresenter(view: programsView, networkService: networkService)
        programsView.presenter = programsPresenter
        programsView.tabBarItem = UITabBarItem(title: NSLocalizedString("iconPrograms", comment: ""),
                                               image: Assets.iconPrograms.image(),
                                               selectedImage: nil)
        let programsNav = UINavigationController(rootViewController: programsView)
        
        let exercisesView = ExercisesViewController()
        let exercisesPresenter = ExercisesPresenter(view: exercisesView, networkService: networkService)
        exercisesView.presenter = exercisesPresenter
        exercisesView.tabBarItem = UITabBarItem(title: NSLocalizedString("iconExercises", comment: ""),
                                               image: Assets.iconExercises.image(),
                                               selectedImage: nil)
        
        let statisticsView = StatisticsViewController()
        let statisticsPresenter = StatisticsPresenter(view: statisticsView, networkService: networkService)
        statisticsView.presenter = statisticsPresenter
        statisticsView.tabBarItem = UITabBarItem(title: NSLocalizedString("iconStatistics", comment: ""),
                                               image: Assets.iconStatistics.image(),
                                               selectedImage: nil)
        
        let profileView = ProfileViewСontroller()
        let profilePresenter = ProfilePresenter(view: profileView, networkService: networkService)
        profileView.presenter = profilePresenter
        profileView.tabBarItem = UITabBarItem(title: NSLocalizedString("iconProfile", comment: ""),
                                               image: Assets.iconProfile.image(),
                                               selectedImage: nil)
        
        viewControllers = [programsNav, exercisesView, statisticsView, profileView]
    }
}
