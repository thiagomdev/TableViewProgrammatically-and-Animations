//
//  VideoListViewController.swift
//  TableViewProgrammatically
//
//  Created by Thiago Monteiro on 13/01/22.
//

import UIKit

class VideoListViewController: UIViewController {
    
    private var tableView       = UITableView()
    private var videos: [Video] = []
    private var animationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "Videos"
        self.videos = fetchData()
        self.buildViewHierarchy()
        self.setButtonConfiguration()
        self.setConstraintsButton()
        self.configureTableView()
    }
    
    private func buildViewHierarchy() {
        self.view.addSubview(tableView)
        self.view.addSubview(animationButton)
    }
    
    private func configureTableView() {
        self.setTableViewDelegates()
        self.tableView.rowHeight                = 100
        self.tableView.isUserInteractionEnabled = true
        self.tableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.identifier)
        self.tableView.pin(to: view)
    }
    
    private func setTableViewDelegates() {
        self.tableView.delegate   = self
        self.tableView.dataSource = self
    }
    
    private func setButtonConfiguration() {
        self.animationButton.translatesAutoresizingMaskIntoConstraints = false
        self.animationButton.setTitle("TAP - ME", for: .normal)
        self.animationButton.titleLabel?.font                          = .systemFont(ofSize: 30, weight: .bold)
        self.animationButton.clipsToBounds                             = true
        self.animationButton.setTitleColor(.red, for: .normal)
        self.animationButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        self.configureAnimationButton()
        self.configureExtraAnimationButton()
    }
    
    private func setConstraintsButton() {
        self.animationButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        self.animationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive              = true
        self.animationButton.heightAnchor.constraint(equalToConstant: 60).isActive                            = true
        self.animationButton.widthAnchor.constraint(equalToConstant: 150).isActive                             = true
    }
    
    private func configureAnimationButton() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue    = CGPoint(x: self.view.frame.midX - 5, y: self.view.frame.midY)
        animation.toValue      = CGPoint(x: self.view.frame.midX + 5, y: self.view.frame.midY)
        animation.duration     = 0.1
        animation.repeatCount  = 8
        animation.autoreverses = true
        self.view.layer.add(animation, forKey: nil)
    }
    
    private func configureExtraAnimationButton() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue    = 1
        animation.toValue      = 2
        animation.duration     = 3
        animation.autoreverses = true
        self.view.layer.add(animation, forKey: nil)
    }
}

extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = VideoListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension VideoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.identifier, for: indexPath) as? VideoCell
        let allVideos = videos[indexPath.row]
        cell?.set(video: allVideos)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}

extension VideoListViewController {
    private func fetchData() -> [Video] {
        let video1 = Video(image: Image.video1, title: Titles.video1)
        let video2 = Video(image: Image.video2, title: Titles.video2)
        let video3 = Video(image: Image.video3, title: Titles.video3)
        let video4 = Video(image: Image.video4, title: Titles.video4)
        let video5 = Video(image: Image.video5, title: Titles.video5)
        return [video1, video2, video3, video4, video5]
    }
}


