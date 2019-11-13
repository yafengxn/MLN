---
--- Generated by MLN Team (http://www.immomo.com)
--- Created by MLN Team.
--- DateTime: 2019-09-05 12:05
---

local _class = {
    _name = 'DiscoverPagerView',
    _version = '1.0'
}

---@public
function _class:new()
    local o = {}
    setmetatable(o, { __index = self })
    self.dataList = Array()
    self.requestPageIndex = 1
    self.autoScrollTool = AutoScrollTool()
    return o
end

---@public
function _class:rootView()
    if self.containerView then
        return self.containerView
    end
    self:createSubviews()
    self:setupDataSource()
    return self.containerView
end

---创建子视图
---@private
function _class:createSubviews()
    self:setupContainerView()
    self:setupTabSegmentView()
    self:setupCollectionView()
    self:setupSearchBox()
end

---创建容器视图
---@private
function _class:setupContainerView()
    self.containerView = LinearLayout(LinearType.VERTICAL)
            :width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
end

---创建导航栏
---@private
function _class:setupTabSegmentView()
    --导航栏
    self.navigation = require("MMLuaKitGallery.NavigationBar"):new()
    self.navibar = self.navigation:bar("发现", nil)
    self.containerView:addView(self.navibar)

    --签到
    self.signin = Label()
    self.signin:width(60):height(25):setGravity(MBit:bor(Gravity.RIGHT, Gravity.CENTER_VERTICAL)):marginRight(10)
    self.signin:bgColor(Color(204, 137, 24))--ok
        :cornerRadius(self.signin:height() / 2)
    self.signin:text("签到"):textAlign(TextAlign.CENTER):fontSize(11):textColor(_Color.White)
    self.signin:onClick(function()
        if self.signin:text() == "签到" then
            self.signin:text("已签到")
        else
            self.signin:text("签到")
        end
    end)
    self.navibar:addView(self.signin)
end

---创建collectionView
---@private
function _class:setupCollectionView()
    self.headerViewHeight = 400

    self.collectionView = WaterfallView(true, true):width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
    self.collectionView:useAllSpanForLoading(true)
    self.collectionView:showScrollIndicator(true)
    self.containerView:addView(self.collectionView)

    self.layout = WaterfallLayoutFix()
    --self.layout:lineSpacing(30)
    self.layout:lineSpacing(0)
        :itemSpacing(10)
        :spanCount(2)
        :layoutInset(0, 10, 0, 10)
    self.collectionView:layout(self.layout)

    self:setupCollectionViewAdapter()

    System:setTimeOut(function()
        self.autoScrollTool:autoScrollWithView(self.collectionView, 'file://gallery/json/musicRank.json')
    end, 2.0)
end

--- @private
function _class:setupCollectionViewAdapter()
    local cellReuseId = "cellReuseId"
    local cellWidth = (window:width() - 30) / 2
    local adapter = WaterfallAdapter()
    self.adapter = adapter

    adapter:headerValid(function(_)
        return true
    end)

    adapter:heightForHeader(function(_)
        return self.headerViewHeight
    end)

    adapter:initHeader(function(header)
        header.contentView:addView(self:headerView())
    end)

    adapter:fillHeaderData(function(_, _, _)
        --do nothing
    end)

    adapter:sectionCount(function()
        return 1
    end)

    adapter:rowCount(function(_)
        return self.dataList:size()
    end)

    adapter:reuseId(function(_, _)
        return cellReuseId
    end)

    adapter:initCellByReuseId(cellReuseId, function(cell)
        local internalCell = require("MMLuaKitGallery.DiscoverCell"):new()
        internalCell:setupCellSubviews(cellWidth)
        cell._cell = internalCell
        cell.contentView:addView(internalCell.baseLayout)
    end)

    adapter:fillCellDataByReuseId(cellReuseId, function(cell, _, row)
        local item = self.dataList:get(row)
        local rank = item:get("rank") or 0
        cell._cell.imageView:image(item:get("album_500_500"))
        cell._cell.titleLabel:text(item:get("title"))
        cell._cell.countLabel:text(string.format("%s篇", rank + 1))
        cell._cell.lookLabel:text(string.format("%d", item:get("file_duration")))

        if rank and tonumber(rank) < 2 then
            cell._cell:updateContentIcons(nil)
        else
            cell._cell:updateContentCountText(rank)
            cell._cell:updateContentIcons(item:get("pic_small"))
        end
    end)

    adapter:heightForCell(function(_, row)
--[[
        local item = self.dataList:get(row)
        local rank = item:get("rank") or 0
        if rank and tonumber(rank) < 2 then
            return cellWidth + 75
        end
--]]
        return cellWidth + 90
    end)
    adapter:selectedRowByReuseId(cellReuseId, function(cell, _, row)
        if System:Android() then
            Navigator:gotoPage("file://android_asset/MMLuaKitGallery/IdeaMassView.lua", nil, 0)
        else
            Navigator:gotoPage("IdeaMassMainView.lua", nil, 0)
        end
    end)
    self.collectionView:adapter(adapter)
end

---数据源
---@private
function _class:setupDataSource()
    --首先展示第一页数据
    self:requestNetwork(true, function(success, _)
        if success then
            self.collectionView:reloadData()
        end
    end)

    --下拉刷新
    self.collectionView:setRefreshingCallback(function()
        self:requestNetwork(true, function(success, _)
            self.collectionView:stopRefreshing()
            self.collectionView:resetLoading()
            if success then
                self.collectionView:reloadData()
            end
        end)
    end)

    --上拉加载
    self.collectionView:setLoadingCallback(function()
        self:requestNetwork(false, function(success, data)
            self.collectionView:stopLoading()
            if not data then
                self.collectionView:noMoreData()
            end
            if success then
                self.collectionView:reloadData()
            end
        end)
    end)
end

---请求接口
---@private
function _class:requestNetwork(first, complete)
    if first then
        local pageIndexs = { 13, 9, 11, 12, 6 }
        local index = math.random(0, 6)
        self.requestPageIndex = pageIndexs[index] --随机一个index请求不同的数据
    else
        self.requestPageIndex = self.requestPageIndex + 1
    end

    if System:Android() then

        File:asyncReadMapFile('file://android_asset/MMLuaKitGallery/discoverry.json', function(codeNumber, response)

            print("codeNumber: " .. tostring(codeNumber))

            if codeNumber == 0 then
                local data = response:get("result")
                if first then
                    self.dataList = data
                elseif data then
                    self.dataList:addAll(data)
                end
                complete(true, self.dataList)
            else
                --error(err:get("errmsg"))
                complete(false, nil)
            end
        end)

    else
        File:asyncReadFile('file://gallery/json/musicRank.json', function(codeNumber, response)
            map = StringUtil:jsonToMap(response)
            if codeNumber == 0 then
            local data = map:get("result")
            if first then
                self.dataList = data
            elseif data then
                self.dataList:addAll(data)
            end
            complete(true, data)
            else
                --error(err:get("errmsg"))
                complete(false, nil)
            end
        end)
    end
end

---创建搜索框
---@private
function _class:setupSearchBox()
    local search = require("MMLuaKitGallery.SearchBox"):new()
    self.searchBar = search:setup(nil)
    return self.searchBar
end

---创建headerView
---@private
function _class:headerView()
    local width = self.collectionView:width() - 20
    self.headerView = View():width(width):height(self.headerViewHeight)

    --线性布局
    self.headerViewLayout = LinearLayout(LinearType.VERTICAL):width(MeasurementType.WRAP_CONTENT):height(MeasurementType.WRAP_CONTENT)
    self.headerView:addView(self.headerViewLayout)

    --搜索框
    local searchBar = self:setupSearchBox()
    self.headerViewLayout:addView(searchBar)

    --使用指南
    self.guideImageView = ImageView():marginTop(10):width(width):height(MeasurementType.WRAP_CONTENT)
    self.guideImageView:addCornerMask(5, _Color.White, RectCorner.ALL_CORNERS)
    self.guideImageView:image('https://s.momocdn.com/w/u/others/2019/08/27/1566877265808-meilishuoguide.png')
    self.guideImageView:onClick(function()
        ---加载webview http://act.meilishuo.com/wap/0118huya?acm=3.mce.2_10_1lpd6.130069.0.j5klrrAfO3TFd.pos_0-m_506297-sd_119
        Toast("请查看请使用指南", 1)
    end)
    self.headerViewLayout:addView(self.guideImageView)

    --福利社
    self.welfareImageView = ImageView():marginTop(10):width(width):height(MeasurementType.WRAP_CONTENT)
    self.welfareImageView:addCornerMask(5, _Color.White, RectCorner.ALL_CORNERS)
    self.welfareImageView:image("https://s.momocdn.com/w/u/others/2019/08/27/1566877691900-welfare.png")
    self.welfareImageView:onClick(function()
        Toast("直接去福利社换取福利哦", 1)
    end)
    self.headerViewLayout:addView(self.welfareImageView)

    --日常任务和去点赞布局
    self.dailyLayoutView = View():width(width):height(MeasurementType.WRAP_CONTENT):marginTop(5)
    self.headerViewLayout:addView(self.dailyLayoutView)

    --日常任务
    local text = StyleString("日常任务：点亮爱心，为内容点赞")
    text:fontSize(12):fontColor(_Color.DeepGray)
    text:setFontColorForRange(_Color.Black, 1, 5):setFontStyleForRange(FontStyle.BOLD, 1, 5)
    self.dailyTaskLabel = Label():setGravity(Gravity.CENTER_VERTICAL):styleText(text)
    self.dailyLayoutView:addView(self.dailyTaskLabel)

    --去点赞
    self.likeButton = Label():width(54):height(18):setGravity(MBit:bor(Gravity.RIGHT, Gravity.CENTER_VERTICAL))
    self.likeButton:cornerRadius(self.likeButton:height() / 2):borderWidth(0.5):borderColor(Color(204, 137, 24))
    self.likeButton:text("去点赞"):fontSize(10):textColor(Color(204, 137, 24)):textAlign(TextAlign.CENTER)
    self.likeButton:onClick(function()
        if self.likeButton:text() == "去点赞" then
            self.likeButton:text("已赞👍")
        else
            self.likeButton:text("去点赞")
        end
    end)
    self.dailyLayoutView:addView(self.likeButton)

    --分割线
    self.line = View():marginTop(10):width(width):height(0.5)
    self.line:bgColor(Color(230, 230, 230, 1))--ok
    self.headerViewLayout:addView(self.line)

    --灵感集
    local text = StyleString("灵感集 / 探索更有趣的时髦生活")
    text:fontSize(13):fontColor(_Color.MediumGray)
    text:setFontSizeForRange(20, 1, 5)
    text:setFontColorForRange(_Color.Black, 1, 4):setFontStyleForRange(FontStyle.BOLD, 1, 4)
    self.descLabel = Label():width(MeasurementType.WRAP_CONTENT):height(50)
    self.descLabel:styleText(text)
    self.headerViewLayout:addView(self.descLabel)

    --线性布局分类按钮
    local buttonLayout = LinearLayout(LinearType.HORIZONTAL)
    buttonLayout:width(width):setGravity(Gravity.BOTTOM):marginBottom(5)
    self.buttonLayout = buttonLayout
    self.headerView:addView(buttonLayout)

    self.categButtons = {}
    local titles = { "推荐", "穿搭", "美妆", "探店", "旅行" }
    for i = 1, #titles do
        local button = Label()
        local offset = i > 1 and 10 or 0
        button:marginLeft(offset):width(38):height(25):cornerRadius(12)
        button:bgColor(_Color.LightGray)--ok
        button:text(titles[i]):fontSize(12):textColor(_Color.Gray):textAlign(TextAlign.CENTER)
        button:onClick(function()
            self:clickCategoryButton(button)
        end)
        buttonLayout:addView(button)
        table.insert(self.categButtons, button)
    end
    self:updateCategoryButtonUI(self.categButtons[1])

    return self.headerView
end

---@private
function _class:clickCategoryButton(button)
    self:updateCategoryButtonUI(button)
    self:requestNetwork(true, function(success, _)
        if success == true then
            self.collectionView:reloadData()
        end
    end)
end

---@private
function _class:updateCategoryButtonUI(button)
    if self.preCategButton then
        self.preCategButton:textColor(_Color.Gray)
            :bgColor(_Color.LightGray)--ok
            :setTextFontStyle(FontStyle.NORMAL)
    end
    button:textColor(_Color.White):setTextFontStyle(FontStyle.BOLD)
          :bgColor(Color(253, 74, 63))--ok
    self.preCategButton = button
end

return _class
