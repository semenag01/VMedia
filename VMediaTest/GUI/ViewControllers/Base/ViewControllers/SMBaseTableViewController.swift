//
//  SMBaseTableViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit


protocol SMTableSectionsProtocol {
    
    func setupSections(_ aSections: [SMSectionReadonly])
    func reloadView()
}

protocol SMListMapProtocol {

    func mapToObject()
}


class SMBaseTableViewController: SMBaseListViewController, SMTableDisposerDelegate, SMTableSectionsProtocol, SMListMapProtocol {

    var tableView: UITableView? { return listView as? UITableView }

    var tableDisposer: SMTableDisposer? { return listDisposer as? SMTableDisposer }

    override func viewDidLoad() {

        super.viewDidLoad()

		view.backgroundColor = .white
    }

    override func createListView() -> UITableView {

        let result: UITableView = UITableView(frame: self.frameListView(), style: .plain)

		result.backgroundColor = .white

        return result
    }

    override func configureListView() {

        super.configureListView()

        if let listView: UITableView = listView as? UITableView {

            listView.tableHeaderView = createTableViewHeader()
            listView.tableHeaderView?.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]

            listView.tableFooterView = createTableViewFooter()
            listView.tableFooterView?.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]

            listView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    override func createListDisposer() -> SMListDisposer? {

        let result: SMTableDisposer = SMTableDisposer()

        return result
    }

    override func configureListDisposer() {

        super.configureListDisposer()

        tableDisposer?.delegate = self
    }

    func createTableViewHeader() -> UIView? {

        return nil
    }

    func createTableViewFooter() -> UIView? {

        return UIView()
    }


    // MARK: SMListMapProtocol

    func mapToObject() {

        if let tableDisposer: SMTableDisposerMapped = tableDisposer as? SMTableDisposerMapped {

            tableDisposer.mapToObject()
        }
    }

    func insertCellData(_ cellData: SMCellData, atIndexPath indexPath: IndexPath, withAnimation aAnimation: UITableView.RowAnimation = .fade) {

        cellData.isVisible = false

        tableView?.performBatchUpdates({
            tableDisposer?.sections[indexPath.section].insertCellData(cellData, index: indexPath.row)
            (tableDisposer?.sections[indexPath.section] as? SMSectionReadonly)?.showCell(by: indexPath.row, needUpdateTable: true, withRowAnimation: aAnimation)
        }, completion: { [weak self] _ in
            self?.tableDisposer?.reloadData()
        })
    }

    @discardableResult
    func deleteCellData(_ cellData: SMCellData, withAnimation aAnimation: UITableView.RowAnimation = .fade) -> Bool {
        var result: Bool = false

        if let indexPath: IndexPath = tableDisposer?.indexPath(by: cellData) {
            tableDisposer?.tableView?.beginUpdates()
            (tableDisposer?.sections[indexPath.section] as? SMSectionReadonly)?.deleteRows(at: [indexPath.row], withRowAnimation: aAnimation)
            tableDisposer?.tableView?.endUpdates()

            result = true
        }

        return result
    }


    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return nil
    }

    // MARK: SMTableSectionsProtocol

    func setupSections(_ aSections: [SMSectionReadonly]) {
        
        tableDisposer?.sections = aSections
        tableDisposer?.reloadData()
    }

    func reloadView() {

    }
}
