//
//  ImageViewController.swift
//  FilmAPI
//
//  Created by Artem  on 06.06.2021.
//

import UIKit

final class ImageViewController: UIViewController {

    private let networkService: FilmNetworkServiceProtocol
    private let posterPath: String

    // MARK: - Init

    init(networkService: FilmNetworkServiceProtocol, posterPath: String) {
        self.networkService = networkService
        self.posterPath = posterPath
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadData()
    }

    deinit {
        print("ImageViewController deinit")
    }

    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadData() {
        networkService.getImage(path: posterPath) { data in
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image

                }
            }

        }
    }
}

