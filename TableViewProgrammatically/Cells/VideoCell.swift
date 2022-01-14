//
//  VideoCell.swift
//  TableViewProgrammatically
//
//  Created by Thiago Monteiro on 13/01/22.
//

import UIKit

class VideoCell: UITableViewCell {
    
    static let identifier: String = VideoCell.self.description()
    
    lazy var videoListImageView     = UIImageView()
    private var videoListTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.buildViewHierarchy()
        self.configureVideoListImageView()
        self.configureVideoListTitleLabel()
        self.setImageViewConstraints()
        self.setTitleLabelConstraints()
        self.activeAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        self.addSubview(videoListImageView)
        self.addSubview(videoListTitleLabel)
    }
    
    public func set(video with: Video) {
        self.videoListImageView.image = with.image
        self.videoListTitleLabel.text = with.title
    }
    
    private func configureVideoListImageView() {
        self.videoListImageView.layer.cornerRadius = 10
        self.videoListImageView.clipsToBounds      = true
    }
    
    private func configureVideoListTitleLabel() {
        self.videoListTitleLabel.numberOfLines             = 0
        self.videoListTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setImageViewConstraints() {
        self.videoListImageView.translatesAutoresizingMaskIntoConstraints                                                        = false
        self.videoListImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive                                   = true
        self.videoListImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive                     = true
        self.videoListImageView.heightAnchor.constraint(equalToConstant: 80).isActive                                            = true
        self.videoListImageView.widthAnchor.constraint(equalTo: self.videoListImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        self.videoListTitleLabel.translatesAutoresizingMaskIntoConstraints                                                        = false
        self.videoListTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive                                   = true
        self.videoListTitleLabel.leadingAnchor.constraint(equalTo: self.videoListImageView.trailingAnchor, constant: 20).isActive = true
        self.videoListTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                            = true
        self.videoListTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive                  = true
    }
    
    private func activeAnimations() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.videoListTitleLabel.transform     = .init(scaleX: 1.25, y: 1.25)
        }) { [self] (finished: Bool) -> Void in
            self.videoListTitleLabel.text          = videoListTitleLabel.text
            UIView.animate(withDuration: 0.50, animations: { () -> Void in
                self.videoListTitleLabel.transform = .identity
                self.videoListTitleLabel.textColor = .darkGray
            })
        }
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.videoListImageView.transform     = .init(a: 0.4, b: 0.2, c: 0.7, d: 0.1, tx: 0.3, ty: 0.2)
        }) { [self] (finished: Bool) -> Void in
            self.videoListImageView.image         = videoListImageView.image
            UIView.animate(withDuration: 0.50, animations: { () -> Void in
                self.videoListImageView.transform = .identity
            })
        }
    }
}
