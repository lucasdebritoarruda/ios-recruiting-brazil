//
//  MovieCollectionViewCell.swift
//  ios_recruit_challenge
//
//  Created by Lucas de Brito on 09/10/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "madmax")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let movieNameCanvas: UIVisualEffectView = {
        let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let movieNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Filme"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let favButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "heart"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        addSubview(imageView)
        imageView.addSubview(movieNameCanvas)
        movieNameCanvas.contentView.addSubview(movieNameLabel)
        movieNameCanvas.contentView.addSubview(favButton)
        addConstraintsWithVisualFormat(format: "V:|[v0]|", views: imageView)
        addConstraintsWithVisualFormat(format: "H:|[v0]|", views: imageView)
        imageView.addConstraintsWithVisualFormat(format: "V:|-140-[v0]|", views: movieNameCanvas)
        imageView.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: movieNameCanvas)
        movieNameCanvas.contentView.addConstraintsWithVisualFormat(format: "V:|[v0]|", views: movieNameLabel)
        movieNameCanvas.contentView.addConstraintsWithVisualFormat(format: "H:|-[v0]-[v1]-|", views: movieNameLabel, favButton)
        movieNameCanvas.contentView.addConstraintsWithVisualFormat(format: "V:|[v0]|", views: favButton)
        backgroundColor = .white
    }
}