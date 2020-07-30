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
            return d1 > d2
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
//                        items.removeLast(3)
//                        items.remove(at: 4)

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
        
        var minMinutes: Int = 0
        var maxMinutes: Int = 0
        
        for (index, channel) in channels.enumerated() {
            
            let interval: (Int, Int) = channel.intervalFor(day: day)

            if index == 0 {
                
                minMinutes = interval.0
                maxMinutes = interval.1
            } else {
                
                if interval.0 < minMinutes {
                    minMinutes = interval.0
                }
                
                if interval.1 > maxMinutes {
                    maxMinutes = interval.1
                }
            }
            
            if let programItems: [SMProgramItem] = channel.programItemsFor(day: day) {
                
                let section: SMCollectonSection = SMCollectonSection()
                sections.append(section)
                
                let cd: SMChannelCellData = SMChannelCellData(model: channel)
                
                section.addCellData(cd)
                
                for (index, programItem) in programItems.enumerated() {
                    
                    let programItemBefore: SMProgramItem? = index - 1 > 0 ? programItems[index - 1] : nil
                    
                        let breakMinutes: Int = programItem.breakMinutesWithBefore(programItemBefore)
                        
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
