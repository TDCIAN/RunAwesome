//
//  HomeViewController.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import UIKit
import MapKit

class HomeViewController: BaseViewController {
    
    // MARK: - UIElements
    private lazy var startButton: CircularButton = {
        let button = CircularButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.borderWidth = 15
        button.borderColor = UIColor.systemPink
        button.titleText = "RUN"
        button.addTarget(self, action: #selector(startRunning), for: .touchUpInside)
        return button
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Run Awesome"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = label.font.withSize(32)
        return label
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.alpha = 0.6
        mapView.delegate = self
        return mapView
    }()

    // MARK: - Local variables
    private var locationManager = LocationManager()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        locationManager.checkLocationAuthorization()
        [topLabel, mapView, startButton]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        // top label
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // map view
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // start run button
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 100),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Helpers
    @objc private func startRunning() {
        print("스타트 러닝 버튼 클릭")
    }
}

// MARK: - Extension
extension HomeViewController: MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}
