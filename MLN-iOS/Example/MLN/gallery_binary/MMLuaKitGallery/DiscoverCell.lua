LuaQ  K       @/Users/Feng/Desktop/LuaProj/FFLua/Deploy/MMLuaKitGallery/DiscoverCell.lua              
  	@@	À@d   	@ d@  	@d  	@ dÀ  	@              _name        DiscoverCell 	       _version        1.0        new        setupCellSubviews        updateContentCountText        updateContentIcons               	        J      À  
A  	@^              setmetatable        __index                             	             self               o                   
   H     G  @  Å  ÆÀÀ 	  @  A  @A ÁA@    A  @A  Ë@BE FÁÂÜ@Ë CB  Ü@Ë@CA Á DÅA ÆÄÜ@	Å@    EÜ AÅ A AAÁ FA FA	À  KGÁA \KÁÁ \KAÁÁ \KÆÅA ÆÆ\AKÁGÁ \A	 KÈÀ \AEÁ \ Ç	 A BIAA	 FB FAÁÉ
 AJÂ DJÂ
 KAKB A	@È A  ËGAÂ ÜËÁA ÜËAÁA ÜËÆEB FÆÜAËÁGA ÜA	ËÈ@ ÜAÅÁ Ü Ç	 A BIBA	 FB FBÂÉ BJÂ DJÂ
 KBKB B	ÀÈBÂ  KBEÁ	 \KÁÀ \KBÁÁ \BKBJÅÂ ÆBÍ\KBËÁ \KÂÍÅ ÆBÎ\B	 AÂ B  Å  ÆÅ ËGA ÜËBÅA ÜËÁ@ ÜËBÁ@ÜËÆEC FÆÜBÅB Ü ËÁE FCÉÜËBÁ@Ü	
  	   KAÀ\KCÁÀ\KÐÏÉ\KCÐÂ \CE FÃÐÃO À \CKÈÀ \CE \ ÇÄ A CA PÉCP C ÃPÆÃO  CÈ C  ËGAD ÜËÁ@ÜËCÁ@ÜËÐOÉÜËCÐB ÜCÅ ÆÃÐÄO @ ÜCËÈ@ ÜCÅÃ Ü ÇÄ A DI	DAD	À¢HDHD@ H HH H D  E          baseLayout        LinearLayout        LinearType 	       VERTICAL        width        height        MeasurementType        MATCH_PARENT 
       ImageView        contentMode        ContentMode        SCALE_ASPECT_FIT 	       lazyLoad        addCornerMask        @       _Color        White        RectCorner        ALL_CORNERS 
       imageView        HORIZONTAL 
       marginTop       >À      9@       setGravity        Gravity        CENTER        imageViewLayout        marginLeft       $@      0@       image D       https://s.momocdn.com/w/u/others/2019/08/28/1566999785245-favor.png        favorImageView        addView        Label        @       WRAP_CONTENT       4@       text        53ç¯ 
       textColor 
       textAlign 
       TextAlign        LEFT 	       fontSize        countLabel       @C       https://s.momocdn.com/w/u/others/2019/08/28/1566999801782-look.png        lookImageView        4301 
       lookLabel       >@       Black       ,@       setTextFontStyle 
       FontStyle        BOLD        titleLabel       .@               View        updateLayout 
       iconViews        cornerRadius        gone        table        insert 
       iconLabel     G                                                                                                                                                                                                                                                                                                                                                                                                      !   !   !   "   #   #   #   $   $   %   %   %   %   %   %   %   %   %   %   %   %   %   %   &   &   &   &   &   &   &   &   &   &   &   &   &   &   '   (   (   (   )   )   *   *   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   +   +   +   ,   -   .   .   .   .   /   /   /   /   /   /   /   /   /   /   /   /   /   /   /   /   0   0   0   0   0   0   0   0   0   1   2   2   3   3   4   4   4   4   4   4   4   4   4   5   5   5   6   6   6   6   6   7   7   7   8   8   9   9   9   9   9   9   9   9   9   9   9   9   :   :   :   ;   ;   ;   ;   ;   <   <   <   =   =   >   >   >   >   >   >   >   >   >   >   >   >   ?   ?   ?   @   @   @   @   @   A   A   A   B   B   C   C   C   C   C   C   C   C   C   C   D   E   E   E   F   F   F   G   G   G   G   G   G   G   G   G   G   G   G   G   H             self     F         width     F  
       imageView    F         imageViewLayout (   F         favorImageView 8   F         countLabel N   F         lookImageView p   F  
       lookLabel    F         titleLabel ¨   F         iconHeight ¾   F         updateLayout Â   F         imagesLayout Û   F  
       iconView1 à   F  
       iconView2 ö   F  
       iconView3   F  
       iconLabel (  F              I   S     	*   Z@         Å@  ÆÀÁ  @ Ü   Ë AEA FÁÜËÀÁA ÜË@ÂE FÁÂÜ@Å@ Æ ÃACÁ Â AACÅA  ÆÄ  Ü ÌÁÂ AD ÁD A            StyleString        string        format        æ´æ°äº%sç¯åå®¹ 
       fontColor        _Color        Black 	       fontSize       $@
       fontStyle 
       FontStyle        BOLD        MediumGray        setFontColorForRange       ð?      @       len       @
       iconLabel 
       styleText     *   J   J   K   M   M   M   M   M   M   M   N   N   N   N   N   N   N   N   N   N   N   O   O   P   P   P   P   P   Q   Q   Q   Q   Q   Q   Q   Q   Q   R   R   R   R   S             self     )          count     )          text 
   )   
       textColor    )               T   h    ,      å   ¢@  Ô  Ú@    Á   A@  À   Æ@@  À @ Á@ AÀ@ Á@  A FA@ T  AB@ ÂÀKBAÂ  \BKAÆÂ\B KBAÂ \Bü             
       iconViews        updateLayout        hidden       ð?       gone        image     ,   U   U   U   V   V   V   V   W   W   W   W   X   Z   Z   [   [   [   [   [   ]   ]   ]   ]   ^   ^   ^   ^   ^   _   _   `   `   a   a   a   b   b   b   b   d   d   d   ^   h   	          self     +          arg     +          urls    +          count    +          (for index)    +          (for limit)    +          (for step)    +          i    *   	       iconView    *                   	      H   
   S   I   h   T   i   i             _class           