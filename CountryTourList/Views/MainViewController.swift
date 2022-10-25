//
//  ViewController.swift
//  CountryTourList
//
//  Created by NOMAD on 9/24/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()
    var CountriesListModel = [DataModel]()
    var safeArea: UILayoutGuide!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        safeArea = view.layoutMarginsGuide
        setupTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: - API Call
        
        let anonymousFunction = { (fetchedCountriesList: [DataModel]) in
            DispatchQueue.main.async {
                self.CountriesListModel = fetchedCountriesList
                self.tableView.reloadData()
            }
            
        }
        
        NetworkManager.shared.fetchCountriesInformation(completion: anonymousFunction)

    }
    
    //MARK: - AutoLayout Constrains
  
    func setupTableView () {
        view.addSubview(tableView)
        
        tableView.register(CountryCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountriesListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        guard let customCountryCell = cell as? CountryCell else {
            return cell
        }
        
        let countrisList = CountriesListModel[indexPath.row]
        customCountryCell.countryNameLabel.text = countrisList.name
        customCountryCell.capitalNameLabel.text = countrisList.capital

        
        if let url = URL(string: countrisList.largeImageUrl ?? "Could not load image") {
            customCountryCell.imageIV.loadImage(from: url)
        }
        
        customCountryCell.sizeToFit()
        customCountryCell.accessoryType = .disclosureIndicator
        
        return cell
    }
}


//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.CountriesListModel.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let CountryInfo = CountriesListModel[indexPath.row]
        let countryDetailVC = CountryDetailVC()
        
        countryDetailVC.countryInformation = CountryInfo
        
        countryDetailVC.modalPresentationStyle = .fullScreen
        self.present(countryDetailVC, animated: true)
    }
    
}


