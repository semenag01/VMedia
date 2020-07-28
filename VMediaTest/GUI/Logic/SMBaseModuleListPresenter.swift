//
//  SMBaseModuleListPresenter.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import VRGSoftSwiftIOSKit

protocol SMBaseModuleListPresenterProtocol {

}

class SMBaseModuleListPresenter: SMBasePresenter, SMModuleListDelegate {

	var moduleList: SMModuleList?

	override func viewDidLoad() {

		super.viewDidLoad()
	}

	func setupListAdapter(_ aListAdapter: SMListAdapter) {

		moduleList = self.classModuleList().init(listAdapter: aListAdapter)
		moduleList?.delegate = self
		moduleList?.pullToRefreshAdapter = SMNativePullToRefreshAdapter()
		moduleList?.activityAdapter = vc.activity

		if let moduleList: SMModuleListPaging = moduleList as? SMModuleListPaging {

			let maxColumns: Int = Int((UIScreen.main.bounds.width - 8)/122)
			let maxLines: Int = Int((UIScreen.main.bounds.height - 8)/224)
			let pageSize: Int = maxColumns * (maxLines + 1)

			moduleList.pageSize = max(pageSize, 21)
			moduleList.isItemsAsPage = false
		}

		if let listView: UIScrollView = aListAdapter.listDisposer.listView {

			moduleList?.configureWith(scrollView: listView)
		}

		moduleList?.fetcherFailedCallback = { [weak self] _, aResponse in

			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				self?.vc.showAlertWith(error: aResponse.error)
			}
		}
	}

	func classModuleList() -> SMModuleList.Type {

		return SMModuleList.self
	}

	override func firstViewWillAppear(_ animated: Bool) {

		let fetcher: SMDataFetcherProtocol? = defaultFetcher()
		moduleList?.dataFetcher = fetcher

		super.firstViewWillAppear(animated)
	}

	override func reloadData() {

		super.reloadData()

		moduleList?.reloadData()
	}

	func defaultFetcher() -> SMDataFetcherProtocol? {

		return nil
	}


	// MARK: SMModuleListDelegate

	func fetcherMessageFor(moduleList aModule: SMModuleList) -> SMFetcherMessage {

		let result: SMFetcherMessage = aModule.fetcherMessageClass.init()

		return result
	}

	func willReload(moduleList aModule: SMModuleList) {

	}

	func moduleList(_ aModule: SMModuleList, processFetchedModelsInResponse aResponse: SMResponse) -> [AnyObject] {

		return aResponse.boArray
	}

	func moduleList(_ aModule: SMModuleList, didReloadDataWithModels aModels: [AnyObject]) {

	}
}
