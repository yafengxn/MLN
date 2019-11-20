local _class = {
    _name = 'IdeaMassHeaderView',
    _version = '1.0'
}

---@public
function _class:new()
    local o = {}
    setmetatable(o, { __index = self })
    o:setupSubviews()
    return o
end


---@private
function _class:setupSubviews()
    self:setupTopView()
    self:setupTapListView()
end

---header视图
function _class:setupTopView()
    self.HeaderView = LinearLayout(LinearType.VERTICAL):width(MeasurementType.MATCH_PARENT):height(231):bgColor(_Color.Gray)

    self.topView = View():width(MeasurementType.MATCH_PARENT):height(MeasurementType.WRAP_CONTENT):padding(20, 10, 10, 10)
    self.HeaderView:addView(self.topView)

    self.iv = ImageView():width(100):height(100):cornerRadius(6)
    self.topView:addView(self.iv)

    self.attention = Label():text("+ 关注"):textColor(_Color.White):fontSize(12):borderWidth(1):borderColor(_Color.White):padding(6, 12, 6, 12):cornerRadius(2):setGravity(Gravity.RIGHT)
    self.topView:addView(self.attention)

    self.title = Label():marginLeft(120):text("一周穿搭不重样"):textColor(_Color.White):fontSize(16):setTextFontStyle(FontStyle.BOLD)
    self.topView:addView(self.title)

    --篇数 浏览量
    self.countLinear = LinearLayout(LinearType.HORIZONTAL):marginLeft(120):marginTop(28)
    self.topView:addView(self.countLinear)

    self.pageLogo = ImageView():width(15):height(15):cornerRadius(6):image("https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_star.png")
    self.countLinear:addView(self.pageLogo)
    self.pageCount = Label():text("200篇"):textColor(_Color.White):fontSize(12):marginLeft(3)
    self.countLinear:addView(self.pageCount)

    self.scanLogo = ImageView():width(15):height(15):marginLeft(8):image("https://s.momocdn.com/w/u/others/2019/10/18/1571393656549-mls_scan.png")
    self.countLinear:addView(self.scanLogo)
    self.scanCount = Label():text("6790"):textColor(_Color.White):fontSize(12):marginLeft(3)
    self.countLinear:addView(self.scanCount)

    --话题创建者
    self.autoLinear = LinearLayout(LinearType.HORIZONTAL):marginLeft(120):setGravity(Gravity.BOTTOM):marginBottom(5)
    self.topView:addView(self.autoLinear)
    self.authorHeader = ImageView():width(25):height(25):image("https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_header.png")
    self.autoLinear:addView(self.authorHeader)
    self.authorName = Label():text("小美酱Pick榜 创建"):textColor(_Color.White):fontSize(12):setGravity(Gravity.CENTER_VERTICAL):marginLeft(5)
    self.autoLinear:addView(self.authorName)

    --相关灵感集栏
    self.aboutLinear = LinearLayout(LinearType.HORIZONTAL):width(MeasurementType.MATCH_PARENT):height(50):padding(10, 10, 10, 10)
    self.HeaderView:addView(self.aboutLinear)
    self.about = Label():text("相关灵感集："):textColor(_Color.White):fontSize(12):setGravity(Gravity.CENTER_VERTICAL)
    self.aboutLinear:addView(self.about)
    --标签列表视图
    self.tapTableView = self:setupTapListView()
    self.tapTableView:setGravity(Gravity.CENTER_VERTICAL)
    self.aboutLinear:addView(self.tapTableView)
    self.bottomView = LinearLayout(LinearType.VERTICAL):width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
    self.bottomView:bgColor(_Color.White):setCornerRadiusWithDirection(10, MBit:bor(RectCorner.TOP_LEFT, RectCorner.TOP_RIGHT))
    self.HeaderView:addView(self.bottomView)
    --tabSegment
    self.tabSegment = self:setupTabSegment()
    --line
    self.line = View():width(MeasurementType.MATCH_PARENT):height(1):bgColor(_Color.LightGray)
    self.bottomView:addView(self.line)
end
---灵感集标签列表
function _class:setupTapListView()
    if self.tapTableView then
        return self.tapTableView
    end

    self.tapTableView = CollectionView(false, false):width(MeasurementType.MATCH_PARENT):height(MeasurementType.WRAP_CONTENT):scrollDirection(ScrollDirection.HORIZONTAL)
    self.tapLayout = CollectionViewGridLayoutFix():itemSpacing(10):spanCount(1)
    self.tapTableView:layout(self.tapLayout)
    return self.tapTableView
end


function _class:setupTabSegment()
    titles = Array():add("热门"):add("最新")
    local tabSegment = TabSegmentView(Rect(0, 400, window:width(), 50), titles, _Color.Black)
    --self.tabSegment:normalFontSize(14):tintColor(_Color.Gray):selectedColor(_Color.DeepGray):setAlignment(TabSegmentAlignment.LEFT):selectScale(1)
    self.bottomView:addView(tabSegment)
    return tabSegment
end


return _class
