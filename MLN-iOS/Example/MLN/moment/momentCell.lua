---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by MoMo.
--- DateTime: 2018/11/7 16:56
---

local _class = {}

function _class:new(o)
o = o or {}
setmetatable(o, self)
self.__index = self
return o
end

function _class:setupUI(containerView)
self.userIcon = ImageView()
self.userIcon:marginTop(13):marginLeft(8)
self.userIcon:width(45):height(45):cornerRadius(45)
containerView:addView(self.userIcon)

self.nameLabel = Label()
self.nameLabel:marginTop(13):marginLeft(58)
self.nameLabel:fontSize(15)
self.nameLabel:textColor(Color(50,51,51,1))
self.nameLabel:width(MeasurementType.WRAP_CONTENT):height(20)
containerView:addView(self.nameLabel)

self.tagLabel = Label()
self.tagLabel:marginTop(35):marginLeft(58)
self.tagLabel:fontSize(9):cornerRadius(10):padding(0,7,0,5)
self.tagLabel:textColor(Color(255,255,255,1))
self.tagLabel:bgColor(Color(252, 204, 204, 1))
self.tagLabel:width(MeasurementType.WRAP_CONTENT):height(16)
containerView:addView(self.tagLabel)

self.contentLayout = LinearLayout(LinearType.VERTICAL)
self.contentLayout:padding(8,8,8,8)
self.contentLayout:marginTop(64):marginLeft(8):marginRight(10):marginBottom(10)
self.contentLayout:width(MeasurementType.MATCH_PARENT):height(MeasurementType.WRAP_CONTENT)
self.contentLayout:bgColor(Color(250,250,250,1))
containerView:addView(self.contentLayout)
self.contentLayout:addCornerMask(8, Color(255,0,0,1))

self.contentText = Label()
self.contentText:width(MeasurementType.WRAP_CONTENT):height(MeasurementType.WRAP_CONTENT)
self.contentText:lines(0)
self.contentText:fontSize(16)
self.contentText:textColor(Color(78,78,78, 1))
self.contentLayout:addView(self.contentText)

self.feedImageView = ImageView()
self.feedImageView:contentMode(ContentMode.SCALE_ASPECT_FILL)
self.feedImageView:bgColor(Color(255, 255, 255, 1))
self.feedImageView:width(80):height(100):marginTop(8):marginBottom(8)
self.contentLayout:addView(self.feedImageView)
self.feedImageView:addCornerMask(8, Color(255,0,0,1), RectCorner.ALL_CORNERS)

self.positionLayout = LinearLayout()
self.positionLayout:width(MeasurementType.MATCH_PARENT):height(20)
self.contentLayout:addView(self.positionLayout)

self.positionIcon = ImageView()
self.positionIcon:contentMode(ContentMode.SCALE_ASPECT_FILL)
self.positionIcon:width(20):height(20):marginRight(3)
self.positionIcon:image("https://img.momocdn.com/banner/65/FA/65FA9308-E049-DAB0-8734-F1BB49694E3020180719.png")
self.positionIcon:setGravity(Gravity.CENTER_VERTICAL)
self.positionLayout:addView(self.positionIcon)

self.positionLabel = Label()
self.positionLabel:width(MeasurementType.WRAP_CONTENT):height(20)
self.positionLabel:fontSize(13)
self.positionLabel:textColor(Color(170,170,170, 1))
self.positionLayout:addView(self.positionLabel)

self.sperateLine = View()
self.sperateLine:width(MeasurementType.MATCH_PARENT):height(0.5):marginLeft(8)
self.sperateLine:bgColor(Color(220, 220, 220, 1))
self.sperateLine:setGravity(Gravity.BOTTOM)
containerView:addView(self.sperateLine)
end

function _class:updateByItem(item, row)
self.userIcon:image(item:get("icon"))
self.nameLabel:text(item:get("name"))
self.tagLabel:text(item:get("tag"))
self.feedImageView:width(item:get("feedWidth")):height(item:get("feedHeight"))
self.feedImageView:image(item:get("feed"))
self.contentText:text(item:get("text"))
self.positionLabel:text(item:get("position"))
end

return _class
