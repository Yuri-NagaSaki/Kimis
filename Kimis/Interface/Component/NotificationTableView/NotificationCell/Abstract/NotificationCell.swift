//
//  NotificationCell.swift
//  Kimis
//
//  Created by Lakr Aream on 2022/11/30.
//

import Combine
import Source
import UIKit

class NotificationCell: TableViewCell {
    let container: UIView = .init()

    var context: Context?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(container)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let bounds = contentView.bounds
        let width = IH.containerWidth(usingWidth: bounds.width)
        let paddingInset = (bounds.width - width) / 2
        container.frame = CGRect(
            x: paddingInset,
            y: 0,
            width: width,
            height: bounds.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        context = nil
        contentView.backgroundColor = .clear
        setNeedsLayout()
    }

    func load(_ context: Context) {
        self.context = context
        setNeedsLayout()
    }
}
