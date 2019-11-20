local _class = {
    _name = 'IdeaMassView',
    _version = '1.0'
}

require('IdeaMassMainViewLayout')

---@public
function _class:new()
    local o = {}
    setmetatable(o, { __index = self })
    self.dataList = Array()
    self.pageIndex = 1
    self.type = 1
    return o
end

---@public
function _class:rootView()
    if self.containerView then
        return self.containerView
    end
    self:setupTapTableView()
    self:setupWaterfallView()
    self:setupDataSource()
    return self.containerView
end


function _class:setupTapTableView()
    local tapTableViewAdapter = CollectionViewAutoFitAdapter()

    tapTableViewAdapter:initCell(function(cell)
        cell.tapLabel = Label():text(""):textColor(_Color.White):fontSize(12):padding(6, 15, 6, 15):bgColor(Color(70, 70, 70, 0.5)):cornerRadius(40)
        cell.contentView:addView(cell.tapLabel)
    end)

    tapTableViewAdapter:fillCellData(function(cell, _, row)
        local item = self.dataList:get(row)
        cell.tapLabel:text(item:get("author"))
    end)

    tapTableViewAdapter:rowCount(function()
        return self.dataList:size()
    end)

    IdeaMassMainViewLayout._headerView.tapTableView:adapter(tapTableViewAdapter)
end


function _class:setupWaterfallView()
    self.waterfall = WaterfallView(false, true):width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
    self.waterfallLayout = WaterfallLayoutFix():itemSpacing(12):lineSpacing(18):spanCount(2):layoutInset(10, 0, 0, 0)
    self.waterfallAdapter = WaterfallAdapter()
    self.waterfallAdapter:initCell(function(cell)
        local REQCELL = require("MMLuaKitGallery.IdeaWaterfallCell"):new()
        REQCELL:cellView()
        cell.CELL = REQCELL
        cell.contentView:addView(REQCELL.cellLayout)
    end)
    self.waterfallAdapter:fillCellData(function(cell, _, row)
        if row % 2 == 0 then
            cell.contentView:padding(0, 12, 0, 0)
        else
            cell.contentView:padding(0, 0, 0, 12)
        end
        local item = self.dataList:get(row)

        cell.CELL.image:image(item:get("pic_big"))
        cell.CELL.desc:text(tostring(item:get("title") .. " " .. tostring(item:get("si_proxycompany"))))
        if item:get("album_title") ~= nil then
            cell.CELL.desc:text(tostring(cell.CELL.desc:text() .. "  " .. tostring(item:get("album_title"))))
        end
        cell.CELL.authorhead:image(item:get("pic_small"))
        cell.CELL.authorName:text(item:get("artist_name"))
        cell.CELL.likeCount:text(tostring(item:get("file_duration")))
    end)
    self.waterfallAdapter:rowCount(function()
        return self.dataList:size()
    end)

    self.waterfallAdapter:heightForCell(function(section, row)
        local str = self.dataList:get(row):get("si_proxycompany")
        if string.len(str) > 15 then
            return 280
        else
            return 250
        end
    end)
    self.waterfall:layout(self.waterfallLayout)
    self.waterfall:adapter(self.waterfallAdapter)

    self.waterfall:setLoadingCallback(function()
        self:requestNetwork(false, function(success, data)
            if success then
                self.waterfall:stopLoading()
                self.waterfall:reloadData()
                self.waterfall:noMoreData()
            end
        end)
    end)
    IdeaMassMainViewLayout._containerView:addView(self.waterfall)
    IdeaMassMainViewLayout._waterfallView = self.waterfall
    return self.waterfall
end
---请求接口
---@private
function _class:requestNetwork(first, complete)
    --热门
    if self.type == 1 then
        if first then
            self.pageIndex = 1
        else
            self.pageIndex = 6
        end
    elseif self.type == 2 then
        --最新
        if first then
            self.pageIndex = 11
        else
            self.pageIndex = 9
        end
    end

    if System:Android() then
        File:asyncReadMapFile('file://android_asset/MMLuaKitGallery/discoverry_detail.json', function(codeNumber, response)

            print("codeNumber: " .. tostring(codeNumber))
            if codeNumber == 0 then
                local data = response:get("result")
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
    else
        File:asyncReadFile('file://gallery/json/musicRank.json', function(codeNumber, response)
            print("codeNumber: " .. tostring(codeNumber))
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

function _class:setupDataSource()
    --首先展示第一页数据
    self:requestNetwork(true, function(success, _)
        if success then
            if self.dataList:size() > 0 then
                IdeaMassMainViewLayout._headerView.iv:image(self.dataList:get(1):get("pic_radio"))
                IdeaMassMainViewLayout._headerView.tapTableView:reloadData()
                IdeaMassMainViewLayout._waterfallView:reloadData()
            end
        end
    end)
end

return _class
