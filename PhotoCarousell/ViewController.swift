//
//  ViewController.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/4.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
	
	private var photoCarousellCollectionView: UICollectionView!
	private var photoCarousellCollectionViewFlowLayout: UICollectionViewFlowLayout!
	fileprivate let datumn: [String] = ["","","","",""]
//	fileprivate let datumn: [String] = ["","","","","","","","","","","","","","","","",""]
	fileprivate let cellIdentifier = "cell"
	let width: CGFloat = UIScreen.main.bounds.width * 0.7
	let itemSpacing: CGFloat = 20

	override public func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// setup collection view flow layout
		photoCarousellCollectionViewFlowLayout = UICollectionViewFlowLayout()
		photoCarousellCollectionViewFlowLayout.itemSize = CGSize(width: width, height: width * 2)
		photoCarousellCollectionViewFlowLayout.scrollDirection = .horizontal
		photoCarousellCollectionViewFlowLayout.minimumLineSpacing = itemSpacing
		photoCarousellCollectionViewFlowLayout.minimumInteritemSpacing = 0
		
		// setup collection view
		photoCarousellCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: width * 2),
		                                                collectionViewLayout: photoCarousellCollectionViewFlowLayout)
		
		photoCarousellCollectionView.backgroundColor = UIColor.white
		photoCarousellCollectionView.clipsToBounds = false
		photoCarousellCollectionView.decelerationRate = 0.0
		
		photoCarousellCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
		photoCarousellCollectionView.dataSource = self
		photoCarousellCollectionView.delegate = self
		
		photoCarousellCollectionView.layer.borderColor = UIColor.red.cgColor
		photoCarousellCollectionView.layer.borderWidth = 3.0
		
		photoCarousellCollectionView.center = view.center
		
		view.addSubview(photoCarousellCollectionView)
	}
	
	public override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		moveCardToInitalLocation()
	}

	override public func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	fileprivate func randomColor() -> UIColor {
		let r = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		let g = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		let b = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		return UIColor(red: r, green: g, blue: b, alpha: 1)
	}
	
	fileprivate func handleEndDrag(_ scrollView: UIScrollView) {
		moveCard(toRawOffset: scrollView.contentOffset.x)
	}

	fileprivate func moveCard(to cardPosition: CGFloat) {
		print(#function, "is moving to ", cardPosition)
		guard cardPosition >= 0.0 else {
			moveCard(to: 0.0)
			return
		}
		guard cardPosition <= CGFloat(photoCarousellCollectionView.numberOfItems(inSection: 0) - 1) else {
			moveCard(to: CGFloat(photoCarousellCollectionView.numberOfItems(inSection: 0) - 1))
			return
		}
		let initialOffsetX: CGFloat = photoCarousellCollectionView.bounds.width / 2 - (width / 2)
		let remainder = cardPosition.truncatingRemainder(dividingBy: 1.0)
		print("remainder: \(remainder)")
		let nextPosition = remainder >= 0.5 ? ceil(cardPosition) : floor(cardPosition)
		let nextOffset: CGFloat = nextPosition * (width + itemSpacing) - initialOffsetX
		let contentOffset: CGPoint = CGPoint(x: nextOffset, y: 0)
		photoCarousellCollectionView.setContentOffset(contentOffset, animated: true)
	}
	
	fileprivate func moveCardToInitalLocation() {
		moveCard(to: 0.0)
	}
	
	fileprivate func moveCard(toRawOffset offset: CGFloat) {
		let initialOffsetX: CGFloat = photoCarousellCollectionView.bounds.width / 2 - (width / 2)
		let contentOffsetX = offset + initialOffsetX
		let currentEndDragPosition: CGFloat = contentOffsetX / (width + itemSpacing)
		print(#function, currentEndDragPosition, contentOffsetX)
		moveCard(to: currentEndDragPosition)
	}
	
}

extension ViewController : UICollectionViewDelegate {
	
}

extension ViewController : UICollectionViewDataSource {

	public func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return datumn.count
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
		cell.backgroundColor = randomColor()
		cell.layer.cornerRadius = 18
		return cell
	}
	
}

extension ViewController : UIScrollViewDelegate {
	
	public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
		handleEndDrag(scrollView)
	}
	
	public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		moveCard(toRawOffset: targetContentOffset.pointee.x)
	}
	
}
