//
//  TTARViewController.swift
//  CollectorReborn
//
//  Created by Wellison Pereira on 6/27/19.
//  Copyright © 2019 ToraCross Studios. All rights reserved.
//

import UIKit
import ARKit

class TTARViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var sceneView: ARSCNView!
    
    // Variables
    var card: TTCards?
    private var planeNodes: [SCNNode] = []
    private let imageView = UIImageView()
    private var imageNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNode()
        configureScene()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // Functions
    private func configureScene() {
        navigationItem.title = "AR Viewer"
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        guard ARConfiguration.isSupported else {
            Error.presentError(error: .arNotSupported) { (_) in
                self.navigationController?.popViewController(animated: true)
            }
            return
        }
        
        sceneView.session.run(configuration)
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    private func createNode() {
        imageView.setImageFromURL(string: card?.image)
        imageNode = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
        imageNode.geometry?.firstMaterial?.diffuse.contents = imageView.image
    }
    
}

extension TTARViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard planeNodes.isEmpty, let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)
        
        plane.firstMaterial?.diffuse.contents = FFXIVTheme.AchievementColor.starColor.withAlphaComponent(0.2)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.name = "Plane"
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
        planeNodes.append(planeNode)
        node.addChildNode(planeNode)
        
        let newNode = SCNNode()
        node.addChildNode(newNode)
        newNode.position = SCNVector3(x, y + 0.1, z)
        newNode.addChildNode(imageNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane,
            planeNodes.isEmpty
            else { return }
        
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
    }
}
