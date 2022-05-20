//
//  ViewController.swift
//  MusicApp
//
//  Created by Zhanagul Tynysbek on 17.04.2022.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    var musics = [
        MusicModel(title: "Believer", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "beliver"), music: "Believer"),
        MusicModel(title: "Dreams", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "radioactive"), music: "Dreams"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive"),
        MusicModel(title: "Radioactive", artist: "Imagine Dragons", image: #imageLiteral(resourceName: "dream"), music: "Radioactive")
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    private var player: AVAudioPlayer!
    private var isPlay: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "MusicCell", bundle: Bundle(for: MusicCell.self))
        tableView.register(nib, forCellReuseIdentifier: "MusicCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        cell.configure(with: musics[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var musicModel = musics[indexPath.row]
        let path = Bundle.main.path(forResource: musicModel.music, ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try! AVAudioPlayer(contentsOf: url)
        
        if musicModel.isPlay {
            player.stop()
            musicModel.isPlay = false
        } else {
            player.play()
            musicModel.isPlay = true
        }
        musics[indexPath.row] = musicModel
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
