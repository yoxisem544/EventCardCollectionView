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
//	fileprivate let datumn: [String] = ["","","","",""]
	fileprivate let datumn: [String] = ["r1.jpg",
	                                    "p1.jpg",
	                                    "p2.jpg",
	                                    "p3.jpg",
	                                    "p2.jpg",
	                                    "p1.jpg",
	                                    "p2.jpg",
	                                    "p3.jpg",
	                                    "p2.jpg",
	                                    "p1.jpg",
	                                    "p2.jpg",
	                                    "p3.jpg"]
	fileprivate let cellIdentifier = "cell"
	let width: CGFloat = UIScreen.main.bounds.width * 0.8
	let itemSpacing: CGFloat = 12
	fileprivate var markedCardOffsetX: CGFloat = 0.0

	override public func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// setup collection view flow layout
		photoCarousellCollectionViewFlowLayout = UICollectionViewFlowLayout()
		photoCarousellCollectionViewFlowLayout.itemSize = CGSize(width: width, height: width * 1.5)
		photoCarousellCollectionViewFlowLayout.scrollDirection = .horizontal
		photoCarousellCollectionViewFlowLayout.minimumLineSpacing = itemSpacing
		photoCarousellCollectionViewFlowLayout.minimumInteritemSpacing = 0
		
		// setup collection view
		photoCarousellCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: width * 2),
		                                                collectionViewLayout: photoCarousellCollectionViewFlowLayout)
		
		photoCarousellCollectionView.backgroundColor = UIColor.white
		photoCarousellCollectionView.clipsToBounds = false
		photoCarousellCollectionView.decelerationRate = 0.0
		photoCarousellCollectionView.showsHorizontalScrollIndicator = false
		
		photoCarousellCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
		photoCarousellCollectionView.dataSource = self
		photoCarousellCollectionView.delegate = self
		
		photoCarousellCollectionView.center = view.center
		
		view.addSubview(photoCarousellCollectionView)
	}
	
	public override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * 1.0)) / Double(NSEC_PER_SEC)
		DispatchQueue.main.asyncAfter(deadline: delay, execute: {
			self.moveCard(to: 3.0, animated: false)
			self.moveCardToInitalLocation()
		})
	}

	@IBAction func previoudButtonClicked(_ sender: Any) {
		moveToPreviousCard()
	}
	
	@IBAction func nextButtonClicked(_ sender: Any) {
		moveToNextCard()
	}
	
	@IBAction func veryFirstButtonClicked(_ sender: Any) {
		moveCard(to: 0.0)
	}
	
	@IBAction func veryLastButtonClicked(_ sender: Any) {
		moveCard(to: CGFloat(DBL_MAX))
	}
	
	@IBAction func goToMapClicked(_ sender: Any) {
		
		
		let alert = UIAlertController(title: "開啟地圖", message: "請問你要使用甚麼地圖開啟？", preferredStyle: UIAlertControllerStyle.actionSheet)
		let gmap = UIAlertAction(title: "Google map", style: UIAlertActionStyle.default, handler: { action in
			if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://") as! URL)) {
				UIApplication.shared.openURL(NSURL(string:
					"comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic")! as URL)
				
			}
		})
		let applemap = UIAlertAction(title: "Apple map", style: UIAlertActionStyle.default, handler: { action in
			if (UIApplication.shared.canOpenURL(NSURL(string:"http://maps.apple.com") as! URL)) {
				UIApplication.shared.openURL(NSURL(string:
					"http://maps.apple.com/?q=Mexican+Restaurant&sll=50.894967,4.341626&z=10&t=s")! as URL)
			}
		})
		let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
		alert.addAction(gmap)
		alert.addAction(applemap)
		alert.addAction(cancel)
		DispatchQueue.main.async { self.present(alert, animated: true, completion: nil) }
	}
	
	override public func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	fileprivate func handleEndDrag(_ scrollView: UIScrollView) {
		moveCard(toRawOffset: scrollView.contentOffset.x)
	}

	fileprivate func moveCard(to cardPosition: CGFloat, animated: Bool = true) {
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
//		let nextPosition = remainder >= 0.5 ? ceil(cardPosition) : floor(cardPosition)
		let nextPosition = { () -> CGFloat in
			let flipSensitiveConstant: CGFloat = 0.1
			if markedCardOffsetX > cardPosition {
				// move backward
				// flip : stay on same page
				return remainder < 1.0 - flipSensitiveConstant ? max(0.0, floor(cardPosition)) : ceil(cardPosition)
			} else {
				// move forward
				print("is going to next page")
				// flip : stay on same page
				return remainder > flipSensitiveConstant ? ceil(cardPosition) : floor(cardPosition)
			}
		}()
		print("next position \(nextPosition)")
		print("")
		let nextOffset: CGFloat = nextPosition * (width + itemSpacing) - initialOffsetX
		let contentOffset: CGPoint = CGPoint(x: nextOffset, y: 0)
		photoCarousellCollectionView.setContentOffset(contentOffset, animated: animated)
	}
	
	fileprivate func moveCardToInitalLocation() {
		moveCard(to: 0.0, animated: true)
	}
	
	fileprivate func moveToPreviousCard() {
		moveCard(to: getCurrentCardPosition() - 1.0)
	}
	
	fileprivate func moveToNextCard() {
		moveCard(to: getCurrentCardPosition() + 1.0)
	}
	
	fileprivate func getCurrentCardPosition() -> CGFloat {
		let initialOffsetX: CGFloat = photoCarousellCollectionView.bounds.width / 2 - (width / 2)
		let contentOffsetX = photoCarousellCollectionView.contentOffset.x + initialOffsetX
		let currentEndDragPosition: CGFloat = contentOffsetX / (width + itemSpacing)
		return currentEndDragPosition
	}
	
	fileprivate func moveCard(toRawOffset offset: CGFloat) {
		let initialOffsetX: CGFloat = photoCarousellCollectionView.bounds.width / 2 - (width / 2)
		let contentOffsetX = offset + initialOffsetX
		let currentEndDragPosition: CGFloat = contentOffsetX / (width + itemSpacing)
//		print(#function, currentEndDragPosition, contentOffsetX)
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
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CardCollectionViewCell
//		cell.imageName = datumn[indexPath.row]
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
	
	public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		markedCardOffsetX = getCurrentCardPosition()
	}
	
}
