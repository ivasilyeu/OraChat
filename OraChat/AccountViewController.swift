//
//  AccountViewController.swift
//  OraChat
//
//  Created by Igor Vasilev on 11/11/16.
//  Copyright © 2016 Productive Edge. All rights reserved.
//

import UIKit

class AccountViewController: UITableViewController {
	
	var info = AccountInfo()
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		weak var weakSelf = self
		tableListener = TextFieldTableListener(item: info, preparingTable: tableView!) {
			
			(newInfo: AccountInfo) in
			
			guard let strongSelf = weakSelf else {return}
			strongSelf.info = newInfo
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		weak var weakSelf = self
		webservice.load(AccountInfo.me) {
			(result: AccountInfo?, error: Error?) in
			
			guard let strongSelf = weakSelf else {return}
			
			if let newInfo = result {
				
				strongSelf.info = newInfo
				strongSelf.updateView()
			}
			else {
				strongSelf.handle(error: error!)
			}
		}
	}
	
	private func updateView() {
		
		guard isViewLoaded else {return}

		/*
		Update table stuff
		*/
		tableListener.item = info
		tableView.reloadData()
	}
	
	private var tableListener: TextFieldTableListener<AccountInfo>!
}

//MARK:- Actions

private extension AccountViewController {
	
	@IBAction func onEdit() {
		
		weak var weakSelf = self
		webservice.load(info.edit) {
			
			(result: Void?, error: Error?) in

			guard let strongSelf = weakSelf else {return}
			guard let _ = result else {
				strongSelf.handle(error: error!)
				return
			}
		}
	}
}
