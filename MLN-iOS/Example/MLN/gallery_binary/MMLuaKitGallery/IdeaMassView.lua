LuaQ  K       @/Users/Feng/Desktop/LuaProj/FFLua/Deploy/MMLuaKitGallery/IdeaMassView.lua              
�  	@@�	�@�d   	@ �d@  	@��d�  	@ �d�  	@��d  	@ �d@ 	@��d� 	@ �d� 	@��d  	@ �d@ 	@��d� 	@ �d� 	@��d  	@ �   �           _name        IdeaMassView 	       _version        1.0        new        loadExtensions 	       rootView        createSubviews        setupContainerView        setupTitleView        setupHeaderView        setupTopView        setupTapListView        setupTabSegment        setupWaterfallView        requestNetwork        setupDataSource                       J   �   � � 
A  	���@���  ��� 	� �	@A�	@A�^   �           setmetatable        __index 	       dataList        Array 
       pageIndex       �?       type                                   	   
                   self               o                              E   �@  \@  �           require        MMLuaKitGallery.Constant                              self                               F @ Z   @ �F @ ^  K@@ \@ K�@ \@ K�@ \@ F @ ^   �           containerView        loadExtensions        createSubviews        setupDataSource                                                            self                               K @ \@ K@@ \@ K�@ \@ K A \� 	@��F@A K�� ��@ \@� �           setupContainerView        setupTitleView        setupHeaderView 
       waterfall        setupWaterfallView        containerView        addView                                                            self                        &        E@  ��  ��@\� 	@ �F @ K � �@ ƀ�\��K�� �@ ƀ�\��K � �@ ƀ�\@�E� K � \� Z   @�F @ K@� ŀ ����  \@   �           containerView        LinearLayout        LinearType 	       VERTICAL        width        MeasurementType        MATCH_PARENT        height        bgColor        _Color        White        System        iOS 
       marginTop        window        statusBarHeight        !   !   !   !   !   "   "   "   "   "   "   "   "   "   "   "   "   "   #   #   #   #   #   $   $   $   $   $   $   &             self                    '   4     O   E@  ��  \� K�� \� 	@ �F @ K@� ��  \� 	@ �F�A K � � A \@�E� \�� K�� �  \��K@� �  \��K�� �� \��K � �@ ˀ�E� F��� �AE�  \�  	@��F@B K�� �� \@�F A K � �@B \@�F@B K � �   \@�E� \�� K�� �  \��K@� �  \��K�� �� \��K � �@ ˀ�E� F���� �AE�  \�  	@��F@F K�� �  \@�F A K � �@F \@� �           navigation        require        MMLuaKitGallery.NavigationBar        new        navibar        bar 
       灵感集        containerView        addView        backBtn 
       ImageView        width       6@       height        marginLeft       4@       setGravity        MBit        bor        Gravity        LEFT        CENTER_VERTICAL        image 
       icon_back        onClick 	       shareBtn        marginRight        RIGHT        1567316383469-minshare            .   0            @@ ��  ��@@� �    
       Navigator 
       closeSelf 	       AnimType        Default        /   /   /   /   /   0           O   (   (   (   (   (   (   )   )   )   )   )   )   *   *   *   *   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   +   ,   ,   ,   ,   -   -   -   -   .   .   0   .   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   2   2   2   2   3   3   3   3   4             self     N               5   8        K @ \@ F@@ K�� ��@ \@� �           setupTopView        containerView        addView        HeaderView        6   6   7   7   7   7   8             self                    9   _     v  E@  ��  ��@\� K � �@ ƀ�\��K�� �  \��K@� ŀ ���\��	@ �E@ \�� K � �@ ƀ�\��K�� �@ ƀ�\��K�� �  A AA �A \� 	@ �F @ K�� � C \@�E  \�� K � �@ \��K�� �@ \��K�� �� \��	@��F C K�� ��D \@�E@ \�� K�� �� \��K � ŀ �@�\��K�� �� \��K � �@ \��K�� ŀ �@�\��K�� �� � A� �� \� K�� �� \��K � �@	 ƀ�\��	@ �F C K�� � F \@�E@ \�� K � �@
 \��K�� ��
 \��K � ŀ �@�\��K�� ��
 \��K � �@ ƀ�\��	@��F C K�� ��I \@�E@  ��  � L\� K � �@
 \��K@� �� \��	@��F C K�� ��K \@�E  \�� K � �  \��K�� �  \��K�� �� \��K@� �� \��	@��F�K K�� ��L \@�E@ \�� K�� �  \��K � ŀ �@�\��K�� �� \��K � �@ \��	@��F�K K�� ��M \@�E  \�� K � �  \��K�� �  \��K � �� \��K@� �  \��	@ �F�K K�� ƀN \@�E@ \�� K�� �� \��K � ŀ �@�\��K�� �� \��K � �@ \��	@��F�K K�� �@O \@�E@  ��  � L\� K � �@
 \��K � �@	 � �\��K@� �� \��	@��F C K�� ��O \@�E  \�� K � �  \��K�� �  \��K@� �@ \��	@��F�O K�� ��P \@�E@ \�� K�� �� \��K � ŀ �@�\��K�� �� \��K � �@	 � �\��K � �� \��	@ �F�O K�� ƀQ \@�E@  ��  � L\� K � �@ ƀ�\��K�� �� \��K�� �@ A AA �A \� 	@��F @ K�� �@R \@�E@ \�� K�� �  \��K � ŀ �@�\��K�� �� \��K � �@	 � �\��	@��F@R K�� ��R \@�K@S \� K � �@	 � �\@�F@R K�� �@S �  \@  E@  ��  ��@\� K � �@ ƀ�\��K�� �@ ƀ�\��	@ �F�S K@� ŀ �@�\��K�� �@  AT�� ��TŁ �� \@  F @ K�� ƀS \@�K�U \� 	@��E@ \�� K � �@ ƀ�\��K�� �@ \��K@� ŀ � �\��	@��F�S K�� ��U \@� � Y          HeaderView        LinearLayout        LinearType 	       VERTICAL        width        MeasurementType        MATCH_PARENT        height      �l@       bgColor        _Color        Gray        topView        View        WRAP_CONTENT        padding       4@      $@       addView        iv 
       ImageView       Y@       cornerRadius       @
       attention        Label        text 	       + 关注 
       textColor        White 	       fontSize       (@       borderWidth       �?       borderColor        @       setGravity        Gravity        RIGHT        title        marginLeft       ^@       一周穿搭不重样       0@       setTextFontStyle 
       FontStyle        BOLD        countLinear        HORIZONTAL 
       marginTop       <@	       pageLogo       .@       image G       https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_star.png 
       pageCount        200篇       @	       scanLogo        @G       https://s.momocdn.com/w/u/others/2019/10/18/1571393656549-mls_scan.png 
       scanCount        6790        autoLinear        BOTTOM        marginBottom       @       authorHeader       9@I       https://s.momocdn.com/w/u/others/2019/10/18/1571393657050-mls_header.png        authorName        小美酱Pick榜 创建        CENTER_VERTICAL        aboutLinear       I@       about        相关灵感集：        setupTapListView        bottomView        setCornerRadiusWithDirection        MBit        bor        RectCorner 	       TOP_LEFT 
       TOP_RIGHT        tabSegment        setupTabSegment        line 
       LightGray     v  :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   <   <   <   <   =   =   =   =   =   =   =   =   =   =   =   =   >   >   >   >   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   ?   @   @   @   @   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   A   B   B   B   B   C   C   C   C   C   C   C   C   C   C   C   D   D   D   D   E   E   E   E   E   E   E   E   E   E   E   E   E   E   E   F   F   F   F   G   G   G   G   G   G   G   G   G   G   G   G   G   G   G   G   H   H   H   H   I   I   I   I   I   I   I   I   I   I   I   I   I   I   I   J   J   J   J   K   K   K   K   K   K   K   K   K   K   K   K   K   K   K   K   L   L   L   L   M   M   M   M   M   M   M   M   M   M   M   M   M   M   M   N   N   N   N   O   O   O   O   O   O   O   O   O   O   O   O   P   P   P   P   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   R   R   R   R   S   S   S   S   S   S   S   S   S   S   S   S   S   S   S   S   S   S   T   T   T   T   U   U   U   U   U   U   U   U   U   U   U   U   U   U   U   U   U   V   V   V   V   W   W   W   W   W   W   X   X   X   X   X   Y   Y   Y   Y   Y   Y   Y   Y   Y   Y   Y   Y   Y   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   Z   [   [   [   [   \   \   \   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ^   ^   ^   ^   _             self     u              `   r     6   E@  �   �   \��K�� ��  � �\��K@� ��  ƀ�\��K�� �  �@�\��	@ �E� \�� K � �@ \��K�� �� \��	@ �E@ \�� 	@ �F D K�� �   \@�F D K�� �@      \@�F D K � �      \@�F @ K@� ƀB \@�F @ K�� � D \@�F @ ^   �           tapTableView        CollectionView        width        MeasurementType        MATCH_PARENT        height        WRAP_CONTENT        scrollDirection        ScrollDirection        HORIZONTAL 
       tapLayout        CollectionViewGridLayoutFix        itemSpacing       $@
       spanCount       �?       tapAdapter        CollectionViewAutoFitAdapter 	       initCell        fillCellData 	       rowCount        layout        adapter            d   g     #   E@  \�� K�� ��  \��K � �@ ƀ�\��K�� �  \��K@� �� � A� �� \� K � �@ � A� �� �� � �\�  K � �@ \��	@ �F�D K�� � @ \@� �    	       tapLabel        Label        text         
       textColor        _Color        White 	       fontSize       (@       padding       @      .@       bgColor        Color      �Q@      �?       cornerRadius       D@       contentView        addView     #   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   e   f   f   f   f   g             cell     "               h   k    	   �   � ��@�@ ܀��@ �@�A� ��A   �    	       dataList        get 	       tapLabel        text        author        i   i   i   i   i   j   j   j   j   j   j   k             cell               _               row               item                 self         l   n            @ @@       �    	       dataList        size        m   m   m   m   m   n                 self 6   a   a   a   a   a   a   a   a   a   a   a   a   a   a   a   a   a   b   b   b   b   b   b   b   b   b   c   c   c   d   d   g   d   h   h   k   k   h   l   l   n   n   l   o   o   o   o   p   p   p   p   q   q   r             self     5               s   �     6   E@  \�� K�� ��  \��K�� �  \��G   E� �� �  A E� K��\� � ����   A �C\� 	@��F@A K�� �  \��K@� �@ ƀ�\��K�� �@ � �\��K@� ŀ ���\��K � �@ \@�F@A K�� �       \@�F�F K � �@A \@�F@A ^   �           titles        Array        add        热门        最新        tabSegment        TabSegmentView        Rect               y@       window        width       I@       _Color        Black        normalFontSize       ,@
       tintColor        Gray        selectedColor 	       DeepGray        setAlignment        TabSegmentAlignment        LEFT        selectScale       �?       setItemTabClickListener        bottomView        addView            w   �       D   F � W � ��D   F@� K�� \@ D   F�� K � \@ D   I  �D   K@� � � $     \@  �           type 
       waterfall        resetLoading 	       dataList 
       removeAll        requestNetwork            |   �          @��   � @�@@�� � �� ��   ��@� A�@  �    	       dataList        size         
       waterfall        reloadData        }   }   ~   ~   ~   ~   ~   ~               �             success               _                  self    x   x   x   x   y   y   y   y   z   z   z   z   {   {   |   |   |   �   �   |   �             index                  self 6   t   t   t   t   t   t   t   t   t   u   u   u   u   u   u   u   u   u   u   u   u   u   u   v   v   v   v   v   v   v   v   v   v   v   v   v   v   v   v   v   v   v   w   w   �   �   w   �   �   �   �   �   �   �             self     5               �   �     E   E@  �   � � \��K�� ��  � �\��K@� ��  � �\��	@ �E� \�� K � �@ \��K�� �� \��K � �@ \��K�� ��  A � \� 	@ �E� \�� 	@��F@D K�� �   \@�F@D K � �@      \@�F@D K@� �      \@�F@D K�� ��      \@�F @ K�� ƀA \@�F @ K � �@D \@�F @ K@� �      \@�F @ ^   �    
       waterfall        WaterfallView        width        MeasurementType        MATCH_PARENT        height        waterfallLayout        WaterfallLayoutFix        itemSpacing       (@       lineSpacing       2@
       spanCount        @       layoutInset       $@               waterfallAdapter        WaterfallAdapter 	       initCell        fillCellData 	       rowCount        heightForCell        layout        adapter        setLoadingCallback            �   �        E   �@  \� K�� \� ��� �@ 	@ ��@A ��A�� �@� �           require "       MMLuaKitGallery.IdeaWaterfallCell        new 	       cellView        CELL        contentView        addView        cellLayout        �   �   �   �   �   �   �   �   �   �   �   �   �             cell               REQCELL                   �   �    \   � @@���ƀ@ ���AA  � �A  B  �@ ��ƀ@ ���AA  �A  �A   �@ �   �@�ˀ�@ ܀��A BB���B ��A  �A �B�B� ˁ�AB ܁�� E ���� ��\�  �A�� A  ��� ��W@D ��A �B�B� ��A Ɓ����܁ � E ��� ��\�  �A�� A  �A �DB��� ��A  �A AE�B���� ��A  �A �E�B� ˁ�A ���  A   �           @               contentView        padding       (@	       dataList        get        CELL        image        pic_big        desc        text 	       tostring        title                 si_proxycompany        album_title                   authorhead 
       pic_small        authorName        artist_name 
       likeCount        file_duration     \   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             cell     [          _     [          row     [          item    [             self         �   �            @ @@       �    	       dataList        size        �   �   �   �   �   �                 self         �   �       �   � @�@@ � ����@@�  �����  � �  ܀ ���� ��� �  @ ��� �   �    	       dataList        get        si_proxycompany        string        len       .@     �q@     @o@       �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             section               row               str                 self         �   �            @ �   �      @  �           requestNetwork            �   �          ���   � @�@@�@ �   � @��@�@ �   � @��@�@  �    
       waterfall        stopLoading        reloadData        noMoreData        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             success               data                  self    �   �   �   �   �   �   �                 self E   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             self     D               �   �     (   � @ @�@�Z   @ �	@@�@�	�@���� @  � �Z   @ �	@A�  �	�A��� � �܀ �    ��@ ˀ�A� �    �        �@ ���@ � �AA �A    �        �@  �           type       �?
       pageIndex       @       @      &@      "@       System        Android        File        asyncReadMapFile <       file://android_asset/MMLuaKitGallery/discoverry_detail.json        asyncReadFile #       file://gallery/json/musicRank.json            �   �    #   �   �@  �  @  � � ��@ �@  �� � A ����   �   � �� � ɀ ����    �� � ƀ����@ �@��  � @ �@�� ��  �    �@� �           print        codeNumber:  	       tostring                get        result 	       dataList        addAll     #   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             codeNumber     "   	       response     "          data                 first        self 	       complete         �   �    )   �   �@  �  @  � � ��@ �  �@A � �����  �A @���  ��A ����   �   � �� � ɀ�����    �� � �@�ˀ�@ �@��  � @ �@�� ��  �    �@� �           print        codeNumber:  	       tostring        map        StringUtil 
       jsonToMap                get        result 	       dataList        addAll     )   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             codeNumber     (   	       response     (          data    #             first        self 	       complete (   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             self     '          first     '   	       complete     '               �   �        K @ � � $      \@  �           requestNetwork            �   �          @��   � @�@@�� � ����   ��@� A  @AA�� ��AA�� ��@  �   � B�@B�@ �   ��B�@B�@  �    	       dataList        size                iv        image        get       �?
       pic_radio        tapTableView        reloadData 
       waterfall        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             success               _                  self    �   �   �   �   �   �             self                                                &       4   '   8   5   _   9   r   `   �   s   �   �   �   �   �   �   �   �             _class           