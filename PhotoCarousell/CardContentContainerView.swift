//
//  CardContentContainerView.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/19.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

final public class CardContentContainerView: UIView {
	
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

	// MARK: - Init
	public override init(frame: CGRect) {
		super.init(frame: frame)
		
		layer.cornerRadius = 10.0
		
		configureCardTopTitleLabel()
		configureCardMainTitleLabel()
		configureCardContentTimeLabel()
		configureCardContentLocationLabel()
		configureCardContentLinkLabel()
		configureCardContentDescriptionLabel()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
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
		
		addSubview(cardTopTitleLabel)
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
		
		addSubview(cardMainTitleLabel)
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
		
		addSubview(cardContentTimeLabel)
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
		
		addSubview(cardContentLocationLabel)
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
		
		addSubview(cardContentLinkLabel)
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
			(bounds.height - cardContentLinkLabel.frame.maxY)
			- topSpacing
			- bottomSpacing
		
		let fontSize: CGFloat = 14
		cardContentDescriptionLabel.font = UIFont.systemFont(ofSize: fontSize)
		cardContentDescriptionLabel.textColor = UIColor.gray
		cardContentDescriptionLabel.numberOfLines = Int(cardContentDescriptionLabel.bounds.height / fontSize)
		
		cardContentDescriptionLabel.text = String.arbitrary(forLength: 120)
		
		addSubview(cardContentDescriptionLabel)
	}
	
}
