//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import ARKit
import RealityKit

class MyViewController : UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    
    var sceneView = ARSCNView()
        
    override func loadView() {
        setupView()
    }
    
    func setupView(){
        self.view = sceneView
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        sceneView.session.run(configuration)
        
        sceneView.session.delegate = self
        
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showFeaturePoints
        
        
    }
    
    func createBall(position : SCNVector3){
        let ballName = ["1-ball","8-ball"][Int(arc4random_uniform(2))]
        guard let url = Bundle.main.url(forResource: ballName, withExtension: "usdz")else{
            fatalError()
        }
        
        let scene = try! SCNScene(url: url, options: [.checkConsistency: true])
        
        let ballNode = scene.rootNode
        ballNode.position = position
        
        sceneView.scene.rootNode.addChildNode(ballNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = sceneView.hitTest(touch.location(in: sceneView), types: .featurePoint )
        guard let hitFeature = results.last else { return }
        let hitTrasform = SCNMatrix4.init(hitFeature.worldTransform)
        let hitPosition = SCNVector3(hitTrasform.m41, hitTrasform.m42, hitTrasform.m43)
        
        DispatchQueue.main.async {
            self.createBall(position: hitPosition)
        }
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
