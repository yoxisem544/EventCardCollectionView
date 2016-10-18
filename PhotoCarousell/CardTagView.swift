//
//  CardTagView.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/18.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

final public class CardTagView: UIView {
	
	private var tagTitleLabel: UILabel!
	
	public var title: String? {
		didSet {
			tagTitleLabel.text = title
		}
	}
	
	public var color: UIColor? {
		didSet {
			backgroundColor = color
		}
	}

	// MARK: - Init
	public convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 44, height: 21))
		configureTagTitleLabel()
		backgroundColor = UIColor.cyan
	}
	
	private override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureTagTitleLabel() {
		tagTitleLabel = UILabel()
		tagTitleLabel.frame.size = bounds.size
		
		tagTitleLabel.font = UIFont.systemFont(ofSize: 14)
		tagTitleLabel.textColor = UIColor.white
		tagTitleLabel.textAlignment = .center
		
		addSubview(tagTitleLabel)
	}
	
}
