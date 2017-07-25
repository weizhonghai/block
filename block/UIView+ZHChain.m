//
//  UIView+ZHChain.m
//  链式编程思想
//
//  Created by 海神 on 2017/7/21.
//  Copyright © 2017年 海神. All rights reserved.
//

#import "UIView+ZHChain.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

@end


@implementation UIView (ZHChain)

- (UIView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UIView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UIView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UIView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

@end

@implementation UILabel (ZHChain)

+ (UILabel *)label{
    return [[self alloc] init];
}

- (UILabel *(^)(NSString *))ZH_text{
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIFont *))ZH_font{
    return ^(UIFont *font) {
        
        if ([font isKindOfClass:[UIFont class]]) {
            self.font = font;
        }else if ([font isKindOfClass:[NSString class]]) {
            self.font = [UIFont systemFontOfSize:[(NSString *)font floatValue]];
        }
        else if ([font isKindOfClass:[NSNumber class]]) {
            self.font = [UIFont systemFontOfSize:[(NSNumber *)font floatValue]];
        }
        return self;
    };
}

- (UILabel *(^)(UIColor *))ZH_textColor{
    return ^(UIColor *color){
        if ([color isKindOfClass:[UIColor class]]) {
            self.textColor = color;
        }else if ([color isKindOfClass:[NSString class]]) {
            self.textColor = [UIColor colorWithHexString:(NSString *)color];
        }
        return self;
    };
}

- (UILabel *(^)(UIColor *))ZH_shadowColor{
    return ^(UIColor *color) {
        if ([color isKindOfClass:[UIColor class]]) {
            self.shadowColor = color;
        }else if ([color isKindOfClass:[NSString class]]) {
            self.shadowColor = [UIColor colorWithHexString:(NSString *)color];
        }
        return self;
    };
}

- (UILabel *(^)(CGSize))ZH_shadowOffset{
    return ^(CGSize size) {
        self.shadowOffset = size;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))ZH_textAlignment{
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(NSLineBreakMode))ZH_lineBreakMode{
    return ^(NSLineBreakMode lineBreakMode) {
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_enabled{
    return ^(BOOL enabled) {
        self.enabled = enabled;
        return self;
    };
}

- (UILabel *(^)(NSInteger))ZH_numberOfLines{
    return ^(NSInteger numberOfLines) {
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (UILabel *(^)())ZH_sizeToFit{
    return ^() {
        [self sizeToFit];
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_adjustsFontSizeToFitWidth{
    return ^(BOOL adjustsFontSizeToFitWidth) {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_adjustsLetterSpacingToFitWidth{
    return ^(BOOL adjustsLetterSpacingToFitWidth) {
        self.adjustsLetterSpacingToFitWidth = adjustsLetterSpacingToFitWidth;
        return self;
    };
}
/****************************子类重写父类方法*********************************/
- (UILabel *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UILabel *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UILabel *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UILabel *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UILabel *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UILabel *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}



@end

@implementation UIButton (ZHChain)

+ (UIButton *)button{
    return [[self alloc] init];
}

- (UIButton *(^)(BOOL))ZH_adjustsImageWhenHighlighted{
    return ^(BOOL adjustsImageWhenHighlighted) {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted;
        return self;
    };
}

- (UIButton *(^)(BOOL))ZH_adjustsImageWhenDisabled{
    return ^(BOOL adjustsImageWhenDisabled) {
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled;
        return self;
    };
}

- (UIButton *(^)(BOOL))ZH_showsTouchWhenHighlighted{
    return ^(BOOL showsTouchWhenHighlighted) {
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted;
        return self;
    };
}

- (UIButton *(^)(UIColor *))ZH_tintColor{
    return ^(UIColor *tintColor) {
        if ([tintColor isKindOfClass:[UIColor class]]) {
            self.tintColor = tintColor;
        }else if ([tintColor isKindOfClass:[NSString class]]) {
            self.tintColor = [UIColor colorWithHexString:(NSString *)tintColor];
        }
        return self;
    };
}

- (UIButton *(^)(NSString *, UIControlState))ZH_setTitle_forState{
    return ^(NSString *title,UIControlState state) {
        [self setTitle:title forState:state];
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))ZH_setTitleColor_forState{
    return ^(UIColor *color, UIControlState state) {
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))ZH_setTitleShadowColor_forState{
    return ^(UIColor *color,UIControlState state) {
        [self setTitleShadowColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))ZH_setImage_forState{
    return ^(UIImage *image,UIControlState state) {
        [self setImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))ZH_setBackgroundImage_forState{
    return ^(UIImage *image,UIControlState state) {
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(UIFont *))ZH_titleLabel_font{
    return ^(UIFont *font) {
        if ([font isKindOfClass:[UIFont class]]) {
            self.titleLabel.font = font;
        }else if ([font isKindOfClass:[NSString class]]) {
            self.titleLabel.font = [UIFont systemFontOfSize:[(NSString *)font floatValue]];
        }else if ([font isKindOfClass:[NSNumber class]]) {
            self.titleLabel.font = [UIFont systemFontOfSize:[(NSNumber *)font floatValue]];
        }
        return self;
    };
}
/****************************子类重写父类方法*********************************/
- (UIButton *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UIButton *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UIButton *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UIButton *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UIButton *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIButton *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIButton *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIButton *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


@end

@implementation UIImageView (ZHChain)

+ (UIImageView *)imageView{
    return [[self alloc] init];
}

- (UIImageView *(^)(UIImage *))ZH_image{
    return ^(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (UIImageView *(^)(BOOL))ZH_highlighted{
    return ^(BOOL highlighted) {
        self.highlighted = highlighted;
        return self;
    };
}

- (UIImageView *(^)(UIImage *))ZH_highlightedImage{
    return ^(UIImage *highlightedImage) {
        self.highlightedImage = highlightedImage;
        return self;
    };
}

- (UIImageView *(^)(UIColor *))ZH_tintColor{
    return ^(UIColor *color){
        if ([color isKindOfClass:[UIColor class]]) {
            self.tintColor = color;
        }else if ([color isKindOfClass:[NSString class]]) {
            self.tintColor = [UIColor colorWithHexString:(NSString *)color];
        }
        return self;
    };
}

/**************************子类重写父类方法*******************************/
- (UIImageView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UIImageView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UIImageView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UIImageView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UIImageView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIImageView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIImageView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIImageView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


@end

@implementation UITextField (ZHChain)

+ (UITextField *)textField{
    return [[self alloc] init];
}

- (UITextField *(^)(NSString *))ZH_text{
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(UIColor *))ZH_textColor{
    return ^(UIColor *textColor) {
        if ([textColor isKindOfClass:[UIColor class]]) {
            self.textColor = textColor;
        }else if ([textColor isKindOfClass:[NSString class]]) {
            self.textColor = [UIColor colorWithHexString:(NSString *)textColor];
        }
        return self;
    };
}

- (UITextField *(^)(UIFont *))ZH_font{
    return ^(UIFont *font) {
        if ([font isKindOfClass:[UIFont class]]) {
            self.font = font;
        }else if ([font isKindOfClass:[NSString class]]) {
            self.font = [UIFont systemFontOfSize:[(NSString *)font floatValue]];
        }else if ([font isKindOfClass:[NSNumber class]]) {
            self.font = [UIFont systemFontOfSize:[(NSNumber *)font floatValue]];
        }
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))ZH_textAlignment{
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UITextField *(^)(UITextBorderStyle))ZH_borderStyle{
    return ^(UITextBorderStyle borderStyle) {
        self.borderStyle = borderStyle;
        return self;
    };
}

- (UITextField *(^)(NSString *))ZH_placeholder{
    return ^(NSString *placeholder) {
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_clearsOnBeginEditing{
    return ^(BOOL clearsOnBeginEditing) {
        self.clearsOnBeginEditing = clearsOnBeginEditing;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_adjustsFontSizeToFitWidth{
    return ^(BOOL adjustsFontSizeToFitWidth) {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

- (UITextField *(^)(CGFloat))ZH_minimumFontSize{
    return ^(CGFloat FontSize) {
        self.minimumFontSize = FontSize;
        return self;
    };
}

- (UITextField *(^)(NSObject *))ZH_delegate{
    return ^(NSObject *objc) {
        self.delegate = objc;
        return self;
    };
}

- (UITextField *(^)(UIImage *))ZH_background{
    return ^(UIImage *image) {
        self.background = image;
        return self;
    };
}

- (UITextField *(^)(UIImage *))ZH_disabledBackground{
    return ^(UIImage *disabledBackground) {
        self.disabledBackground = disabledBackground;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_allowsEditingTextAttributes{
    return ^(BOOL allowsEditingTextAttributes) {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes;
//        self.clearButtonMode
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))ZH_clearButtonMode{
    return ^(UITextFieldViewMode clearButtonMode) {
        self.clearButtonMode = clearButtonMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))ZH_leftView{
    return ^(UIView *leftView) {
        self.leftView = leftView;
//        self.leftViewMode
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))ZH_leftViewMode{
    return ^(UITextFieldViewMode leftViewMode) {
        self.leftViewMode = leftViewMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))ZH_rightView{
    return ^(UIView *rightView) {
        self.rightView = rightView;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))ZH_rightViewMode{
    return ^(UITextFieldViewMode rightViewMode) {
        self.rightViewMode = rightViewMode;
        return self;
    };
}
/**************************子类重写父类方法*******************************/
- (UITextField *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UITextField *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UITextField *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UITextField *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UITextField *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UITextField *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


@end

@implementation UITextView (ZHChain)

+ (UITextView *)textView{
    return [[self alloc] init];
}

- (UITextView *(^)(NSObject *))ZH_delegate{
    return ^(NSObject *objc) {
        self.delegate = objc;
        return self;
    };
}

- (UITextView *(^)(NSString *))ZH_text{
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UITextView *(^)(UIFont *))ZH_font{
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UITextView *(^)(UIColor *))ZH_textColor{
    return ^(UIColor *textColor) {
        if ([textColor isKindOfClass:[UIColor class]]) {
            self.textColor = textColor;
        }else if ([textColor isKindOfClass:[NSString class]]) {
            self.textColor = [UIColor colorWithHexString:(NSString *)textColor];
        }
        return self;
    };
}

- (UITextView *(^)(NSTextAlignment))ZH_textAlignment{
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UITextView *(^)(NSRange ))ZH_selectedRange{
    return ^(NSRange selectedRange) {
        self.selectedRange = selectedRange;
        return self;
    };
}

- (UITextView *(^)(BOOL))ZH_allowsEditingTextAttributes{
    return ^(BOOL allowsEditingTextAttributes) {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes;
        return self;
    };
}

/**************************子类重写父类方法*******************************/
- (UITextView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UITextView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UITextView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UITextView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UITextView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UITextView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UITextView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UITextView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


@end

@implementation UITableView (ZHChain)

+ (UITableView *(^)(UITableViewStyle))tableView{
    return ^(UITableViewStyle style){
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        return tableview;
    };
}

- (UITableView *(^)(NSObject *))ZH_dataSource{
    return ^(NSObject *objct) {
        self.dataSource = objct;
        return self;
    };
}

- (UITableView *(^)(NSObject *))ZH_delegate{
    return ^(NSObject *objct) {
        self.delegate = objct;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_rowHeight{
    return ^(CGFloat rowHeight) {
        self.rowHeight = rowHeight;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_sectionHeaderHeight{
    return ^(CGFloat sectionHeaderHeight) {
        self.sectionHeaderHeight = sectionHeaderHeight;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_sectionFooterHeight{
    return ^(CGFloat sectionFooterHeight) {
        self.sectionFooterHeight = sectionFooterHeight;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_estimatedRowHeight{
    return ^(CGFloat estimatedRowHeight) {
        self.estimatedRowHeight = estimatedRowHeight;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_estimatedSectionHeaderHeight{
    return ^(CGFloat estimatedSectionHeaderHeight) {
        self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight;
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_estimatedSectionFooterHeight{
    return ^(CGFloat estimatedSectionFooterHeight) {
        self.estimatedSectionFooterHeight = estimatedSectionFooterHeight;
        return self;
    };
}

- (UITableView *(^)(UIEdgeInsets))ZH_separatorInset{
    return ^(UIEdgeInsets separatorInset) {
        self.separatorInset = separatorInset;
        return self;
    };
}

- (UITableView *(^)(UIView *))ZH_backgroundView{
    return ^(UIView *backgroundView) {
        self.backgroundView = backgroundView;
        return self;
    };
}

- (UITableView *(^)(UITableViewCellSeparatorStyle))ZH_separatorStyle{
    return ^(UITableViewCellSeparatorStyle separatorStyle) {
        self.separatorStyle = separatorStyle;
        return self;
    };
}

- (UITableView *(^)(UIView *))ZH_tableHeaderView{
    return ^(UIView *tableHeaderView) {
        self.tableHeaderView = tableHeaderView;
        return self;
    };
}

- (UITableView *(^)(UIView *))ZH_tableFooterView{
    return ^(UIView *tableFooterView) {
        self.tableFooterView = tableFooterView;
        return self;
    };
}

/**************************子类重写父类方法*******************************/
- (UITableView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UITableView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UITableView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UITableView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UITableView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UITableView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UITableView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UITableView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}


@end

@implementation UICollectionView (ZHChain)

+ (UICollectionView *(^)(UICollectionViewLayout *))collectionView{
    return ^(UICollectionViewLayout *layout){
        
        if (layout != nil) return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        return [[UICollectionView alloc] init];
    };
}

- (UICollectionView *(^)(UICollectionViewLayout *))ZH_collectionViewLayout{
    return ^(UICollectionViewLayout *collectionViewLayout) {
        self.collectionViewLayout = collectionViewLayout;
        return self;
    };
}

- (UICollectionView *(^)(NSObject *))ZH_delegate{
    return ^(NSObject *objct) {
        self.delegate = objct;
        return self;
    };
}

- (UICollectionView *(^)(NSObject *))ZH_dataSource{
    return ^(NSObject *objct) {
        self.dataSource = objct;
        return self;
    };
}

- (UICollectionView *(^)(UIView *))ZH_backgroundView{
    return ^(UIView *backgroundView) {
        self.backgroundView = backgroundView;
        return self;
    };
}

- (UICollectionView *(^)(Class ,NSString *))ZH_registerClass_forCellWithReuseIdentifier{
    return ^(Class class, NSString *identifier) {
        [self registerClass:class forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(UINib *,NSString *))ZH_registerNib_forCellWithReuseIdentifier{
    return ^(UINib *nib,NSString *identifier) {
        [self registerNib:nib forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(Class ,NSString *,NSString *))ZH_registerClass_forSupplementaryViewOfKind_withReuseIdentifier{
    return ^(Class class,NSString *elementKind,NSString *identifier) {
        [self registerClass:class forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(UINib *,NSString *,NSString *))ZH_registerNib_forSupplementaryViewOfKind_withReuseIdentifier{
    return ^(UINib *nib, NSString *kind, NSString *identifier) {
        [self registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
        return self;
    };
}

/**************************子类重写父类方法*******************************/
- (UICollectionView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UICollectionView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UICollectionView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UICollectionView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UICollectionView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UICollectionView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UICollectionView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UICollectionView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

@end

@implementation UICollectionViewFlowLayout (ZHChain)

+ (UICollectionViewFlowLayout *)CollectionViewFlowLayout{
    return [[self alloc] init];
}

- (UICollectionViewFlowLayout *(^)(CGFloat))ZH_minimumLineSpacing{
    return ^(CGFloat minimumLineSpacin) {
        self.minimumLineSpacing = minimumLineSpacin;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat))ZH_minimumInteritemSpacing{
    return ^(CGFloat minimumInteritemSpacing) {
        self.minimumInteritemSpacing = minimumInteritemSpacing;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))ZH_itemSize{
    return ^(CGSize itemSize) {
        self.itemSize = itemSize;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))ZH_estimatedItemSize{
    return ^(CGSize estimatedItemSize) {
        self.estimatedItemSize = estimatedItemSize;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))ZH_scrollDirection{
    return ^(UICollectionViewScrollDirection scrollDirection) {
        self.scrollDirection = scrollDirection;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))ZH_headerReferenceSize{
    return ^(CGSize headerReferenceSize) {
        self.headerReferenceSize = headerReferenceSize;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))ZH_footerReferenceSize{
    return ^(CGSize footerReferenceSize) {
        self.footerReferenceSize = footerReferenceSize;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UIEdgeInsets))ZH_sectionInset{
    return ^(UIEdgeInsets sectionInset) {
        self.sectionInset = sectionInset;
        return self;
    };
}

@end

@implementation UIScrollView (ZHChain)

+ (UIScrollView *)scrollView{
    return [[self alloc] init];
}

- (UIScrollView *(^)(CGPoint))ZH_contentOffset{
    return ^(CGPoint contentOffset) {
        self.contentOffset = contentOffset;
        return self;
    };
}

- (UIScrollView *(^)(CGSize))ZH_contentSize{
    return ^(CGSize contentSize) {
        self.contentSize = contentSize;
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets))ZH_contentInset{
    return ^(UIEdgeInsets contentInset) {
        self.contentInset = contentInset;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_bounces{
    return ^(BOOL bounces) {
        self.bounces = bounces;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_pagingEnabled{
    return ^(BOOL pagingEnabled) {
        self.pagingEnabled = pagingEnabled;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_scrollEnabled{
    return ^(BOOL scrollEnabled) {
        self.scrollEnabled = scrollEnabled;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_showsHorizontalScrollIndicator{
    return ^(BOOL showsHorizontalScrollIndicator) {
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_showsVerticalScrollIndicator{
    return ^(BOOL showsVerticalScrollIndicator) {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets))ZH_scrollIndicatorInsets{
    return ^(UIEdgeInsets scrollIndicatorInsets) {
        self.scrollIndicatorInsets = scrollIndicatorInsets;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat))ZH_minimumZoomScale{
    return ^(CGFloat minimumZoomScale) {
        self.minimumZoomScale = minimumZoomScale;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat))ZH_maximumZoomScale{
    return ^(CGFloat maximumZoomScale) {
        self.maximumZoomScale = maximumZoomScale;
        return self;
    };
}

/**************************子类重写父类方法*******************************/
- (UIScrollView *(^)(CGRect))ZH_frame{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UIScrollView *(^)(CGPoint))ZH_center{
    return ^(CGPoint point) {
        self.center = point;
        return self;
    };
}

- (UIScrollView *(^)(NSString *))ZH_backgroundColor{
    return ^(NSString *string){
        if ([string isKindOfClass:[NSString class]]) {
            self.backgroundColor = [UIColor colorWithHexString:string];
        }else if ([string isKindOfClass:[UIColor class]]) {
            self.backgroundColor = (UIColor *)string;
        }
        return self;
    };
}

- (UIScrollView *(^)(UIView *))ZH_addSubview{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UIScrollView *(^)(CGFloat))ZH_alpha{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_clipsToBounds{
    return ^(BOOL clipstobounds){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_hidden{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))ZH_userInteractionEnabled{
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

@end
