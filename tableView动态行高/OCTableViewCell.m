//
//  OCTableViewCell.m
//  tableView动态行高
//
//  Created by 戴维保 on 2017/4/19.
//  Copyright © 2017年 daiweibao. All rights reserved.
//

#import "OCTableViewCell.h"
//自动布局
#import "Masonry.h"

@interface OCTableViewCell()


@property (weak, nonatomic)  UILabel *labeltitle;//标题
@property (weak, nonatomic)  UIImageView *pictureView;//大图
@property (weak, nonatomic)UILabel *labelContont;//内容

@end

@implementation OCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
      
        
    }
    return self;
}

//赋值
-(void)setStringTitle:(NSString *)stringTitle{
    _stringTitle = stringTitle;
    
    _labeltitle.text = stringTitle;
    _labelContont.text = stringTitle;
}

- (void)setupUI{
 
    //标题 【重点】必须在创建第一块控件的时候约束：contentView
    UILabel * labeltitle = [[UILabel alloc]init];
    labeltitle.backgroundColor = [UIColor whiteColor];
    self.labeltitle = labeltitle;
    labeltitle.text = @"标题";
    labeltitle.textAlignment = NSTextAlignmentLeft;
    labeltitle.numberOfLines = 0;
    [self.contentView addSubview:labeltitle];

    
    //大图
    UIImageView *pictureView = [[UIImageView alloc]init];
    self.pictureView = pictureView;
    pictureView.image = [UIImage imageNamed:@"IMG_0434.JPG"];
    pictureView.contentMode = UIViewContentModeScaleAspectFill;
    pictureView.clipsToBounds = YES;
    [self.contentView addSubview:pictureView];
    
    
    //内容
    UILabel * labelContont = [[UILabel alloc]init];
    labelContont.backgroundColor = [UIColor whiteColor];
    self.labelContont = labelContont;
    labelContont.text = @"内容";
    labelContont.textAlignment = NSTextAlignmentLeft;
    labelContont.numberOfLines = 0;
    labelContont.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actionbutton)];
    [labelContont addGestureRecognizer:tap];
    [self.contentView addSubview:labelContont];
    
    
    //标题约束
    [labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.left.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.contentView).with.offset(-10);
    }];
    
    //图片约束
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labeltitle.mas_bottom).with.offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(200);
        
    }];
    
    //设置内容约束  //内容 【重点】必须在创建最后一块控件的时候约束：contentView
    [labelContont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pictureView.mas_bottom).with.offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.equalTo(self.contentView).with.offset(-10);
        
    }];
    
    
}

-(void)Actionbutton{
    
    NSLog(@"点击了内容");
    
}

@end
