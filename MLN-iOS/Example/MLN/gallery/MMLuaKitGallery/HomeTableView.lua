---
--- Generated by MLN Team (http://www.immomo.com)
--- Created by MLN Team.
--- DateTime: 2019-09-05 12:05
---

local _class = {
    _name = 'HomeTableView',
    _version = '1.0',
    _type = 0,
    TYPE_FOLLOW = "follow",
    TYPE_RECOMMEND = "recommend"
}

---@public
function _class:new()
    local o = {}
    setmetatable(o, {__index = self})
    self.dataList = Array()
    self.cid = 1
    return o
end

---@public
function _class:tableView(type, top)
    self._type = type
    self:setupContainerView(top)
    self:setupDataSource()
    return self.tableView
end

---@private
function _class:setupContainerView(top)
    local searchBarCellId = "firstCellType"
    local normalCellId = "normalCellType"

    local tableView = TableView(true, true)
    tableView:width(window:width()):height(window:height() - _TabbarHeight - top)
    tableView:bgColor(_Color.White)
    tableView:showScrollIndicator(true)
    self.tableView = tableView

    local adapter = TableViewAutoFitAdapter()
    tableView:adapter(adapter)
    self.adapter = adapter

    adapter:sectionCount(function()
        return 1
    end)

    adapter:rowCount(function(_)
        return self.dataList:size()
    end)

    --第一个cell用来展示搜索框以便能跟随tableView滚动
    adapter:initCellByReuseId(searchBarCellId, function(cell)
        cell.searchBar = self:searchBox()
        cell.contentView:addView(cell.searchBar)
        cell.contentView:bgColor(_Color.White)
    end)

    adapter:initCellByReuseId(normalCellId, function(cell)
        local cellClass = require("MMLuaKitGallery.HomeCommonCell")
        cell._cell = cellClass:new()
        cell.contentView:addView(cell._cell:contentView())
        cell.contentView:bgColor(_Color.LightGray)

        if self._type == self.TYPE_FOLLOW then
            cell._cell:updateFollowLabel(false, nil)
        elseif self._type == self.TYPE_RECOMMEND then
            cell._cell:updateFollowLabel(true, nil)
        end
    end)

    adapter:reuseId(function(_, row)
        if row == 1 then
            return searchBarCellId
        end
        return normalCellId
    end)

    adapter:fillCellDataByReuseId(searchBarCellId, function (_, _, _)
        --do nothing
    end)

    adapter:fillCellDataByReuseId(normalCellId, function(cell, _, row)
        local item = self.dataList:get(row)
        cell._cell:updateCellContentWithItem(item)
    end)
end


--- 更新数据分类
--- @public
function _class:updateCategoryId(cid)
    self.cid = cid
end

--- 创建搜索框
--- @private
function _class:searchBox()
    local search = require("MMLuaKitGallery.SearchBox"):new()
    return search:setup(nil)
end

--- 加载数据
--- @private
function _class:setupDataSource()
    self.minId = 1

    --首先展示第一页数据
    self:request(true,function(success, _)
        if success then
            self.tableView:reloadData()
        end
    end)

    --下拉刷新
    self.tableView:setRefreshingCallback(function ()
        self:request(true,function(success, _)
            self.tableView:stopRefreshing()
            self.tableView:resetLoading()
            if success then
                self.tableView:reloadData()
            end
        end)
    end)

    --上拉加载
    self.tableView:setLoadingCallback(function ()
        self:request(false,function(success, data)
            self.tableView:stopLoading()
            if not data then
                self.tableView:noMoreData()
            end
            if success then
                self.tableView:reloadData()
            end
        end)
    end)
end

--- 数据请求
--- @param first boolean 是否请求第一页
--- @param complete function 数据请求结束的回调
--- @private
function _class:request(first, complete)
    local HTTPHandler = require("MMLuaKitGallery.HTTPHandler")
    HTTPHandler:GET("http://v2.api.haodanku.com/itemlist/apikey/fashion/cid/1/back/20", {min_id = self.minId, cid = self.cid}, function(success, response, err)
        if success then
            local data = response:get("data")
            if first then
                self.minId = 1
                self.dataList = data
            elseif data then
                self.minId = response:get("min_id")
                self.dataList:addAll(data)
            end
            complete(success, data)
        else
            error(err:get("errmsg"))
            complete(false, nil)
        end
    end)
end

return _class