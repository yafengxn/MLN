LuaQ  K       @/Users/Feng/Desktop/LuaProj/FFLua/Deploy/MMLuaKitGallery/IdeaMassView.lua              
  	@@	ΐ@d   	@ d@  	@d  	@ dΐ  	@d  	@ d@ 	@d 	@               _name        IdeaMassView 	       _version        1.0        new 	       rootView        setupTapTableView        setupTabSegementAction        setupWaterfallView        requestNetwork        setupDataSource                       J      ΐ  
A  	@ΐ   	 	@A	@A^              setmetatable        __index 	       dataList        Array 
       pageIndex       π?       type                                   	   
                   self               o                              F @ Z   @ F @ ^  K@@ \@ K@ \@ Kΐ@ \@ K A \@             containerView        setupTapTableView        setupTabSegementAction        setupWaterfallView        setupDataSource                                                            self                       &        E   F@ΐ Fΐ ΐΐ $  @ Α $A      @@Α $      @Α $Α  @            IdeaMassMainViewLayout        _headerView        adapter 	       initCell        fillCellData 	       rowCount        sizeForCell                    #   E@  \ Kΐ Αΐ  \K Α Ε@ ΖΑ\KΐΑ Α  \K@Β Α Α A Α \ K Γ Ε@  A  ΑΑ ά \  K Δ Α@ \	@ FD KΐΔ Ζ @ \@     	       tapLabel        Label        text         
       textColor        _Color        White 	       fontSize       (@       padding       @      .@       bgColor        Color      Q@      ΰ?       cornerRadius       D@       contentView        addView     #                                                                                                                      cell     "                      	   Δ   Ζ ΐΛ@ΐ@ ά@ Α@Aΐ A       	       dataList        get 	       tapLabel        text        author                                                      cell               _               row               item                 self             "            @ @@           	       dataList        size        !   !   !   !   !   "                 self         #   %           Α@                    Size      Q@      >@       $   $   $   $   $   %             section               row                                                 "   "       #   %   #   &             self               tapTableViewAdapter                   '   6        E   F@ΐ Fΐ Kΐΐ δ       \@            IdeaMassMainViewLayout        _headerView        tabSegment        setItemTabClickListener            (   5       D   F ΐ W  ΐD   F@ΐ Kΐ \@ D   Fΐΐ K Α \@ D   I  D   K@Α Β  $     \@             type 
       waterfall        resetLoading 	       dataList 
       removeAll        requestNetwork            -   3          @    @@@  ΐ    ΐ@ A@      	       dataList        size         
       waterfall        reloadData        .   .   /   /   /   /   /   /   0   0   0   0   3             success               _                  self    )   )   )   )   *   *   *   *   +   +   +   +   ,   ,   -   -   -   3   3   -   5             index                  self    (   (   (   (   5   5   (   6             self                    7   j     M   E@     Β  \Kΐ Εΐ  Ζ Α\K@Α Εΐ  Ζ Α\	@ Eΐ \ K Β Α@ \KΒ Αΐ \K Γ Α@ \KΓ Αΐ  A  \ 	@ E \ 	@F @ KΐΔ ΖA \@F @ K Ε Ζ@D \@F@D K@Ε δ   \@F@D KΕ δ@      \@F@D KΐΕ δ      \@F@D K Ζ δΐ      \@F @ K@Ζ δ      \@E FΐΖ K Η Ζ @ \@E  @ IF @ ^       
       waterfall        WaterfallView        width        MeasurementType        MATCH_PARENT        height        waterfallLayout        WaterfallLayoutFix        itemSpacing       (@       lineSpacing       2@
       spanCount        @       layoutInset       $@               waterfallAdapter        WaterfallAdapter        layout        adapter 	       initCell        fillCellData 	       rowCount        heightForCell        setLoadingCallback        IdeaMassMainViewLayout        _containerView        addView        _waterfallView            =   B        E   @  \ Kΐ \ ΐΐ @ 	@ @A AΑΑ @            require "       MMLuaKitGallery.IdeaWaterfallCell        new 	       cellView        CELL        contentView        addView        cellLayout        >   >   >   >   >   ?   ?   @   A   A   A   A   B             cell               REQCELL                   C   R    \   Π @@ΐΐΖ@ ΛΐΐAA   ΑA  B  ά@ Ζ@ ΛΐΐAA  A  ΑA   ά@ Δ   Ζ@ΑΛΑ@ άΑA BBΑB A  ΑA BΑB ΛΑAB ά E ΑΓ \  ΥA A  Α W@D ΑA BΑB ΖΑA ΖΒΛΑΒά  E Α \  ΥA A  ΑA ΑDBΑ A  ΑA AEΑBΑ A  ΑA ΑEΑB ΛΑA ά  A              @               contentView        padding       (@	       dataList        get        CELL        image        pic_big        desc        text 	       tostring        title                 si_proxycompany        album_title                   authorhead 
       pic_small        authorName        artist_name 
       likeCount        file_duration     \   D   D   D   E   E   E   E   E   E   E   E   G   G   G   G   G   G   G   I   I   I   I   I   J   J   J   J   J   J   J   K   K   K   K   K   K   K   K   K   K   K   K   K   K   K   K   L   L   L   L   L   M   M   M   M   M   M   M   M   M   M   M   M   M   M   M   M   M   O   O   O   O   O   O   O   P   P   P   P   P   P   P   Q   Q   Q   Q   Q   Q   Q   Q   Q   R             cell     [          _     [          row     [          item    [             self         S   U            @ @@           	       dataList        size        T   T   T   T   T   U                 self         V   ]           @@@  @@  Εΐ  Ζ Α  ά ΐ Α ή  @ Αΐ ή       	       dataList        get        si_proxycompany        string        len       .@     q@     @o@       W   W   W   W   W   W   W   W   X   X   X   X   X   X   Y   Y   Y   [   [   ]             section               row               str                 self         ^   f            @    δ      @             requestNetwork            _   e          ΐ    @@@@     @@@     @ΐ@@      
       waterfall        stopLoading        reloadData        noMoreData        `   `   a   a   a   a   b   b   b   b   c   c   c   c   e             success               data                  self    _   _   _   e   e   _   f                 self M   8   8   8   8   8   8   8   8   8   8   8   8   8   9   9   9   9   9   9   9   9   9   9   9   9   9   9   9   9   9   9   :   :   :   ;   ;   ;   ;   <   <   <   <   =   =   B   =   C   C   R   R   C   S   S   U   U   S   V   V   ]   ]   V   ^   ^   f   f   ^   g   g   g   g   g   h   h   h   i   i   j             self     L               k        (   Ζ @ @ΐ@Z   @ 	@@@	ΐ@ΐΖ @  Α Z   @ 	@A  	AΕΐ Λ Βά Ϊ    Ε@ ΛΒAΑ €            ά@ ΐΕ@ Λ ΓAA €A            ά@             type       π?
       pageIndex       @       @      &@      "@       System        Android        File        asyncReadMapFile <       file://android_asset/MMLuaKitGallery/discoverry_detail.json        asyncReadFile #       file://gallery/json/musicRank.json            z       #      Α@    @   Υ @ ΐ@   Α A Δ   Ϊ    Δ  Ι     Δ  ΖΑΛΐΑ@ ά@Δ   @ ά@ΐ   Β    @            print        codeNumber:  	       tostring                get        result 	       dataList        addAll     #   {   {   {   {   {   {   {   |   |   }   }   }   ~   ~   ~                                                                         codeNumber     "   	       response     "          data                 first        self 	       complete                )      Α@    @   Υ @   @A  ΐ  A @ΐ  ΐA Δ   Ϊ    Δ  Ι    Δ  Ζ@ΒΛΒ@ ά@Δ   @ ά@ΐ   Β    @            print        codeNumber:  	       tostring        map        StringUtil 
       jsonToMap                get        result 	       dataList        addAll     )                                                                                                                                        codeNumber     (   	       response     (          data    #             first        self 	       complete (   l   l   l   m   m   n   n   p   q   r   r   r   s   s   t   t   v   y   y   y   y   y   z   z   z               z                                           self     '          first     '   	       complete     '                  €        K @ Β  $      \@             requestNetwork               £          ΐ    @@@  @ΐ   A@AA  @ΑA ΑAA @  ΐ   ABΐB@ ΐ   CΐB@      	       dataList        size                IdeaMassMainViewLayout        _headerView        iv        image        get       π?
       pic_radio        tapTableView        reloadData        _waterfallView                                                                                                      £             success               _                  self          £   £      €             self                                    &      6   '   j   7      k   €      ₯   ₯             _class           