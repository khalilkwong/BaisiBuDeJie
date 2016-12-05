#import "UIView+frame.h"

@implementation UIView (frame)

-(void)setKzp_x:(CGFloat)x{
    
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_x{
    
    return self.frame.origin.x;
    
}

-(void)setKzp_y:(CGFloat)y{
    
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_y{
    
    return self.frame.origin.y;
    
}

-(void)setKzp_width:(CGFloat)width{
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_width{
    
    return self.frame.size.width;
    
}

-(void)setKzp_height:(CGFloat)height{
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_height{
    
    return self.frame.size.height;
    
}


-(void)setKzp_centerX:(CGFloat)centerX{
    
    CGRect frame = self.frame;
    
    frame.origin.x = centerX - frame.size.width/2.0;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_centerX{
    
    return CGRectGetMidX(self.frame);
    
}

-(void)setKzp_centerY:(CGFloat)centerY{
    
    CGRect frame = self.frame;
    
    frame.origin.y = centerY - frame.size.height/2.0;
    
    self.frame = frame;
    
}

-(CGFloat)kzp_centerY{
    
    return CGRectGetMidY(self.frame);
    
}




@end
