//
//  FigureDistanceApp.swift
//  FigureDistance
//
//  Created by 高橋智也 on 2023/02/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private var sceneView: ARSCNView!
    
    private var centerPosition = CGPoint(x: 0, y: 0)
    private var tapCount = 0
    private var startPosition: SIMD3<Float> = SIMD3(0, 0, 0)
    private var currentPosition: SIMD3<Float> = SIMD3(0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.scene = SCNScene()
        centerPosition = sceneView.center
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        
        sceneView.session.run(config)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        putSphere(at: currentPosition)
        guard tapCount != 0 else {
            startPosition = currentPosition
            tapCount = 1
            return
        }
        tapCount = 0
        let lineNode = drawLine(from: SCNVector3(startPosition), to: SCNVector3(currentPosition))
        sceneView.scene.rootNode.addChildNode(lineNode)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }
        let planeNode = SCNNode()
        let geometry = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        geometry.materials.first?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
        planeNode.geometry = geometry
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2.0, 1, 0, 0)
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }
        guard let geometryPlaneNode = node.childNodes.first, let planeGeometry = geometryPlaneNode.geometry as? SCNPlane else { fatalError() }
        planeGeometry.width = CGFloat(planeAnchor.extent.x)
        planeGeometry.height = CGFloat(planeAnchor.extent.z)
        geometryPlaneNode.simdPosition = SIMD3(planeAnchor.center.x, 0, planeAnchor.center.z)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        let hitResults = sceneView.hitTest(centerPosition, types: [.existingPlaneUsingExtent])
        guard !hitResults.isEmpty else { return }
        guard let hitResult = hitResults.first else { return }
        currentPosition = SIMD3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        if tapCount == 1 {
            let length = distance(startPosition, currentPosition)
            DispatchQueue.main.async {
                self.distanceLabel.text = String(format: "%.1f", length * 100)
            }
        }
    }
}

private extension ViewController {
    private func drawLine(from: SCNVector3, to: SCNVector3) -> SCNNode {
        let source = SCNGeometrySource(vertices: [from, to])
        let element = SCNGeometryElement(data: Data([0, 1]), primitiveType: .line, primitiveCount: 1, bytesPerIndex: 1)
        let geometry = SCNGeometry(sources: [source] , elements: [element])
        let node = SCNNode()
        node.geometry = geometry
        node.geometry?.materials.first?.diffuse.contents = UIColor.red
        return node
    }
    
    private func putSphere(at position: SIMD3<Float>) {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.0003)
        node.position = SCNVector3(position.x, position.y, position.z)
        sceneView.scene.rootNode.addChildNode(node)
    }
}
