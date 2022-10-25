//
//  CustomTableView.swift
//  CountryTourList
//
//  Created by NOMAD on 9/24/22.
//

import UIKit

class CountryCell: UITableViewCell {
    
    var safeArea: UILayoutGuide!
    let imageIV = ImageLoader()
    let countryNameLabel = UILabel()
    let capitalNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        safeArea = layoutMarginsGuide
        setupView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView Functions
    
    func setupView () {
        setupImageView()
        setupNameLabel()
        setupCapitalNameLabel()
        
    }
    
    func setupImageView () {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageIV.contentMode = .scaleAspectFit
        //imageIV.backgroundColor = .blue
        
    }
    
    func setupNameLabel() {
        addSubview(countryNameLabel)
        
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        countryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
       
        countryNameLabel.font = .systemFont(ofSize: 15, weight: .bold)
    
    }
    
    func setupCapitalNameLabel() {
        addSubview(capitalNameLabel)
        
        capitalNameLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalNameLabel.leadingAnchor.constraint(equalTo: countryNameLabel.leadingAnchor).isActive = true
        capitalNameLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor).isActive = true
        
        //capitalNameLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    
}
