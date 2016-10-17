//
//  CardCollectionViewCell.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/17.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

open class CardCollectionViewCell: UICollectionViewCell {
	
	private var cardContentImageView: UIImageView!
	private var cardTagViews: [UIView] = []
	private var cardImageBottomBar: UIView!
	private var eventParticipantImageViews: [UIImageView] = []
	
	private var cardContentContainerView: UIView!
	private var cardTopTitleLabel: UILabel!
	private var cardMainTitleLabel: UILabel!
	private var cardContentTimeIconImageView: UIImageView!
	private var cardContentTimeLabel: UILabel!
	private var cardContentLocationIconImageView: UIImageView!
	private var cardContentLocationLabel: UILabel!
	private var cardContentLinkIconImageView: UIImageView!
	private var cardContentLinkLabel: UILabel!
	private var cardContentDescriptionIconImageView: UIImageView!
	private var cardContentDescriptionLabel: UILabel!
	
	// MARK: - Initialization
	override public init(frame: CGRect) {
		super.init(frame: frame)
		
		configureCardContentImageView()
		configureCardContentContainerView()
		
		clipsToBounds = true
	}
	
	private func configureCardContentImageView() {
		cardContentImageView = UIImageView()
		cardContentImageView.frame.size.width = bounds.width
		cardContentImageView.frame.size.height = bounds.height * 0.5
		
		cardContentImageView.contentMode = .scaleAspectFill
		cardContentImageView.clipsToBounds = true
		cardContentImageView.layer.cornerRadius = 10.0
		
		cardContentImageView.image = UIImage(named: "r1.jpg")
		
		addSubview(cardContentImageView)
		
		configureCardImageBottomBar()
		configureEventParticipantImageViews()
	}
	
	private func configureCardImageBottomBar() {
		cardImageBottomBar = UIView()
		cardImageBottomBar.frame.size.width = cardContentImageView.bounds.width
		cardImageBottomBar.frame.size.height = 34.0
		
		cardImageBottomBar.frame.origin.y = cardContentImageView.bounds.height - cardImageBottomBar.bounds.height
		
		cardImageBottomBar.backgroundColor = UIColor.black.withAlphaComponent(0.4)
		
		cardContentImageView.addSubview(cardImageBottomBar)
	}
	
	private func configureCardContentContainerView() {
		cardContentContainerView = UIView()
		cardContentContainerView.frame.size.width = bounds.width
		cardContentContainerView.frame.size.height = bounds.height - cardContentImageView.bounds.height
		cardContentContainerView.frame.origin.y = cardContentImageView.bounds.maxY
		
		cardContentContainerView.layer.cornerRadius = 10.0
		
		cardContentContainerView.backgroundColor = randomColor()
		
		addSubview(cardContentContainerView)
	}
	
	private func configureEventParticipantImageViews() {
		for _ in 1...5 {
			eventParticipantImageViews.append(UIImageView())
		}
		eventParticipantImageViews.forEach { $0.frame.size = CGSize(width: 19, height: 19) }
		let participantSpacing: CGFloat = 5
		let initialOffset: CGFloat = 21
		_ = eventParticipantImageViews.reduce(initialOffset) { (offset, imageView) -> CGFloat in
			imageView.frame.origin.x = offset
			return imageView.frame.maxX + participantSpacing
		}
		eventParticipantImageViews.forEach { $0.center.y = cardImageBottomBar.bounds.height / 2 }
		eventParticipantImageViews.forEach { cardImageBottomBar.addSubview($0) }
		eventParticipantImageViews.forEach { $0.image = UIImage(named: "r1.jpg") }
	}
	
	fileprivate func randomColor() -> UIColor {
		let r = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		let g = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		let b = CGFloat(Int(arc4random() % 155) + 100) / 255.0
		return UIColor(red: r, green: g, blue: b, alpha: 1)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
