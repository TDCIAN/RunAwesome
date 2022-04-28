//
//  BaseViewController.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import UIKit

class BaseViewController: UIViewController {
    
    private lazy var backgroundLayer: GradientView = {
        let view = GradientView(colors: [.systemBlue, .systemTeal, .systemPink, .systemPurple])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(backgroundLayer)
    }
    
    private func setupConstraints() {
        // background layer
        NSLayoutConstraint.activate([
            backgroundLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundLayer.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

