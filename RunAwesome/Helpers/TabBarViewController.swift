//
//  TabBarViewController.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.label
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createViewControllers(for: HomeViewController(), title: "Run", systemImage: "hare"),
            createViewControllers(for: HistoryViewController(), title: "Logs", systemImage: "clock")
        ]
    }
    
    private func createViewControllers(for viewController: UIViewController, title: String, systemImage: String) -> UIViewController {
        let iconSymbol = UIImage(systemName: systemImage)
        let selectedSymbol = UIImage(systemName: systemImage, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let tabBarItem = UITabBarItem(title: title, image: iconSymbol, selectedImage: selectedSymbol)
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}
