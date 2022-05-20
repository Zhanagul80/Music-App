//
//  MusicCell.swift
//  MusicApp
//
//  Created by Zhanagul Tynysbek on 17.04.2022.
//

import UIKit

final class MusicCell: UITableViewCell {
    
    @IBOutlet private weak var musicTitle: UILabel!
    @IBOutlet private weak var musicArtist: UILabel!
    @IBOutlet private weak var musicImage: UIImageView!
    @IBOutlet private weak var buttonImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: MusicModel) {
        musicTitle.text = model.title
        musicArtist.text = model.artist
        musicImage.image = model.image
        if model.isPlay {
            buttonImage.image = #imageLiteral(resourceName: "pauseButton")
        } else {
            buttonImage.image = #imageLiteral(resourceName: "playButton")
        }
    }
}
