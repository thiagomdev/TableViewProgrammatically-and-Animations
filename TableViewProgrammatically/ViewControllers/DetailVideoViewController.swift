//
//  DetailVideoViewController.swift
//  TableViewProgrammatically
//
//  Created by Thiago Monteiro on 13/01/22.
//

import UIKit

class DetailVideoViewController: UIViewController {
    
    private var videoListImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildViewHierarchy()
        self.configureVideoListImageView()
        self.setImageViewConstraints()
        self.view.backgroundColor = .white
    }
    
    private func buildViewHierarchy() {
        self.view.addSubview(videoListImageView)
    }
    
    private func configureVideoListImageView() {
        self.videoListImageView.layer.cornerRadius = 10
        self.videoListImageView.clipsToBounds      = true
    }
    
    private func setImageViewConstraints() {
        self.videoListImageView.translatesAutoresizingMaskIntoConstraints                           = false
        self.videoListImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.videoListImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.videoListImageView.heightAnchor.constraint(equalToConstant: 80).isActive               = true
        self.videoListImageView.widthAnchor.constraint(equalToConstant: 80).isActive                = true
    }
}
