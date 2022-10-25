//
//  CountryDetailVC.swift
//  CountryTourList
//
//  Created by NOMAD on 10/9/22.
//

import UIKit

class CountryDetailVC: UIViewController {
    var countryInformation: DataModel?
    
    var doneButton = UIButton()
    var safeArea: UILayoutGuide!
    var countryImage = ImageLoader()
    let nameLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
      
        setupImage()
        setupImageData()
        setupNameLabel()
        setupDimissButton()
    }
    
    func setupDimissButton () {
        view.addSubview(doneButton)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -55).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       // dismissButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.configuration = .filled()
        doneButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        doneButton.tintColor = .systemBlue
        
        doneButton.addTarget(self, action: #selector(dimissAction), for: .touchUpInside)
    }
    
    
    //MARK: - setupImageData
    
    func setupImageData () {
        if let countryInformation = countryInformation {
            let url = URL(string: countryInformation.largeImageUrl!)
            countryImage.loadImage(from: url!)
            nameLabel.text = countryInformation.name
            
        }
    }
    
    
    func setupImage () {
        view.addSubview(countryImage)
        
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.contentMode = .scaleAspectFit
 
       // countryImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        countryImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        countryImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        //countryImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
       // countryImage.heightAnchor.constraint(equalTo: countryImage.widthAnchor).isActive = true
    
    }
    
    
    func setupNameLabel () {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        nameLabel.font = .systemFont(ofSize: 30)
        nameLabel.textColor = .label
    
    }
    
    @objc func dimissAction () {
        self.dismiss(animated: true)
        
    }
    
    
    
}
