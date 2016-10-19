//
//  CardImageContentContainerView.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/19.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

final public class CardImageContentContainerView: UIView {
	
	private var cardContentImageView: UIImageView!
	private var cardTagViews: [CardTagView] = []
	private var cardImageBottomBar: UIView!
	private var eventParticipantImageViews: [UIImageView] = []
	private var eventParticipantExtraInfoLabel: UILabel!
	
	// MARK: - Init
	public override init(frame: CGRect) {
		super.init(frame: frame)
		configureCardContentImageView()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureCardContentImageView() {
		cardContentImageView = UIImageView()
		cardContentImageView.frame.size = bounds.size
		
		cardContentImageView.contentMode = .scaleAspectFill
		cardContentImageView.clipsToBounds = true
		cardContentImageView.layer.cornerRadius = 10.0
		
		cardContentImageView.image = UIImage(named: "r1.jpg")
		
		addSubview(cardContentImageView)
		
		configureCardImageBottomBar()
		configureEventParticipantImageViews()
		configureEventParticipantExtraInfoLabel()
		configureCardTagViews()
	}
	
	private func configureCardImageBottomBar() {
		cardImageBottomBar = UIView()
		cardImageBottomBar.frame.size.width = cardContentImageView.bounds.width
		cardImageBottomBar.frame.size.height = 34.0
		
		cardImageBottomBar.frame.origin.y = cardContentImageView.bounds.height - cardImageBottomBar.bounds.height
		
		cardImageBottomBar.backgroundColor = UIColor.black.withAlphaComponent(0.4)
		
		cardContentImageView.addSubview(cardImageBottomBar)
	}
	
	private func configureCardTagViews() {
		for _ in 1...5 {
			cardTagViews.append(CardTagView())
		}
		let initialPosition: CGFloat = 18
		let spacing: CGFloat = 6
		_ = cardTagViews.reduce(initialPosition) { (offset, tag) -> CGFloat in
			tag.frame.origin.x = offset
			return tag.frame.maxX + spacing
		}
		cardTagViews.forEach {
			$0.color = randomColor()
			$0.title = String.arbitrary(forLength: 5)
			$0.move(4, pointTopOf: cardImageBottomBar)
			cardContentImageView.addSubview($0)
		}
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
		eventParticipantImageViews.forEach {
			$0.center.y = cardImageBottomBar.bounds.height / 2
			cardImageBottomBar.addSubview($0)
			$0.image = UIImage(named: "r1.jpg")
			$0.clipsToBounds = true
			$0.contentMode = .scaleAspectFill
			$0.layer.cornerRadius = $0.bounds.width / 2
		}
	}
	
	private func configureEventParticipantExtraInfoLabel() {
		eventParticipantExtraInfoLabel = UILabel()
		let spacing: CGFloat = 8
		eventParticipantExtraInfoLabel.frame.size.width =
			cardImageBottomBar.bounds.width
			- (eventParticipantImageViews.last?.frame.maxX ?? 0.0)
			- 2 * spacing
		eventParticipantExtraInfoLabel.frame.size.height = 14
		
		eventParticipantExtraInfoLabel.font = UIFont.systemFont(ofSize: 12)
		eventParticipantExtraInfoLabel.textColor = UIColor.white
		
		eventParticipantExtraInfoLabel.frame.origin.x = (eventParticipantImageViews.last?.frame.maxX ?? 0.0) + spacing
		eventParticipantExtraInfoLabel.center.y = cardImageBottomBar.bounds.height / 2
		
		eventParticipantExtraInfoLabel.text = String.arbitrary(forLength: 12)
		
		cardImageBottomBar.addSubview(eventParticipantExtraInfoLabel)
	}
	
	fileprivate func randomColor() -> UIColor {
		let colorRange = 100
		let r = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		let g = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		let b = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		return UIColor(red: r, green: g, blue: b, alpha: 1)
	}
	
}
