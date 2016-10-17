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
	}
	
	private func configureCardContentImageView() {
		cardContentImageView = UIImageView()
		cardContentImageView.frame.size.width = bounds.width
		cardContentImageView.frame.size.height = bounds.height * 0.5
		
		cardContentImageView.image = UIImage(named: "r1.jpg")
		
		addSubview(cardContentImageView)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
