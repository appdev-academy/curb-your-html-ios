//
//  LabelTableViewCell.swift
//  Curb Your HTML
//
//  Created by Maksym Skliarov on 05.06.2020.
//  Copyright © 2020 App Dev Academy Ltd. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var contentLabel: UILabel!
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
