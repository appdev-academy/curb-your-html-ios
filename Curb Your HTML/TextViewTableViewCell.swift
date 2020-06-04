//
//  TextViewTableViewCell.swift
//  Curb Your HTML
//
//  Created by Maksym Skliarov on 05.06.2020.
//  Copyright © 2020 App Dev Academy Ltd. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var textView: UITextView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}

extension TextViewTableViewCell: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    
    print("URL selected: ", URL.absoluteString)
    
    return true
  }
}
