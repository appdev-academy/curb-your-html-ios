//
//  ViewController.swift
//  Curb Your HTML
//
//  Created by Maksym Skliarov on 05.06.2020.
//  Copyright © 2020 App Dev Academy Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var htmlTableView: UITableView!
  
  // MARK: - Constants
  
  private let labelCellIdentifier = "LabelTableViewCell"
  private let textViewCellIdentifier = "TextViewTableViewCell"
  
  private let tips: [String] = [
    "<p>Our video player has a child lock, but it&rsquo;s limited by what Apple allows us - so your child can still access notifications and the app-switching taskbar. Fortunately, Apple has a feature to let you totally lock you phone screen - it&rsquo;s called Guided Access and turning it on is really easy. Just check out this Apple support article (https://support.apple.com/en-us/HT202612) and you&rsquo;ll be safe totally handing your device off to your child!</p>",
    "<p>Infantio animations are great for solo engagement, but you can also narrate them to your child and explain what&rsquo;s happening. Point and say things like, &ldquo;Look the little red balls are falling through the holes! The big black balls don&rsquo;t fit - they roll over the holes!&rdquo; Don&rsquo;t worry if your child doesn&rsquo;t understand what you&rsquo;re saying &ndash;&nbsp;they&rsquo;ll know you&rsquo;re describing something in the animation which is useful in itself - sort of like reading a book at bedtime! It&rsquo;s also a great way to spend time with you baby : )</p>",
    "<p><span style='color: #f1c40f;'><span style='background-color: #000000;'>Hello</span>😀</span>&nbsp;<span style='text-decoration: underline;'>This</span> <strong>is <em>a first</em></strong> <em>Tip!</em> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>"
  ]
  
  // MARK: - Variables
  
  private var loaded: Bool = false
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Actions
  
  @IBAction func loadHTML(_ sender: UIBarButtonItem) {
    loaded.toggle()
    htmlTableView.reloadData()
  }
  
  // MARK: - Helpers
  
  func attributedDocument(for index: Int) -> NSAttributedString {
    let tip = tips[index]
    let document = "<html><head><meta name='viewport' content='width=device-width, initial-scale=1'><style>*{ font-family: 'Futura'; font-size: 2.4vw;}</style></head><body>\(tip)</body></html>"
    
    // Encode HTML document into Data object
    guard let data = document.data(using: .unicode) else {
      return NSAttributedString(string: "Document encoding error.")
    }
    
    // Options for rendering HTML into NSAttributedString
    let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
    
    do {
      let attributedString = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
      return attributedString
    } catch {
      return NSAttributedString(string: "Document rendering error.")
    }
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tips.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if loaded {
      let attributedText = attributedDocument(for: indexPath.row)
      
      if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: textViewCellIdentifier, for: indexPath) as! TextViewTableViewCell
        cell.textView.attributedText = attributedText
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: labelCellIdentifier, for: indexPath) as! LabelTableViewCell
        cell.contentLabel.attributedText = attributedText
        return cell
      }
    } else {
      if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: textViewCellIdentifier, for: indexPath) as! TextViewTableViewCell
        cell.textView.text = "\(indexPath.section):\(indexPath.row)"
        return cell
      } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: labelCellIdentifier, for: indexPath) as! LabelTableViewCell
        cell.contentLabel.text = "\(indexPath.section):\(indexPath.row)"
        return cell
      }
    }
  }
}
