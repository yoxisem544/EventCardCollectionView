//
//  CardCollectionViewCell.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/17.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

open class CardCollectionViewCell: UICollectionViewCell {
	
	private var cardImageContentContainerView: CardImageContentContainerView!
	private var cardContentContainerView: CardContentContainerView!
	
	// MARK: - Initialization
	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		configureCardContentImageView()
		configureCardContentContainerView()
		
		clipsToBounds = true
	}
	
	private func configureCardContentImageView() {
		let size: CGSize = CGSize(width: bounds.width, height: bounds.height * 0.5)
		let rect: CGRect = CGRect(origin: CGPoint.zero, size: size)
		cardImageContentContainerView = CardImageContentContainerView(frame: rect)
		addSubview(cardImageContentContainerView)
	}
	
	private func configureCardContentContainerView() {
		let origin: CGPoint = CGPoint(x: 0, y: cardImageContentContainerView.frame.maxY)
		let size: CGSize = CGSize(width: bounds.width, height: bounds.height - cardImageContentContainerView.frame.maxY)
		let rect: CGRect = CGRect(origin: origin, size: size)
		cardContentContainerView = CardContentContainerView(frame: rect)
		addSubview(cardContentContainerView)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
