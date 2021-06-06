//
//  ViewController.swift
//  FilmAPI
//
//  Created by Artem  on 06.06.2021.
//

import UIKit

class ViewController: UIViewController {

    let networkService: FilmNetworkServiceProtocol
    
    init(networkService: FilmNetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FilmCell.self, forCellReuseIdentifier: FilmCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var films: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getFilm { result in
            switch result {
            
            case .success(let response):
                self.films = response.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            default: break
            }
            
        }
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        view.backgroundColor = .green
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmCell.identifier, for: indexPath)
        cell.textLabel?.text = films[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ImageViewController(networkService: networkService, posterPath: films[indexPath.row].posterPath)
        present(viewController, animated: true, completion: nil)
    }
}

