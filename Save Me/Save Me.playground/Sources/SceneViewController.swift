import UIKit
import ARKit
import SceneKit
import AVFoundation
import PlaygroundSupport

public class SceneViewController : UIViewController {
    //整个session中都会用到的变量
    var currentScene = 1
    var backgroundMusicPlayer = AVAudioPlayer()
    let nextButton = UIButton()
    
    //First scene
    let introduceSceneBackgroundView = UIView()
    let firstSceneBackgroundImageView = UIImageView(image: UIImage(named: "firstSceneBackgroundImage"))
    let firstSceneLabelImageView = UIImageView(image: UIImage(named: "firstSceneLabelImage"))
    let starView = UIImageView(image: UIImage(named: "starImage"))
    
    public override func loadView() {
        super.loadView()
        self.view = introduceSceneBackgroundView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSceneLabelImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstSceneLabelImageView)
        firstSceneBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstSceneBackgroundImageView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(starView)
        
        nextButton.setTitle("Next -->", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "PingFang", size: 20)
        nextButton.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        nextButton.backgroundColor = UIColor(white: 1, alpha: 0.4)
        nextButton.layer.cornerRadius = 20
        nextButton.clipsToBounds = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        //nextButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            firstSceneBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            firstSceneBackgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstSceneBackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            firstSceneBackgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            firstSceneLabelImageView.centerXAnchor.constraint(equalTo: introduceSceneBackgroundView.centerXAnchor),
            firstSceneLabelImageView.centerYAnchor.constraint(equalTo: introduceSceneBackgroundView.centerYAnchor, constant: 5),
            firstSceneLabelImageView.widthAnchor.constraint(equalToConstant: 250),
            firstSceneLabelImageView.heightAnchor.constraint(equalToConstant: 250),
            
            starView.centerXAnchor.constraint(equalTo: introduceSceneBackgroundView.centerXAnchor, constant: -60),
            starView.centerYAnchor.constraint(equalTo: introduceSceneBackgroundView.centerYAnchor, constant: -230),
            starView.widthAnchor.constraint(equalToConstant: 240),
            starView.heightAnchor.constraint(equalToConstant: 220),
            
            nextButton.rightAnchor.constraint(equalTo: introduceSceneBackgroundView.rightAnchor, constant: -30),
            nextButton.bottomAnchor.constraint(equalTo: introduceSceneBackgroundView.bottomAnchor, constant: -30),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
