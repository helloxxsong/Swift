import Foundation
import UIKit

public class GameViewController : UIViewController{
    public override func loadView() {
        //设置底层View
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        self.view = view
        
        //设置gameView
        let gameView = UIView()
        //设置为紧贴边缘
        gameView.clipsToBounds = true
        //设置圆角度数为8。0
        gameView.layer.cornerRadius = 8.0
        //设置背景色
        gameView.layer.backgroundColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        //将gameView添加到主视图中
        self.view.layer.addSubview(gameView)
    }
}
