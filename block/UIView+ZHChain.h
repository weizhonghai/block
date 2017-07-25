//
//  UIView+ZHChain.h
//  block
//
//  Created by 海神 on 2017/7/21.
//  Copyright © 2017年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

@interface UIView (ZHChain)

- (UIView *(^)(CGRect))ZH_frame;
- (UIView *(^)(CGPoint))ZH_center;
- (UIView *(^)(NSString *))ZH_backgroundColor;
- (UIView *(^)(UIView*))ZH_addSubview;
- (UIView *(^)(CGFloat))ZH_alpha;
- (UIView *(^)(BOOL))ZH_clipsToBounds;
- (UIView *(^)(BOOL))ZH_hidden;
- (UIView *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UILabel (ZHChain)

+ (UILabel *)label;
- (UILabel *(^)(NSString *))ZH_text;
- (UILabel *(^)(UIFont *))ZH_font;
- (UILabel *(^)(UIColor *))ZH_textColor;
- (UILabel *(^)(UIColor *))ZH_shadowColor;
- (UILabel *(^)(CGSize))ZH_shadowOffset;
- (UILabel *(^)(NSTextAlignment))ZH_textAlignment;
- (UILabel *(^)(NSLineBreakMode))ZH_lineBreakMode;
- (UILabel *(^)(BOOL))ZH_enabled;
- (UILabel *(^)(NSInteger))ZH_numberOfLines;
- (UILabel *(^)())ZH_sizeToFit;
- (UILabel *(^)(BOOL))ZH_adjustsFontSizeToFitWidth;
- (UILabel *(^)(BOOL))ZH_adjustsLetterSpacingToFitWidth;
/****************************子类重写父类方法*********************************/
- (UILabel *(^)(CGRect))ZH_frame;
- (UILabel *(^)(CGPoint))ZH_center;
- (UILabel *(^)(NSString *))ZH_backgroundColor;
- (UILabel *(^)(UIView*))ZH_addSubview;
- (UILabel *(^)(CGFloat))ZH_alpha;
- (UILabel *(^)(BOOL))ZH_clipsToBounds;
- (UILabel *(^)(BOOL))ZH_hidden;
- (UILabel *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UIButton (ZHChain)

+ (UIButton *)button;
- (UIButton *(^)(BOOL))ZH_adjustsImageWhenHighlighted;
- (UIButton *(^)(BOOL))ZH_adjustsImageWhenDisabled;
- (UIButton *(^)(BOOL))ZH_showsTouchWhenHighlighted;
- (UIButton *(^)(UIColor *))ZH_tintColor;
- (UIButton *(^)(NSString *,UIControlState))ZH_setTitle_forState;
- (UIButton *(^)(UIColor *,UIControlState))ZH_setTitleColor_forState;
- (UIButton *(^)(UIColor *,UIControlState))ZH_setTitleShadowColor_forState;
- (UIButton *(^)(UIImage *,UIControlState))ZH_setImage_forState;
- (UIButton *(^)(UIImage *,UIControlState))ZH_setBackgroundImage_forState;
- (UIButton *(^)(UIFont *))ZH_titleLabel_font;
/****************************子类重写父类方法*********************************/
- (UIButton *(^)(CGRect))ZH_frame;
- (UIButton *(^)(CGPoint))ZH_center;
- (UIButton *(^)(NSString *))ZH_backgroundColor;
- (UIButton *(^)(UIView*))ZH_addSubview;
- (UIButton *(^)(CGFloat))ZH_alpha;
- (UIButton *(^)(BOOL))ZH_clipsToBounds;
- (UIButton *(^)(BOOL))ZH_hidden;
- (UIButton *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UIImageView (ZHChain)

+ (UIImageView *)imageView;
- (UIImageView *(^)(UIImage *))ZH_image;
- (UIImageView *(^)(UIImage *))ZH_highlightedImage;
- (UIImageView *(^)(BOOL))ZH_highlighted;
- (UIImageView *(^)(UIColor *))ZH_tintColor;
/****************************子类重写父类方法*********************************/
- (UIImageView *(^)(CGRect))ZH_frame;
- (UIImageView *(^)(CGPoint))ZH_center;
- (UIImageView *(^)(NSString *))ZH_backgroundColor;
- (UIImageView *(^)(UIView*))ZH_addSubview;
- (UIImageView *(^)(CGFloat))ZH_alpha;
- (UIImageView *(^)(BOOL))ZH_clipsToBounds;
- (UIImageView *(^)(BOOL))ZH_hidden;
- (UIImageView *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UITextField (ZHChain)

+ (UITextField *)textField;
- (UITextField *(^)(NSString *))ZH_text;
- (UITextField *(^)(UIColor *))ZH_textColor;
- (UITextField *(^)(UIFont *))ZH_font;
- (UITextField *(^)(NSTextAlignment))ZH_textAlignment;
- (UITextField *(^)(UITextBorderStyle))ZH_borderStyle;
- (UITextField *(^)(NSString *))ZH_placeholder;
- (UITextField *(^)(BOOL))ZH_clearsOnBeginEditing;
- (UITextField *(^)(BOOL))ZH_adjustsFontSizeToFitWidth;
- (UITextField *(^)(CGFloat))ZH_minimumFontSize;
- (UITextField *(^)(NSObject *))ZH_delegate;
- (UITextField *(^)(UIImage *))ZH_background;
- (UITextField *(^)(UIImage *))ZH_disabledBackground;
- (UITextField *(^)(BOOL))ZH_allowsEditingTextAttributes;
- (UITextField *(^)(UITextFieldViewMode))ZH_clearButtonMode;
- (UITextField *(^)(UIView *))ZH_leftView;
- (UITextField *(^)(UITextFieldViewMode))ZH_leftViewMode;
- (UITextField *(^)(UIView *))ZH_rightView;
- (UITextField *(^)(UITextFieldViewMode))ZH_rightViewMode;
/**************************子类重写父类方法*******************************/
- (UITextField *(^)(CGRect))ZH_frame;
- (UITextField *(^)(CGPoint))ZH_center;
- (UITextField *(^)(NSString *))ZH_backgroundColor;
- (UITextField *(^)(UIView*))ZH_addSubview;
- (UITextField *(^)(CGFloat))ZH_alpha;
- (UITextField *(^)(BOOL))ZH_clipsToBounds;
- (UITextField *(^)(BOOL))ZH_hidden;
- (UITextField *(^)(BOOL))ZH_userInteractionEnabled;


@end

@interface UITextView (ZHChain)

+ (UITextView *)textView;
- (UITextView *(^)(NSObject *))ZH_delegate;
- (UITextView *(^)(NSString *))ZH_text;
- (UITextView *(^)(UIFont *))ZH_font;
- (UITextView *(^)(UIColor *))ZH_textColor;
- (UITextView *(^)(NSTextAlignment))ZH_textAlignment;
- (UITextView *(^)(NSRange))ZH_selectedRange;
- (UITextView *(^)(BOOL))ZH_allowsEditingTextAttributes;
/**************************子类重写父类方法*******************************/
- (UITextView *(^)(CGRect))ZH_frame;
- (UITextView *(^)(CGPoint))ZH_center;
- (UITextView *(^)(NSString *))ZH_backgroundColor;
- (UITextView *(^)(UIView*))ZH_addSubview;
- (UITextView *(^)(CGFloat))ZH_alpha;
- (UITextView *(^)(BOOL))ZH_clipsToBounds;
- (UITextView *(^)(BOOL))ZH_hidden;
- (UITextView *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UITableView (ZHChain)

+ (UITableView *(^)(UITableViewStyle))tableView;
- (UITableView *(^)(NSObject *))ZH_dataSource;
- (UITableView *(^)(NSObject *))ZH_delegate;
- (UITableView *(^)(CGFloat))ZH_rowHeight;
- (UITableView *(^)(CGFloat))ZH_sectionHeaderHeight;
- (UITableView *(^)(CGFloat))ZH_sectionFooterHeight;
- (UITableView *(^)(CGFloat))ZH_estimatedRowHeight;
- (UITableView *(^)(CGFloat))ZH_estimatedSectionHeaderHeight;
- (UITableView *(^)(CGFloat))ZH_estimatedSectionFooterHeight;
- (UITableView *(^)(UIEdgeInsets))ZH_separatorInset;
- (UITableView *(^)(UIView *))ZH_backgroundView;
- (UITableView *(^)(UITableViewCellSeparatorStyle))ZH_separatorStyle;
- (UITableView *(^)(UIView *))ZH_tableHeaderView;
- (UITableView *(^)(UIView *))ZH_tableFooterView;
/**************************子类重写父类方法*******************************/
- (UITableView *(^)(CGRect))ZH_frame;
- (UITableView *(^)(CGPoint))ZH_center;
- (UITableView *(^)(NSString *))ZH_backgroundColor;
- (UITableView *(^)(UIView*))ZH_addSubview;
- (UITableView *(^)(CGFloat))ZH_alpha;
- (UITableView *(^)(BOOL))ZH_clipsToBounds;
- (UITableView *(^)(BOOL))ZH_hidden;
- (UITableView *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UICollectionView (ZHChain)

+ (UICollectionView *(^)(UICollectionViewLayout *))collectionView;
- (UICollectionView *(^)(UICollectionViewLayout *))ZH_collectionViewLayout;
- (UICollectionView *(^)(NSObject *))ZH_delegate;
- (UICollectionView *(^)(NSObject *))ZH_dataSource;
- (UICollectionView *(^)(UIView *))ZH_backgroundView;
- (UICollectionView *(^)(Class ,NSString *))ZH_registerClass_forCellWithReuseIdentifier;
- (UICollectionView *(^)(UINib *,NSString *))ZH_registerNib_forCellWithReuseIdentifier;
- (UICollectionView *(^)(Class ,NSString *,NSString *))ZH_registerClass_forSupplementaryViewOfKind_withReuseIdentifier;
- (UICollectionView *(^)(UINib *,NSString *,NSString *))ZH_registerNib_forSupplementaryViewOfKind_withReuseIdentifier;
/**************************子类重写父类方法*******************************/
- (UICollectionView *(^)(CGRect))ZH_frame;
- (UICollectionView *(^)(CGPoint))ZH_center;
- (UICollectionView *(^)(NSString *))ZH_backgroundColor;
- (UICollectionView *(^)(UIView*))ZH_addSubview;
- (UICollectionView *(^)(CGFloat))ZH_alpha;
- (UICollectionView *(^)(BOOL))ZH_clipsToBounds;
- (UICollectionView *(^)(BOOL))ZH_hidden;
- (UICollectionView *(^)(BOOL))ZH_userInteractionEnabled;

@end

@interface UICollectionViewFlowLayout (ZHChain)

+ (UICollectionViewFlowLayout *)CollectionViewFlowLayout;
- (UICollectionViewFlowLayout *(^)(CGFloat))ZH_minimumLineSpacing;
- (UICollectionViewFlowLayout *(^)(CGFloat))ZH_minimumInteritemSpacing;
- (UICollectionViewFlowLayout *(^)(CGSize))ZH_itemSize;
- (UICollectionViewFlowLayout *(^)(CGSize))ZH_estimatedItemSize;
- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))ZH_scrollDirection;
- (UICollectionViewFlowLayout *(^)(CGSize))ZH_headerReferenceSize;
- (UICollectionViewFlowLayout *(^)(CGSize))ZH_footerReferenceSize;
- (UICollectionViewFlowLayout *(^)(UIEdgeInsets))ZH_sectionInset;


@end

@interface UIScrollView (ZHChain)

+ (UIScrollView *)scrollView;
- (UIScrollView *(^)(CGPoint))ZH_contentOffset;
- (UIScrollView *(^)(CGSize))ZH_contentSize;
- (UIScrollView *(^)(UIEdgeInsets))ZH_contentInset;
- (UIScrollView *(^)(BOOL))ZH_bounces;
- (UIScrollView *(^)(BOOL))ZH_pagingEnabled;
- (UIScrollView *(^)(BOOL))ZH_scrollEnabled;
- (UIScrollView *(^)(BOOL))ZH_showsHorizontalScrollIndicator;
- (UIScrollView *(^)(BOOL))ZH_showsVerticalScrollIndicator;
- (UIScrollView *(^)(UIEdgeInsets))ZH_scrollIndicatorInsets;
- (UIScrollView *(^)(CGFloat))ZH_minimumZoomScale;
- (UIScrollView *(^)(CGFloat))ZH_maximumZoomScale;
/**************************子类重写父类方法*******************************/
- (UIScrollView *(^)(CGRect))ZH_frame;
- (UIScrollView *(^)(CGPoint))ZH_center;
- (UIScrollView *(^)(NSString *))ZH_backgroundColor;
- (UIScrollView *(^)(UIView*))ZH_addSubview;
- (UIScrollView *(^)(CGFloat))ZH_alpha;
- (UIScrollView *(^)(BOOL))ZH_clipsToBounds;
- (UIScrollView *(^)(BOOL))ZH_hidden;
- (UIScrollView *(^)(BOOL))ZH_userInteractionEnabled;

@end


