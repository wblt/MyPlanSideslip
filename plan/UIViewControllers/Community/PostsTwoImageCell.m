//
//  PostsTwoImageCell.m
//  plan
//
//  Created by Fengzy on 15/12/20.
//  Copyright © 2015年 Fengzy. All rights reserved.
//

#import "PostsTwoImageCell.h"

@implementation PostsTwoImageCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (PostsTwoImageCell *)cellView {
    PostsTwoImageCell *cellView = [[NSBundle mainBundle] loadNibNamed:@"PostsTwoImageCell" owner:self options:nil].lastObject;
    
    cellView.imgViewAvatar.layer.cornerRadius = cellView.imgViewAvatar.frame.size.width / 2;
    cellView.imgViewAvatar.clipsToBounds = YES;
    cellView.imgViewAvatar.contentMode = UIViewContentModeScaleAspectFit;
    cellView.labelIsTop.hidden = YES;
    cellView.labelIsHighlight.hidden = YES;
    
    __weak typeof(PostsTwoImageCell) *weakSelf = cellView;
    [cellView getThreeSubViewForLeftBlock: ^{
        if (weakSelf.postsCellViewBlock) {
            weakSelf.postsCellViewBlock();
        }
    } centerBlock:^{
        if (weakSelf.postsCellCommentBlock) {
            weakSelf.postsCellCommentBlock();
        }
    } rightBlock: ^{
        if (weakSelf.postsCellLikeBlock) {
            weakSelf.postsCellLikeBlock();
        }
    }];
    
    [cellView.subViewButton autoLayout];
    
    return cellView;
}

- (void)getThreeSubViewForLeftBlock:(ButtonSelectBlock)leftBlock centerBlock:(ButtonSelectBlock)centerBlock rightBlock:(ButtonSelectBlock)rightBlock {

    [self.subViewButton setLeftButtonSelectBlock:leftBlock centerButtonSelectBlock:centerBlock rightButtonSelectBlock:rightBlock];
    
    self.subViewButton.backgroundColor = [UIColor clearColor];
    CGFloat btnWidth = self.bounds.size.width / 3;
    
    self.subViewButton.fixLeftWidth = btnWidth;
    self.subViewButton.fixCenterWidth = btnWidth;
    self.subViewButton.fixRightWidth = btnWidth;

    [self.subViewButton.leftButton setImage:[UIImage imageNamed:png_Icon_Posts_Eyes] forState:UIControlStateNormal];
    [self.subViewButton.leftButton setImage:[UIImage imageNamed:png_Icon_Posts_Eyes] forState:UIControlStateSelected];
    [self.subViewButton.leftButton setAllTitle:@"238"];
    
    [self.subViewButton.centerButton setImage:[UIImage imageNamed:png_Icon_Posts_Comment] forState:UIControlStateNormal];
    [self.subViewButton.centerButton setImage:[UIImage imageNamed:png_Icon_Posts_Comment] forState:UIControlStateSelected];
    [self.subViewButton.centerButton setAllTitle:@"6"];
    
    [self.subViewButton.rightButton setImage:[UIImage imageNamed:png_Icon_Posts_Praise_Normal] forState:UIControlStateNormal];
    [self.subViewButton.rightButton setImage:[UIImage imageNamed:png_Icon_Posts_Praise_Selected] forState:UIControlStateSelected];
    [self.subViewButton.rightButton setAllTitle:@"12"];
    
    self.subViewButton.leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.subViewButton.centerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.subViewButton.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.subViewButton.leftButton.titleLabel.font = font_Normal_13;
    self.subViewButton.centerButton.titleLabel.font = font_Normal_14;
    self.subViewButton.rightButton.titleLabel.font = font_Normal_14;
    self.subViewButton.leftButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.subViewButton.leftButton setAllTitleColor:color_8f8f8f];
    [self.subViewButton.centerButton setAllTitleColor:color_8f8f8f];
    [self.subViewButton.rightButton setAllTitleColor:color_8f8f8f];
}

- (CGSize)cellSize {
    static CGSize cellSize = {0, 0};
    if (CGSizeEqualToSize(cellSize, CGSizeZero)) {
        cellSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    }
    return cellSize;
}

@end