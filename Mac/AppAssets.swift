//
//  AppAssets.swift
//  NetNewsWire
//
//  Created by Brent Simmons on 2/17/18.
//  Copyright © 2018 Ranchero Software. All rights reserved.
//

import AppKit
import RSCore
import Account

struct AppAssets {

	static var accountCloudKit: RSImage! = {
		return RSImage(named: "accountCloudKit")
	}()

	static var accountLocal: RSImage! = {
		return RSImage(named: "accountLocal")
	}()

	static var accountFeedbin: RSImage! = {
		return RSImage(named: "accountFeedbin")
	}()
	
	static var accountFeedly: RSImage! = {
		return RSImage(named: "accountFeedly")
	}()
	
	static var accountFeedWrangler: RSImage! = {
		return RSImage(named: "accountFeedWrangler")
	}()
	
	static var accountFreshRSS: RSImage! = {
		return RSImage(named: "accountFreshRSS")
	}()

	static var accountNewsBlur: RSImage! = {
		return RSImage(named: "accountNewsBlur")
	}()
	
	static var articleExtractor: RSImage! = {
		return RSImage(named: "articleExtractor")
	}()
	
	static var articleExtractorError: RSImage! = {
		return RSImage(named: "articleExtractorError")
	}()
	
	static var articleExtractorInactiveDark: RSImage! = {
		return RSImage(named: "articleExtractorInactiveDark")
	}()
	
	static var articleExtractorInactiveLight: RSImage! = {
		return RSImage(named: "articleExtractorInactiveLight")
	}()
	
	static var articleExtractorProgress1: RSImage! = {
		return RSImage(named: "articleExtractorProgress1")
	}()
	
	static var articleExtractorProgress2: RSImage! = {
		return RSImage(named: "articleExtractorProgress2")
	}()
	
	static var articleExtractorProgress3: RSImage! = {
		return RSImage(named: "articleExtractorProgress3")
	}()
	
	static var articleExtractorProgress4: RSImage! = {
		return RSImage(named: "articleExtractorProgress4")
	}()
	
	static var extensionPointMarsEdit: RSImage = {
		return RSImage(named: "extensionPointMarsEdit")!
	}()
	
	static var extensionPointMicroblog: RSImage = {
		return RSImage(named: "extensionPointMicroblog")!
	}()
	
	static var extensionPointReddit: RSImage = {
		return RSImage(named: "extensionPointReddit")!
	}()

	static var extensionPointTwitter: RSImage = {
		return RSImage(named: "extensionPointTwitter")!
	}()
	
	static var extensionPreference: RSImage? = {
		return RSImage(contentsOfFile: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/KEXT.icns")
	}()
		
	static var faviconTemplateImage: RSImage = {
		return RSImage(named: "faviconTemplateImage")!
	}()

	static var filterActive: RSImage = {
		return RSImage(named: "filterActive")!
	}()

	static var filterInactive: RSImage = {
		return RSImage(named: "filterInactive")!
	}()

	static var iconLightBackgroundColor: NSColor = {
		return NSColor(named: NSColor.Name("iconLightBackgroundColor"))!
	}()

	static var iconDarkBackgroundColor: NSColor = {
		return NSColor(named: NSColor.Name("iconDarkBackgroundColor"))!
	}()

	static var masterFolderImage: IconImage = {
		return IconImage(RSImage(named: NSImage.folderName)!)
	}()

	static var searchFeedImage: IconImage = {
		return IconImage(RSImage(named: NSImage.smartBadgeTemplateName)!)
	}()

	static var smartFeedImage: RSImage = {
		return RSImage(named: NSImage.smartBadgeTemplateName)!
	}()
	
	static var starredFeedImage: IconImage = {
		return IconImage(RSImage(named: NSImage.smartBadgeTemplateName)!)
	}()

	static var timelineStarSelected: RSImage! = {
		return RSImage(named: "timelineStar")?.tinted(with: .white)
	}()

	static var timelineStarUnselected: RSImage! = {
		return RSImage(named: "timelineStar")?.tinted(with: starColor)
	}()

	static var todayFeedImage: IconImage = {
		return IconImage(RSImage(named: NSImage.smartBadgeTemplateName)!)
	}()

	static var unreadFeedImage: IconImage = {
		return IconImage(RSImage(named: NSImage.smartBadgeTemplateName)!)
	}()

	static var swipeMarkReadImage: RSImage = {
		return RSImage(named: "swipeMarkRead")!
	}()

	static var swipeMarkUnreadImage: RSImage = {
		return RSImage(named: "swipeMarkUnread")!
	}()

	static var swipeMarkStarredImage: RSImage = {
		return RSImage(named: "swipeMarkStarred")!
	}()

	static var swipeMarkUnstarredImage: RSImage = {
		return RSImage(named: "swipeMarkUnstarred")!
	}()
	
	static var starColor: NSColor = {
		return NSColor(named: NSColor.Name("starColor"))!
	}()
	
	static func image(for accountType: AccountType) -> NSImage? {
		switch accountType {
		case .onMyMac:
			return AppAssets.accountLocal
		case .cloudKit:
			return AppAssets.accountCloudKit
		case .feedbin:
			return AppAssets.accountFeedbin
		case .feedly:
			return AppAssets.accountFeedly
		case .feedWrangler:
			return AppAssets.accountFeedWrangler
		case .freshRSS:
			return AppAssets.accountFreshRSS
		case .newsBlur:
			return AppAssets.accountNewsBlur
		}
	}
	
}
