//
//  Constants.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/21.
//

import Foundation
struct SCPConstants {
    let PACKAGE_NAME = "info.free.scp"
    let SCP_DB_NAME = "scp_category_ios.db"
    let DETAIL_DB_NAME = "scp_detail_v2.db"
    let INFO_DB_NAME = "scp_info.db"
    let LEVEL_PREF_NAME = "level.xml"
    let APP_PREF_NAME = "app.xml"
    let PUBLIC_DIR_NAME = "scp_reader"
    let FREE_TIME = 1619668800000

    struct AppMode {
        let ONLINE = 0
        let OFFLINE = 1
    }

    struct OrderType {
        let ASC = 1
        let DESC = -1
    }

    struct SearchType {
        let TITLE = 0
        let CONTENT = 1
    }

    // category type
    struct Entry {
        let SCP_DOC = 1001 // SCP文档，包含其他文档
        let SCP_CN_DOC = 1002 // SCP-CN文档，包含其他文档
        let STORY_DOC = 1003 // 故事外围
        let GOI_DOC = 1004 // 故事外围
        let ART_DOC = 1005 // 故事外围
        let WANDER_DOC = 1006 // 放逐者图书馆
        let LIBRARY_DOC = 1007 // 图书馆
        let INTERNATIONAL_DOC = 1008 // 国际版
        let INFORMATION_DOC = 1009 // 故事外围

    }


    struct Category {
        // 直接跳转列表 100+
        let SERIES = 1
        let SERIES_CN = 2
        let JOKE = 101
        let SCP_EX = 102
        let TALES = 99
        let TALES_CN = 98
        let TALES_BY_TIME = 97
        let SETTINGS = 106
        let SETTINGS_CN = 107
        let STORY_SERIES = 108
        let STORY_SERIES_CN = 109
        let CONTEST = 110
        let CONTEST_CN = 111
        let WANDER = 10
        let WANDER_CN = 11
    }

    struct ScpType {
        // save type
        let SAVE_SERIES = 1
        let SAVE_SERIES_CN = 2
        let SAVE_JOKE = 3
        let SAVE_JOKE_CN = 4
        let SAVE_EX = 5
        let SAVE_EX_CN = 6

        let SAVE_TALES = 7
        let SAVE_TALES_CN = 8
        let SAVE_CANON = 9
        let SAVE_CANON_CN = 10
        let SAVE_STORY_SERIES = 11
        let SAVE_STORY_SERIES_CN = 12

        let SAVE_REPORT = 13
        let SAVE_ANOMALOUS_CN = 14
        let SAVE_SHORT_STORY = 15

        let SAVE_LIBRARY_PAGE = 16
        let SAVE_GOI = 17
        let SAVE_ART = 18

        let SAVE_CONTEST = 19
        let SAVE_CONTEST_CN = 20
        let SAVE_WANDER = 21
        let SAVE_WANDER_CN = 22
        let SAVE_INTERNATIONAL = 23
        let SAVE_INFO_PAGE = 24 // 设定说明类页面

        let SAVE_TALES_BY_TIME = 101
        let SAVE_OFFSET = 100
    }

    let SCP_SITE_URL = "http://scp-wiki-cn.wikidot.com"

    // https://portal.mcseekeri.top/http/scp-wiki-cn.wikidot.com
    let FEED_API_URL = "http://api.zhufree.fun"


    // RequestCode
    struct RequestCode {
        let CATEGORY_TO_DETAIL = 0
        let REQUEST_FILE_PERMISSION = 1
        let REQUEST_PICTURE_DIR = 2
        let REQUEST_PUBLIC_FILE = 3
        let REQUEST_BACKUP_DIR = 4
        let REQUEST_RESTORE_DIR = 5
    }

    let HISTORY_TYPE = 0
    let LATER_TYPE = 1

    let SIMPLE = 0
    let TRADITIONAL = 1

    let LATEST_CREATED = -2
    let LATEST_TRANSLATED = -3
    let TOP_RATED_ALL = 0
    let TOP_RATED_SCP = 1
    let TOP_RATED_TALES = 2
    let TOP_RATED_GOI = 3
    let TOP_RATED_WANDERS = 4

}
