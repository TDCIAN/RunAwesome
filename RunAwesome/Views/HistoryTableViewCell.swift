//
//  HistoryTableViewCell.swift
//  RunAwesome
//
//  Created by JeongminKim on 2022/04/28.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    static let identifer = "HistoryTableViewCell"
    
    // MARK: - external props
    var totalMiles: Double = 0.0 {
        didSet {
            totalMilesLabel.text = String(format: "%0.1f", totalMiles)
            layoutIfNeeded()
        }
    }
    
    var totalTime: String = "00:00" {
        didSet {
            totalTimeLabel.text = totalTime
            layoutIfNeeded()
        }
    }
    
    var entryDate: String = "04/28/2022" {
        didSet {
            entryDateLabel.text = entryDate
            layoutIfNeeded()
        }
    }
    
    // MARK: - UI elements
    private lazy var totalMilesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var totalTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.textColor = .white
        label.font = label.font.withSize(18)
        return label
    }()
    
    private lazy var entryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.textColor = .white
        label.font = label.font.withSize(18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.black.withAlphaComponent(0.1)
        [totalMilesLabel, totalTimeLabel, entryDateLabel]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        // totalMilesLabel
        NSLayoutConstraint.activate([
            totalMilesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            totalMilesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
        
        // total time label
        NSLayoutConstraint.activate([
            totalTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            totalTimeLabel.topAnchor.constraint(equalTo: totalMilesLabel.bottomAnchor, constant: 8),
            totalTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        // entry date label
        NSLayoutConstraint.activate([
            entryDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            entryDateLabel.centerYAnchor.constraint(equalTo: totalMilesLabel.centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
}
