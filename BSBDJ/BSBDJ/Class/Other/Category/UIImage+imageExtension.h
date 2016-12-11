

#import <UIKit/UIKit.h>

@interface UIImage (imageExtension)

/**
 *  修正图片方向
 *
 *  @return 修改后的图片
 */
- (UIImage *)fixOrientation;
/**
 *  返回指定颜色生成的图片
 *
 *  @param color 颜色
 *  @param size  尺寸
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

/**
 *  获取指定尺寸（50*50）的图片
 *
 *  @param color 图片颜色
 *  @param name  文本,居中显示
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color text:(NSString *)name;

//对图片进行模糊处理
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;

/// 由颜色生成模糊图片
+ (UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius;

/**
 *  转成黑白图像
 *
 *  @param sourceImage 原图
 *
 *  @return 黑白图像
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

/**
 *  获取图片指定位置的颜色
 *
 *  @param point 位置
 *
 *  @return 颜色
 */
- (UIColor *)colorAtPoint:(CGPoint )point;
/**
 *  旋转图片
 *
 *  @param isHorizontal 方向
 *
 *  @return 结果图片
 */
- (UIImage *)flip:(BOOL)isHorizontal;

/**
 *  图片剪切为圆形
 *
 *  @param originalImage 原始图片
 *
 *  @return 剪切后的圆形图片
 */
- (UIImage *)roundImage;


//获取一个图片的大小.
- (CGSize)sizeFromImage:(UIImage *)image;

/*
 *  直接截屏
 */
+ (UIImage *)cutScreen;

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+ (UIImage *)cutFromView:(UIView *)view;

/**
 *  从给定UIImage和指定Frame截图：
 */
- (UIImage *)cutWithFrame:(CGRect)frame;




@end
