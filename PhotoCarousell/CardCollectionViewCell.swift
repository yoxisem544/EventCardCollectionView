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
	private var cardTagViews: [CardTagView] = []
	private var cardImageBottomBar: UIView!
	private var eventParticipantImageViews: [UIImageView] = []
	private var eventParticipantExtraInfoLabel: UILabel!
	
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
	
	public var imageName: String? {
		didSet {
			cardContentImageView.image = UIImage(named: imageName ?? "")
		}
	}
	
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
	
	private func configureCardContentContainerView() {
		cardContentContainerView = UIView()
		cardContentContainerView.frame.size.width = bounds.width
		cardContentContainerView.frame.size.height = bounds.height - cardContentImageView.bounds.height
		cardContentContainerView.frame.origin.y = cardContentImageView.bounds.maxY
		
		cardContentContainerView.layer.cornerRadius = 10.0
		
		cardContentContainerView.backgroundColor = randomColor()
		
		addSubview(cardContentContainerView)
		
		configureCardTopTitleLabel()
		configureCardMainTitleLabel()
		configureCardContentTimeLabel()
		configureCardContentLocationLabel()
		configureCardContentLinkLabel()
		configureCardContentDescriptionLabel()
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
	
	private func configureCardTopTitleLabel() {
		cardTopTitleLabel = UILabel()
		let leftMargin: CGFloat = 24
		cardTopTitleLabel.frame.size.width = bounds.width - leftMargin * 2
		cardTopTitleLabel.frame.size.height = 11
		cardTopTitleLabel.frame.origin.x = leftMargin
		cardTopTitleLabel.frame.origin.y = leftMargin
		
		cardTopTitleLabel.font = UIFont.systemFont(ofSize: 11)
		cardTopTitleLabel.textColor = UIColor.orange
		
		cardTopTitleLabel.text = String.arbitrary(forLength: 10)
		
		cardContentContainerView.addSubview(cardTopTitleLabel)
	}
	
	private func configureCardMainTitleLabel() {
		cardMainTitleLabel = UILabel()
		let leftMargin: CGFloat = 24
		cardMainTitleLabel.frame.size.width = bounds.width - leftMargin * 2
		cardMainTitleLabel.frame.size.height = 20
		cardMainTitleLabel.frame.origin.x = leftMargin
		let topSpacing: CGFloat = 4
		cardMainTitleLabel.move(topSpacing, pointBelow: cardTopTitleLabel)
		
		cardMainTitleLabel.font = UIFont.systemFont(ofSize: 20)
		cardMainTitleLabel.textColor = UIColor.orange
		
		cardMainTitleLabel.text = String.arbitrary(forLength: 20)
		
		cardContentContainerView.addSubview(cardMainTitleLabel)
	}
	
	private func configureCardContentTimeLabel() {
		cardContentTimeLabel = UILabel()
		let leftMargin: CGFloat = 44.0
		let rightMargin: CGFloat = 24.0
		cardContentTimeLabel.frame.size.width = bounds.width - leftMargin - rightMargin
		cardContentTimeLabel.frame.size.height = 14
		cardContentTimeLabel.frame.origin.x = leftMargin
		let topSpacing: CGFloat = 24
		cardContentTimeLabel.move(topSpacing, pointBelow: cardMainTitleLabel)
		
		cardContentTimeLabel.font = UIFont.systemFont(ofSize: 14)
		cardContentTimeLabel.textColor = UIColor.gray
		
		cardContentTimeLabel.text = String.arbitrary(forLength: 10)
		
		cardContentContainerView.addSubview(cardContentTimeLabel)
	}
	
	private func configureCardContentLocationLabel() {
		cardContentLocationLabel = UILabel()
		let leftMargin: CGFloat = 44.0
		let rightMargin: CGFloat = 24.0
		cardContentLocationLabel.frame.size.width = bounds.width - leftMargin - rightMargin
		cardContentLocationLabel.frame.size.height = 14
		cardContentLocationLabel.frame.origin.x = leftMargin
		let topSpacing: CGFloat = 8
		cardContentLocationLabel.move(topSpacing, pointBelow: cardContentTimeLabel)
		
		cardContentLocationLabel.font = UIFont.systemFont(ofSize: 14)
		cardContentLocationLabel.textColor = UIColor.cyan
		
		cardContentLocationLabel.text = String.arbitrary(forLength: 10)
		
		cardContentContainerView.addSubview(cardContentLocationLabel)
	}
	
	private func configureCardContentLinkLabel() {
		cardContentLinkLabel = UILabel()
		let leftMargin: CGFloat = 44.0
		let rightMargin: CGFloat = 24.0
		cardContentLinkLabel.frame.size.width = bounds.width - leftMargin - rightMargin
		cardContentLinkLabel.frame.size.height = 14
		cardContentLinkLabel.frame.origin.x = leftMargin
		let topSpacing: CGFloat = 8
		cardContentLinkLabel.move(topSpacing, pointBelow: cardContentLocationLabel)
		
		cardContentLinkLabel.font = UIFont.systemFont(ofSize: 14)
		cardContentLinkLabel.textColor = UIColor.cyan
		
		cardContentLinkLabel.text = String.arbitrary(forLength: 10)
		
		cardContentContainerView.addSubview(cardContentLinkLabel)
	}
	
	private func configureCardContentDescriptionLabel() {
		cardContentDescriptionLabel = UILabel()
		let leftMargin: CGFloat = 44.0
		let rightMargin: CGFloat = 24.0
		cardContentDescriptionLabel.frame.size.width = bounds.width - leftMargin - rightMargin
		cardContentDescriptionLabel.frame.origin.x = leftMargin
		let topSpacing: CGFloat = 8
		let bottomSpacing: CGFloat = 24
		cardContentDescriptionLabel.move(topSpacing, pointBelow: cardContentLinkLabel)
		cardContentDescriptionLabel.frame.size.height =
			(cardContentContainerView.bounds.height - cardContentLinkLabel.frame.maxY)
			- topSpacing
			- bottomSpacing
		
		let fontSize: CGFloat = 14
		cardContentDescriptionLabel.font = UIFont.systemFont(ofSize: fontSize)
		cardContentDescriptionLabel.textColor = UIColor.gray
		cardContentDescriptionLabel.numberOfLines = Int(cardContentDescriptionLabel.bounds.height / fontSize)
		
		cardContentDescriptionLabel.text = String.arbitrary(forLength: 120)
		
		cardContentContainerView.addSubview(cardContentDescriptionLabel)
	}
	
	fileprivate func randomColor() -> UIColor {
		let colorRange = 100
		let r = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		let g = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		let b = CGFloat(Int(arc4random()) % colorRange + 255 - colorRange) / 255.0
		return UIColor(red: r, green: g, blue: b, alpha: 1)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
