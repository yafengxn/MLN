//
//  MLNUIDebuggerTypeConverter.m
//  MLNDevTool
//
//  Created by Feng on 2020/2/25.
//

#import "MLNUIDebuggerTypeConverter.h"
#import "LookinObject.h"
#import "LookinAttributesGroup.h"
#import "LookinAttributesSection.h"
#import "LookinAttribute.h"
#import "PblookinAttrIdentifiers.pbobjc.h"

@implementation MLNUIDebuggerTypeConverter

+ (pbpoint *)pointWithCGPoint:(CGPoint)aPoint
{
    pbpoint *point = [pbpoint new];
    point.x = aPoint.x;
    point.y = aPoint.y;
    return point;
}

+ (pbsize *)sizeWithCGSize:(CGSize)aSize;
{
    pbsize *size = [pbsize new];
    size.width = aSize.width;
    size.height = aSize.height;
    return size;
}

+ (pbrect *)rectWithCGRect:(CGRect)aRect
{
    pbpoint *orgin = [self pointWithCGPoint:aRect.origin];
    pbsize *size = [self sizeWithCGSize:aRect.size];
    pbrect *rect = [pbrect new];
    rect.origin = orgin;
    rect.size = size;
    return rect;
}

+ (pbcolor *)colorWithUIColor:(NSArray *)colors
{
    if (colors == nil) {
        return nil;
    }
    pbcolor *color = [pbcolor new];
    color.colorsArray = [GPBInt64Array new];
    [color.colorsArray addValue:[colors[0] integerValue]];
    [color.colorsArray addValue:[colors[1] integerValue]];
    [color.colorsArray addValue:[colors[2] integerValue]];
    [color.colorsArray addValue:[colors[3] integerValue]];

    return color;
}

+ (pbimage *)imageWithUIImage:(UIImage *)aImage
{
    pbimage *image = [pbimage new];
    image.size = [self sizeWithCGSize:aImage.size];
    image.imageData = UIImagePNGRepresentation(aImage);
    return image;
}

+ (pbobject *)objectWithLookinObject:(LookinObject *)aObject
{
    pbobject *object = [pbobject new];
    object.oid = aObject.oid;
    object.memoryAddress = aObject.memoryAddress;
    object.classChainListArray = [NSMutableArray arrayWithArray:aObject.classChainList];
    object.shortSelfClassName = aObject.shortSelfClassName;
    object.completedSelfClassName = aObject.completedSelfClassName;
    return object;
}

+ (pblookinattributegroup *)attributeGroupWithLookinAttributesGroup:(LookinAttributesGroup *)aGroup
{
    pblookinattributegroup *attributeGroup = [pblookinattributegroup new];
    attributeGroup.identifier = [self attrGroupIdentifier:aGroup.identifier];
    attributeGroup.title = aGroup.title;
    NSMutableArray *attrSectionArray = [NSMutableArray array];
    for (LookinAttributesSection *eachSection in aGroup.attrSections) {
        pblookinattributesection *section = [self attributeSectionWithLookinAttributesSection:eachSection];
        section.title = eachSection.title;
        [attrSectionArray addObject:section];
    }
    attributeGroup.attributesArray = attrSectionArray;
    
    return attributeGroup;
}

+ (pblookinattributesection *)attributeSectionWithLookinAttributesSection:(LookinAttributesSection *)aSection
{
    pblookinattributesection *section = [pblookinattributesection new];
    section.identifier = [self attrSectionIdentifier:aSection.identifier];
    NSMutableArray *attributesArray = [NSMutableArray array];
    for (LookinAttribute *eachAttribute in aSection.attributes) {
        pblookinattribute *attribute = [self attributeWithLookinAttribute:eachAttribute];
        attribute.title = eachAttribute.title;
        [attributesArray addObject:attribute];
    }
    section.attributesArray = attributesArray;
    
    return section;
}

+ (pblookinattribute *)attributeWithLookinAttribute:(LookinAttribute *)aAttribute
{
    pblookinattribute *attribute = [pblookinattribute new];
    attribute.identifier = [self attrIdentifier:aAttribute.identifier];
    attribute.type = [self attrTypeWithLookinAttribute:aAttribute];
    attribute.value = [self attrValueWithLookinAttribute:aAttribute];
    return attribute;
}


+ (PBLookinAttrGroupIdentifier)attrGroupIdentifier:(LookinAttrGroupIdentifier)aAttrGroupIdentifier
{
    PBLookinAttrGroupIdentifier groupIdentifier = 0;
    if ([LookinAttrGroup_None isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupNone;
    } else if ([LookinAttrGroup_Class isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupClass;
    } else if ([LookinAttrGroup_Relation isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupRelation;
    } else if ([LookinAttrGroup_Layout isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupLayout;
    } else if ([LookinAttrGroup_AutoLayout isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupAutoLayout;
    } else if ([LookinAttrGroup_ViewLayer isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupViewLayer;
    } else if ([LookinAttrGroup_UIImageView isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUiimageView;
    } else if ([LookinAttrGroup_UILabel isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUilabel;
    } else if ([LookinAttrGroup_UIControl isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUicontrol;
    } else if ([LookinAttrGroup_UIButton isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUibutton;
    } else if ([LookinAttrGroup_UIScrollView isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUiscrollView;
    } else if ([LookinAttrGroup_UITableView isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUitableView;
    } else if ([LookinAttrGroup_UITextView isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUitextView;
    } else if ([LookinAttrGroup_UITextField isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUitextField;
    } else if ([LookinAttrGroup_UIVisualEffectView isEqualToString:aAttrGroupIdentifier]) {
        groupIdentifier = PBLookinAttrGroupIdentifier_PblookinAttrGroupUivisualEffectView;
    } else {
        NSLog(@"Not supported LookinAttrGroupIdentifier!");
    }
    return groupIdentifier;
}

+ (PBLookinAttrSectionIdentifier)attrSectionIdentifier:(LookinAttrSectionIdentifier)aAttrSectionIdentifier
{
    
//     LookinAttrSectionIdentifier const LookinAttrSec_PblookinAttrSec = @"n";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_Class_Class = @"cl_c";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_Relation_Relation = @"r_r";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_Layout_Frame = @"l_f";
//     LookinAttrSectionIdentifier const LookinAttrSec_Layout_Bounds = @"l_b";
//     LookinAttrSectionIdentifier const LookinAttrSec_Layout_SafeArea = @"l_s";
//     LookinAttrSectionIdentifier const LookinAttrSec_Layout_Position = @"l_p";
//     LookinAttrSectionIdentifier const LookinAttrSec_Layout_AnchorPoint = @"l_a";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_AutoLayout_Hugging = @"a_h";
//     LookinAttrSectionIdentifier const LookinAttrSec_AutoLayout_Resistance = @"a_r";
//     LookinAttrSectionIdentifier const LookinAttrSec_AutoLayout_Constraints = @"a_c";
//     LookinAttrSectionIdentifier const LookinAttrSec_AutoLayout_IntrinsicSize = @"a_i";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_Visibility = @"v_v";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_InterationAndMasks = @"v_i";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_Corner = @"v_c";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_BgColor = @"v_b";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_Border = @"v_bo";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_Shadow = @"v_s";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_ContentMode = @"v_co";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_TintColor = @"v_t";
//     LookinAttrSectionIdentifier const LookinAttrSec_ViewLayer_Tag = @"v_ta";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UIImageView_Name = @"i_n";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIImageView_Open = @"i_o";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_Text = @"lb_t";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_Font = @"lb_f";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_NumberOfLines = @"lb_n";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_TextColor = @"lb_tc";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_BreakMode = @"lb_b";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_Alignment = @"lb_a";
//     LookinAttrSectionIdentifier const LookinAttrSec_UILabel_CanAdjustFont = @"lb_c";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UIControl_EnabledSelected = @"c_e";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIControl_VerAlignment = @"c_v";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIControl_HorAlignment = @"c_h";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIControl_QMUIOutsideEdge = @"c_o";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UIButton_ContentInsets = @"b_c";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIButton_TitleInsets = @"b_t";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIButton_ImageInsets = @"b_i";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_ContentInset = @"s_c";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_AdjustedInset = @"s_a";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_IndicatorInset = @"s_i";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_Offset = @"s_o";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_ContentSize = @"s_cs";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_Behavior = @"s_b";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_ShowsIndicator = @"s_si";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_Bounce = @"s_bo";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_ScrollPaging = @"s_s";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_ContentTouches = @"s_ct";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_Zoom = @"s_z";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIScrollView_QMUIInitialInset = @"s_ii";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_Style = @"t_s";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_SectionsNumber = @"t_sn";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_RowsNumber = @"t_r";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_SeparatorStyle = @"t_ss";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_SeparatorColor = @"t_sc";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITableView_SeparatorInset = @"t_si";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_Basic = @"tv_b";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_Text = @"tv_t";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_Font = @"tv_f";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_TextColor = @"tv_tc";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_Alignment = @"tv_a";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextView_ContainerInset = @"tv_c";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_Text = @"tf_t";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_Placeholder = @"tf_p";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_Font = @"tf_f";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_TextColor = @"tf_tc";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_Alignment = @"tf_a";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_Clears = @"tf_c";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_CanAdjustFont = @"tf_ca";
//     LookinAttrSectionIdentifier const LookinAttrSec_UITextField_ClearButtonMode = @"tf_cb";
//
//     LookinAttrSectionIdentifier const LookinAttrSec_UIVisualEffectView_Style = @"ve_s";
//     LookinAttrSectionIdentifier const LookinAttrSec_UIVisualEffectView_QMUIForegroundColor = @"ve_f";
     
    
    PBLookinAttrSectionIdentifier sectionIdentifier = 0;
    if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_None]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecNone;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Class_Class]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecClassClass;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Relation_Relation]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecClassClass;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Layout_Frame]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecLayoutFrame;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Layout_Bounds]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecLayoutBounds;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Layout_SafeArea]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecLayoutSafeArea;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Layout_Position]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecLayoutPosition;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_Layout_AnchorPoint]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecLayoutAnchorPoint;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_AutoLayout_Hugging]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecAutoLayoutHugging;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_AutoLayout_Resistance]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecAutoLayoutResistance;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_AutoLayout_Constraints]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecAutoLayoutConstraints;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_AutoLayout_IntrinsicSize]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecAutoLayoutIntrinsicSize;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_Visibility]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerVisibility;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_InterationAndMasks]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerInterationAndMasks;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_Corner]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerCorner;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_BgColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerBgColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_Border]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerBorder;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_Shadow]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerShadow;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_ContentMode]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerContentMode;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_TintColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerTintColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_ViewLayer_Tag]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecViewLayerTag;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIImageView_Name]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiimageViewName;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIImageView_Open]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiimageViewOpen;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_Text]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelText;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_Font]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelFont;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_NumberOfLines]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelNumberOfLines;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_TextColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelTextColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_BreakMode]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelBreakMode;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_Alignment]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelAlignment;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UILabel_CanAdjustFont]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUilabelCanAdjustFont;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIControl_EnabledSelected]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUicontrolEnabledSelected;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIControl_VerAlignment]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUicontrolVerAlignment;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIControl_HorAlignment]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUicontrolHorAlignment;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIControl_QMUIOutsideEdge]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUicontrolQmuioutsideEdge;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIButton_ContentInsets]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUibuttonContentInsets;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIButton_TitleInsets]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUibuttonTitleInsets;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIButton_ImageInsets]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUibuttonImageInsets;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_ContentInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUibuttonContentInsets;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_AdjustedInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewAdjustedInset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_IndicatorInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewIndicatorInset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_Offset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewOffset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_ContentSize]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewContentSize;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_Behavior]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewBehavior;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_ShowsIndicator]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewShowsIndicator;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_Bounce]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewBounce;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_ScrollPaging]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewScrollPaging;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_ContentTouches]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewContentTouches;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_Zoom]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewZoom;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIScrollView_QMUIInitialInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUiscrollViewQmuiinitialInset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_Style]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewStyle;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_SectionsNumber]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewSectionsNumber;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_RowsNumber]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewRowsNumber;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_SeparatorStyle]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewSeparatorStyle;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_SeparatorColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewSeparatorColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITableView_SeparatorInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitableViewSeparatorInset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_Basic]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewBasic;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_Text]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewText;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_Font]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewFont;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_TextColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewTextColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_Alignment]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewAlignment;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextView_ContainerInset]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextViewContainerInset;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_Text]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldText;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_Placeholder]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldPlaceholder;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_Font]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldFont;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_TextColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldTextColor;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_Alignment]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldAlignment;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_Clears]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldClears;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_CanAdjustFont]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldCanAdjustFont;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UITextField_ClearButtonMode]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUitextFieldClearButtonMode;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIVisualEffectView_Style]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUivisualEffectViewStyle;
    } else if ([aAttrSectionIdentifier isEqualToString:LookinAttrSec_UIVisualEffectView_QMUIForegroundColor]) {
        sectionIdentifier = PBLookinAttrSectionIdentifier_PblookinAttrSecUivisualEffectViewQmuiforegroundColor;
    } else {
        NSLog(@"Not supoorted section identifier!");
    }
    return sectionIdentifier;
}

+ (PBLookinAttrIdentifier)attrIdentifier:(LookinAttrIdentifier)aAttrIdentifier
{
//    LookinAttrIdentifier const LookinAttr_PblookinAttrSec = @"n";
//
//    LookinAttrIdentifier const LookinAttr_Class_Class_Class = @"c_c_c";
//
//    LookinAttrIdentifier const LookinAttr_Relation_Relation_Relation = @"r_r_r";
//
//    LookinAttrIdentifier const LookinAttr_Layout_Frame_Frame = @"l_f_f";
//    LookinAttrIdentifier const LookinAttr_Layout_Bounds_Bounds = @"l_b_b";
//    LookinAttrIdentifier const LookinAttr_Layout_SafeArea_SafeArea = @"l_s_s";
//    LookinAttrIdentifier const LookinAttr_Layout_Position_Position = @"l_p_p";
//    LookinAttrIdentifier const LookinAttr_Layout_AnchorPoint_AnchorPoint = @"l_a_a";
//
//    LookinAttrIdentifier const LookinAttr_AutoLayout_Hugging_Hor = @"al_h_h";
//    LookinAttrIdentifier const LookinAttr_AutoLayout_Hugging_Ver = @"al_h_v";
//    LookinAttrIdentifier const LookinAttr_AutoLayout_Resistance_Hor = @"al_r_h";
//    LookinAttrIdentifier const LookinAttr_AutoLayout_Resistance_Ver = @"al_r_v";
//    LookinAttrIdentifier const LookinAttr_AutoLayout_Constraints_Constraints = @"al_c_c";
//    LookinAttrIdentifier const LookinAttr_AutoLayout_IntrinsicSize_Size = @"cl_i_s";
//
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Visibility_Hidden = @"vl_v_h";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Visibility_Opacity = @"vl_v_o";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_InterationAndMasks_Interaction = @"vl_i_i";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_InterationAndMasks_MasksToBounds = @"vl_i_m";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Corner_Radius = @"vl_c_r";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_BgColor_BgColor = @"vl_b_b";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Border_Color = @"vl_b_c";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Border_Width = @"vl_b_w";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Shadow_Color = @"vl_s_c";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Shadow_Opacity = @"vl_s_o";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Shadow_Radius = @"vl_s_r";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Shadow_OffsetW = @"vl_s_ow";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Shadow_OffsetH = @"vl_s_oh";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_ContentMode_Mode = @"vl_c_m";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_TintColor_Color = @"vl_t_c";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_TintColor_Mode = @"vl_t_m";
//    LookinAttrIdentifier const LookinAttr_ViewLayer_Tag_Tag = @"vl_t_t";
//
//    LookinAttrIdentifier const LookinAttr_UIImageView_Name_Name = @"iv_n_n";
//    LookinAttrIdentifier const LookinAttr_UIImageView_Open_Open = @"iv_o_o";
//
//    LookinAttrIdentifier const LookinAttr_UILabel_Text_Text = @"lb_t_t";
//    LookinAttrIdentifier const LookinAttr_UILabel_Font_Name = @"lb_f_n";
//    LookinAttrIdentifier const LookinAttr_UILabel_Font_Size = @"lb_f_s";
//    LookinAttrIdentifier const LookinAttr_UILabel_NumberOfLines_NumberOfLines = @"lb_n_n";
//    LookinAttrIdentifier const LookinAttr_UILabel_TextColor_Color = @"lb_t_c";
//    LookinAttrIdentifier const LookinAttr_UILabel_Alignment_Alignment = @"lb_a_a";
//    LookinAttrIdentifier const LookinAttr_UILabel_BreakMode_Mode = @"lb_b_m";
//    LookinAttrIdentifier const LookinAttr_UILabel_CanAdjustFont_CanAdjustFont = @"lb_c_c";
//
//    LookinAttrIdentifier const LookinAttr_UIControl_EnabledSelected_Enabled = @"ct_e_e";
//    LookinAttrIdentifier const LookinAttr_UIControl_EnabledSelected_Selected = @"ct_e_s";
//    LookinAttrIdentifier const LookinAttr_UIControl_VerAlignment_Alignment = @"ct_v_a";
//    LookinAttrIdentifier const LookinAttr_UIControl_HorAlignment_Alignment = @"ct_h_a";
//    LookinAttrIdentifier const LookinAttr_UIControl_QMUIOutsideEdge_Edge = @"ct_o_e";
//
//    LookinAttrIdentifier const LookinAttr_UIButton_ContentInsets_Insets = @"bt_c_i";
//    LookinAttrIdentifier const LookinAttr_UIButton_TitleInsets_Insets = @"bt_t_i";
//    LookinAttrIdentifier const LookinAttr_UIButton_ImageInsets_Insets = @"bt_i_i";
//
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Offset_Offset = @"sv_o_o";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ContentSize_Size = @"sv_c_s";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ContentInset_Inset = @"sv_c_i";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_AdjustedInset_Inset = @"sv_a_i";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Behavior_Behavior = @"sv_b_b";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_IndicatorInset_Inset = @"sv_i_i";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ScrollPaging_ScrollEnabled = @"sv_s_s";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ScrollPaging_PagingEnabled = @"sv_s_p";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Bounce_Ver = @"sv_b_v";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Bounce_Hor = @"sv_b_h";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ShowsIndicator_Hor = @"sv_h_h";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ShowsIndicator_Ver = @"sv_s_v";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ContentTouches_Delay = @"sv_c_d";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_ContentTouches_CanCancel = @"sv_c_c";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Zoom_MinScale = @"sv_z_mi";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Zoom_MaxScale = @"sv_z_ma";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Zoom_Scale = @"sv_z_s";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_Zoom_Bounce = @"sv_z_b";
//    LookinAttrIdentifier const LookinAttr_UIScrollView_QMUIInitialInset_Inset = @"sv_qi_i";
//
//    LookinAttrIdentifier const LookinAttr_UITableView_Style_Style = @"tv_s_s";
//    LookinAttrIdentifier const LookinAttr_UITableView_SectionsNumber_Number = @"tv_s_n";
//    LookinAttrIdentifier const LookinAttr_UITableView_RowsNumber_Number = @"tv_r_n";
//    LookinAttrIdentifier const LookinAttr_UITableView_SeparatorInset_Inset = @"tv_s_i";
//    LookinAttrIdentifier const LookinAttr_UITableView_SeparatorColor_Color = @"tv_s_c";
//    LookinAttrIdentifier const LookinAttr_UITableView_SeparatorStyle_Style = @"tv_ss_s";
//
//    LookinAttrIdentifier const LookinAttr_UITextView_Font_Name = @"te_f_n";
//    LookinAttrIdentifier const LookinAttr_UITextView_Font_Size = @"te_f_s";
//    LookinAttrIdentifier const LookinAttr_UITextView_Basic_Editable = @"te_b_e";
//    LookinAttrIdentifier const LookinAttr_UITextView_Basic_Selectable = @"te_b_s";
//    LookinAttrIdentifier const LookinAttr_UITextView_Text_Text = @"te_t_t";
//    LookinAttrIdentifier const LookinAttr_UITextView_TextColor_Color = @"te_t_c";
//    LookinAttrIdentifier const LookinAttr_UITextView_Alignment_Alignment = @"te_a_a";
//    LookinAttrIdentifier const LookinAttr_UITextView_ContainerInset_Inset = @"te_c_i";
//
//    LookinAttrIdentifier const LookinAttr_UITextField_Text_Text = @"tf_t_t";
//    LookinAttrIdentifier const LookinAttr_UITextField_Placeholder_Placeholder = @"tf_p_p";
//    LookinAttrIdentifier const LookinAttr_UITextField_Font_Name = @"tf_f_n";
//    LookinAttrIdentifier const LookinAttr_UITextField_Font_Size = @"tf_f_s";
//    LookinAttrIdentifier const LookinAttr_UITextField_TextColor_Color = @"tf_t_c";
//    LookinAttrIdentifier const LookinAttr_UITextField_Alignment_Alignment = @"tf_a_a";
//    LookinAttrIdentifier const LookinAttr_UITextField_Clears_ClearsOnBeginEditing = @"tf_c_c";
//    LookinAttrIdentifier const LookinAttr_UITextField_Clears_ClearsOnInsertion = @"tf_c_co";
//    LookinAttrIdentifier const LookinAttr_UITextField_CanAdjustFont_CanAdjustFont = @"tf_c_ca";
//    LookinAttrIdentifier const LookinAttr_UITextField_CanAdjustFont_MinSize = @"tf_c_m";
//    LookinAttrIdentifier const LookinAttr_UITextField_ClearButtonMode_Mode = @"tf_cb_m";
//
//    LookinAttrIdentifier const LookinAttr_UIVisualEffectView_Style_Style = @"ve_s_s";
//    LookinAttrIdentifier const LookinAttr_UIVisualEffectView_QMUIForegroundColor_Color = @"ve_f_c";
    
    
    PBLookinAttrIdentifier attrIdentifier = 0;
    if ([aAttrIdentifier isEqualToString:LookinAttr_None]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrNone;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Class_Class_Class]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrClassClassClass;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Relation_Relation_Relation]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrRelationRelationRelation;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Layout_Frame_Frame]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrLayoutFrameFrame;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Layout_Bounds_Bounds]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrLayoutBoundsBounds;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Layout_SafeArea_SafeArea]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrLayoutSafeAreaSafeArea;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Layout_Position_Position]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrLayoutPositionPosition;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_Layout_AnchorPoint_AnchorPoint]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrLayoutAnchorPointAnchorPoint;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_Hugging_Hor]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutHuggingHor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_Hugging_Ver]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutHuggingVer;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_Resistance_Hor]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutResistanceHor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_Resistance_Ver]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutResistanceVer;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_Constraints_Constraints]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutConstraintsConstraints;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_AutoLayout_IntrinsicSize_Size]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrAutoLayoutIntrinsicSizeSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Visibility_Hidden]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerVisibilityHidden;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Visibility_Opacity]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerVisibilityOpacity;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_InterationAndMasks_Interaction]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerInterationAndMasksInteraction;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_InterationAndMasks_MasksToBounds]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerInterationAndMasksMasksToBounds;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Corner_Radius]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerCornerRadius;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_BgColor_BgColor]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerBgColorBgColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Border_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerBorderColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Border_Width]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerBorderWidth;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Shadow_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerShadowColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Shadow_Opacity]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerShadowOpacity;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Shadow_Radius]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerShadowRadius;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Shadow_OffsetW]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerShadowOffsetW;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Shadow_OffsetH]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerShadowOffsetH;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_ContentMode_Mode]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerContentModeMode;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_TintColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerTintColorColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_TintColor_Mode]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerTintColorMode;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_ViewLayer_Tag_Tag]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrViewLayerTagTag;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIImageView_Name_Name]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiimageViewNameName;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIImageView_Open_Open]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiimageViewOpenOpen;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_Text_Text]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelTextText;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_Font_Name]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelFontName;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_Font_Size]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelFontSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_NumberOfLines_NumberOfLines]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelNumberOfLinesNumberOfLines;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_TextColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelTextColorColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_Alignment_Alignment]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelAlignmentAlignment;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_BreakMode_Mode]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelBreakModeMode;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UILabel_CanAdjustFont_CanAdjustFont]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUilabelCanAdjustFontCanAdjustFont;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIControl_EnabledSelected_Enabled]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUicontrolEnabledSelectedEnabled;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIControl_EnabledSelected_Selected]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUicontrolEnabledSelectedSelected;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIControl_VerAlignment_Alignment]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUicontrolVerAlignmentAlignment;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIControl_HorAlignment_Alignment]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUicontrolHorAlignmentAlignment;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIControl_QMUIOutsideEdge_Edge]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUicontrolQmuioutsideEdgeEdge;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIButton_ContentInsets_Insets]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUibuttonContentInsetsInsets;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIButton_TitleInsets_Insets]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUibuttonTitleInsetsInsets;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIButton_ImageInsets_Insets]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUibuttonImageInsetsInsets;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Offset_Offset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewOffsetOffset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ContentSize_Size]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewContentSizeSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ContentInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewContentInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_AdjustedInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewAdjustedInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Behavior_Behavior]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewBehaviorBehavior;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_IndicatorInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewIndicatorInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ScrollPaging_ScrollEnabled]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewScrollPagingScrollEnabled;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ScrollPaging_PagingEnabled]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewScrollPagingPagingEnabled;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Bounce_Ver]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewBounceVer;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Bounce_Hor]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewBounceHor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ShowsIndicator_Hor]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewShowsIndicatorHor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ShowsIndicator_Ver]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewShowsIndicatorVer;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ContentTouches_Delay]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewContentTouchesDelay;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_ContentTouches_CanCancel]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewContentTouchesCanCancel;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Zoom_MinScale]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewZoomMinScale;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Zoom_MaxScale]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewZoomMaxScale;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Zoom_Scale]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewZoomScale;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_Zoom_Bounce]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewZoomBounce;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIScrollView_QMUIInitialInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUiscrollViewQmuiinitialInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_Style_Style]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewStyleStyle;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_SectionsNumber_Number]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewSectionsNumberNumber;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_RowsNumber_Number]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewRowsNumberNumber;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_SeparatorInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewSeparatorInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_SeparatorColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewSeparatorColorColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITableView_SeparatorStyle_Style]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitableViewSeparatorStyleStyle;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Font_Name]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewFontName;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Font_Size]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewFontSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Basic_Editable]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewBasicEditable;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Basic_Selectable]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewBasicSelectable;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Text_Text]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewTextText;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_TextColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewTextColorColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_Alignment_Alignment]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewAlignmentAlignment;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextView_ContainerInset_Inset]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextViewContainerInsetInset;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Text_Text]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldTextText;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Placeholder_Placeholder]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldPlaceholderPlaceholder;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Font_Name]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldFontName;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Font_Size]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldFontSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_TextColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldTextColorColor;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Alignment_Alignment]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldAlignmentAlignment;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Clears_ClearsOnBeginEditing]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldClearsClearsOnBeginEditing;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_Clears_ClearsOnInsertion]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldClearsClearsOnInsertion;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_CanAdjustFont_CanAdjustFont]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldCanAdjustFontCanAdjustFont;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_CanAdjustFont_MinSize]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldCanAdjustFontMinSize;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UITextField_ClearButtonMode_Mode]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUitextFieldClearButtonModeMode;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIVisualEffectView_Style_Style]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUivisualEffectViewStyleStyle;
    } else if ([aAttrIdentifier isEqualToString:LookinAttr_UIVisualEffectView_QMUIForegroundColor_Color]) {
        attrIdentifier = PBLookinAttrIdentifier_PblookinAttrUivisualEffectViewQmuiforegroundColorColor;
    } else {
        NSLog(@"Not supoorted attrbute identifier！");
    }
    
    return attrIdentifier;
}

+ (PBLookinAttrType)attrTypeWithLookinAttribute:(LookinAttribute *)attribute
{
    PBLookinAttrType attrType = PBLookinAttrType_PblookinAttrTypeNone;
    switch (attribute.attrType) {
        case LookinAttrTypeInt:
        case LookinAttrTypeEnumInt:
        case LookinAttrTypeLong:
        case LookinAttrTypeEnumLong:
        case LookinAttrTypeUnsignedInt:
        case LookinAttrTypeUnsignedLong:
        case LookinAttrTypeFloat:
        case LookinAttrTypeDouble:
        case LookinAttrTypeBOOL:
        case PBLookinAttrType_PblookinAttrTypeCgpoint:
        case PBLookinAttrType_PblookinAttrTypeCgsize:
        case PBLookinAttrType_PblookinAttrTypeCgrect:
        case PBLookinAttrType_PblookinAttrTypeNsstring:
        case PBLookinAttrType_PblookinAttrTypeUicolor:
            attrType = (PBLookinAttrType)attribute.attrType;
            break;
        default:
            NSLog(@"Not supported lookinAttrType!");
            break;
    }
    return attrType;
}

+ (pblookinvaluetype *)attrValueWithLookinAttribute:(LookinAttribute *)attribute
{
    pblookinvaluetype *attrValue = [pblookinvaluetype new];
    switch (attribute.attrType) {
        case LookinAttrTypeInt:
        case LookinAttrTypeEnumInt:
            attrValue.intValue = [attribute.value intValue];
            break;
        case LookinAttrTypeLong:
        case LookinAttrTypeEnumLong:
            attrValue.longValue = [attribute.value longValue];
            break;
        case LookinAttrTypeUnsignedInt:
            attrValue.unsignedIntValue = [attribute.value unsignedIntValue];
            break;
        case LookinAttrTypeUnsignedLong:
            attrValue.unsignedLongValue = [attribute.value unsignedLongValue];
            break;
        case LookinAttrTypeFloat:
            attrValue.unsignedLongValue = [attribute.value unsignedLongValue];
            break;
        case LookinAttrTypeDouble:
            attrValue.unsignedLongValue = [attribute.value unsignedLongValue];
            break;
        case LookinAttrTypeBOOL:
            attrValue.unsignedLongValue = [attribute.value unsignedLongValue];
            break;
        case PBLookinAttrType_PblookinAttrTypeCgpoint:
            attrValue.pointValue = [self pointWithCGPoint:[attribute.value CGPointValue]];
            break;
        case PBLookinAttrType_PblookinAttrTypeCgsize:
            attrValue.sizeValue = [self sizeWithCGSize:[attribute.value CGSizeValue]];
            break;
        case PBLookinAttrType_PblookinAttrTypeCgrect:
            attrValue.rectValue = [self rectWithCGRect:[attribute.value CGRectValue]];
            break;
        case PBLookinAttrType_PblookinAttrTypeNsstring:
            attrValue.stringValue = attribute.value;
            break;
        case PBLookinAttrType_PblookinAttrTypeUicolor:
            attrValue.colorValue = [self colorWithUIColor:attribute.value];
            break;
        default:
            NSLog(@"Not supported lookinAttrType!");
            break;
    }
    return attrValue;
}

@end
