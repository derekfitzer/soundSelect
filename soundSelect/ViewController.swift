//
//  ViewController.swift
//  soundSelect
//
//  Created by Derek Fitzer on 4/21/23.
//

import UIKit

import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var sounds = ["samplen","samplenHighPass","samplenLPass","samplenReverb"]
    
    var test = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = sounds[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        play(whatSound: sounds[indexPath.row])
    }
    
    
    var player = AVAudioPlayer()

    func play(whatSound: String){
            //print(sender.tag) // testing button pressed tag
            let path = Bundle.main.path(forResource: whatSound, ofType : "wav")!
            let url = URL(fileURLWithPath : path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print ("There is an issue with this code!")
            }
        }
}

