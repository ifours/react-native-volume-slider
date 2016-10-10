#import <UIKit/UIKit.h>
#import "RCTComponent.h"
@import MediaPlayer;

typedef struct {
  float width;
  float height;
} RCTthumbSize;

@interface VolumeSlider : MPVolumeView

@property (nonatomic, readonly) UISlider *slider;

@property (nonatomic, copy) RCTBubblingEventBlock onValueChange;

@property (nonatomic, strong) UIImage *thumbImage;
@property (nonatomic, assign) float thumbWidth;
@property (nonatomic, assign) float thumbHeight;

@property (nonatomic, strong) UIColor *thumbTintColor;
@property (nonatomic, strong) UIColor *maximumTrackTintColor;
@property (nonatomic, strong) UIColor *minimumTrackTintColor;

-(void)setThumb;

@end
