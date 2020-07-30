//
//  SMChannelsPresenter.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import VRGSoftSwiftIOSKit

protocol SMChannelsPresenterProtocol {
    
    func willReloadWithInterval(_ interval: Int)
}

final class SMChannelsPresenter: SMBasePresenter {
    
    private var channels: [SMChannel]?
    
    func allAvailableDays() -> [Date]? {
        
        var result: Set<Date> = .init()
        
        if let channels: [SMChannel] = self.channels {
            
            for channel in channels {
                
                result.insert(channel.avalibleDays ?? [])
            }
        }
        
        return result.sorted { (d1, d2) -> Bool in
            return d1 < d2
        }
    }
    
    var custViewController: SMChannelsPresenterProtocol? {
        
        return vc as? SMChannelsPresenterProtocol
    }
    
    override func reloadData() {
        
        super.reloadData()
        
        apply(request: SMCompoundRequest(withRequests: [SMChannelGateway.shared.getChannels(), SMChannelGateway.shared.getProgramItems()])) { [weak self] (aResponse) in
            
            if aResponse.isSuccess {
                
                if let channels = aResponse.boArray.first as? [SMChannel],
                    let programItems: [SMProgramItem] = aResponse.boArray.last as? [SMProgramItem] {
                    
                    self?.channels = channels
                    
                    for channel in channels {
                        
                        var items: [SMProgramItem] = programItems.filter{ $0.recentAirTime.channelID == channel.id }
                        items.sort { (pi1, pi2) -> Bool in
                            return pi1.startTime < pi2.startTime
                        }

                        channel.programItems = items
                    }
                    
                    if let day: Date = self?.allAvailableDays()?.first {
                        
                        self?.setupSections(day)
                    }
                }
            }
        }
    }
    
    func setupSections(_ day: Date) {
        
        guard let channels: [SMChannel] = self.channels?.filter({ (channel) -> Bool in
            return channel.avalibleDays?.contains(day) ?? false
        }) else { return }

        var sections: [SMCollectonSection] = []

        let cMin: SMChannel? = channels.min { (c1, c2) -> Bool in
            return c1.intervalFor(day: day).0 < c2.intervalFor(day: day).0
        }

        let cMax: SMChannel? = channels.max { (c1, c2) -> Bool in
            return c1.intervalFor(day: day).1 < c2.intervalFor(day: day).1
        }
        
        let minMinutes: Int = cMin?.intervalFor(day: day).0 ?? 0
        let maxMinutes: Int = cMax?.intervalFor(day: day).1 ?? 0
        
        do {
            let section: SMCollectonSection = SMCollectonSection()
            sections.append(section)
            
            var i: Int = 0
            var time: Int = minMinutes;
            if var timeStartFirst: Date = cMin?.programItems?.first?.startTime,
                let timeStartLast: Date = cMax?.programItems?.first?.startTime {
                
                while time < maxMinutes  {
                    
                    let cd: SMTimeCellData = SMTimeCellData()
                    
                    if i == 0 {
                        cd.cellSize = CGSize(width: 100, height: SMChannelsViewController.cellHeight)
                        cd.text = DateFormatter.uiOnlyDateDF.string(from: timeStartFirst)
                    } else {
                        
                        cd.cellSize = CGSize(width: 30 * SMChannelsViewController.minutesInPixel, height: SMChannelsViewController.cellHeight)
                        cd.text = DateFormatter.uiTimeDF.string(from: timeStartFirst)
                        
                        time += 30
                        timeStartFirst = timeStartFirst.sm.dateByAddingMinutes(30) ?? timeStartFirst
                    }
                    
                    i += 1
                    section.addCellData(cd)
                }
            }
        }
        
        for channel in channels {
                        
            if let programItems: [SMProgramItem] = channel.programItemsFor(day: day) {
                
                let section: SMCollectonSection = SMCollectonSection()
                sections.append(section)
                
                let cd: SMChannelCellData = SMChannelCellData(model: channel)
                section.addCellData(cd)
                
                for (index, programItem) in programItems.enumerated() {
                    
                    let programItemBefore: SMProgramItem? = index - 1 >= 0 ? programItems[index - 1] : nil
                    
                    var breakMinutes: Int = 0

                    if index == 0 {
                        
                        breakMinutes = programItem.breakMinutesWithBefore(nil)
                        breakMinutes -= minMinutes
                    } else if programItemBefore != nil {
                        
                        breakMinutes = programItem.breakMinutesWithBefore(programItemBefore)
                    }
                    
                    if breakMinutes > 0 {
                        
                        let cd: SMEmptyCellData = SMEmptyCellData(breakMinutes: breakMinutes)
                        section.addCellData(cd)
                    }

                    let cd: SMProgramCellData = SMProgramCellData(model: programItem)
                                        
                    section.addCellData(cd)
                }
            }
        }
        
        custViewController?.willReloadWithInterval(maxMinutes - minMinutes)
        (vc as? SMBaseListViewProtocol)?.setupSections(sections)
    }
}
