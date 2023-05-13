import Foundation
import UIKit

public class GameViewController: UIViewController{
    let gameView = UIView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        gameView.clipsToBounds = true
        gameView.layer.cornerRadius = 8.0
        gameView.backgroundColor = .red //color未定义，这里暂时用红色代替
        self.view.addSubview(gameView)
        gameView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            gameView.widthAnchor.constraint(equalToConstant: 300),
            gameView.heightAnchor.constraint(equalToConstant: 460)
        ])
    }
}
