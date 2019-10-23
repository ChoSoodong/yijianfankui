




//意见反馈

#import "SDMineFeedbackController.h"

@interface SDMineFeedbackController ()

/** 输入背景 */
@property (nonatomic, strong) UIView *inputBackView;
/** 输入 */
@property (nonatomic, strong) UITextView *textView;

/** 输入背景 */
@property (nonatomic, strong) UIView *phoneBackView;
/** 输入 */
@property (nonatomic, strong) UITextField *phoneTF;

/** 提示 */
@property (nonatomic, strong) UILabel *tipsLabel;
/** 提交 */
@property (nonatomic, strong) UIButton *confirmBtn;

@end

@implementation SDMineFeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //意见反馈
    
    [self setupUI];
}

-(void)setupUI{
    
    WeakSelf;
    
    _inputBackView = [UIView viewWithBackgroundColor:KRGB_245];
    _inputBackView.layer.cornerRadius = 5;
    _inputBackView.layer.masksToBounds = YES;
    [self.view addSubview:_inputBackView];
    [_inputBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(MARGIN);
        make.top.offset(KScaleW(20)+NAVIGATION_HEIGHT);
        make.right.offset(-MARGIN);
        make.height.offset(KScaleW(250));
    }];
    
    _textView = [UITextView textViewWithBackgroundColor:clear_color TextColor:KRGB_51 text:nil placeholderColor:KRGB_153 placeholder:@"请详细描述您的意见与建议" font:AdjustFont(16) maxLength:200 editable:YES];
    [_inputBackView addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KScaleW(14));
        make.top.offset(KScaleW(12));
        make.right.offset(-KScaleW(14));
        make.bottom.offset(-KScaleW(12));
    }];
    
    
    _phoneBackView = [UIView viewWithBackgroundColor:KRGB_245];
    _phoneBackView.layer.cornerRadius = 5;
    _phoneBackView.layer.masksToBounds = YES;
    [self.view addSubview:_phoneBackView];
    [_phoneBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(MARGIN);
        make.top.equalTo(weakSelf.inputBackView.mas_bottom).offset(KScaleW(10));
        make.right.offset(-MARGIN);
        make.height.offset(KScaleW(50));
    }];
    
    _phoneTF = [UITextField textFieldWithTextColor:KRGB_51 font:AdjustFont(16) secureTextEntry:NO placeholder:@"联系方式 手机/邮箱（选填）" placeholderColor:KRGB_153 keyboardType:UIKeyboardTypeNumberPad clearButtonImageName:@"cancel_btn" leftImageName:nil];
    [_phoneBackView addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.offset(-KScaleW(14));
        make.bottom.offset(0);
    }];
    
    _confirmBtn = [UIButton buttonWithHighlightedTitle:@"提交" highlightColor:white_color highlightImageName:nil highlightBackgroundImageName:@"login_btn_blue_bg" normalTitle:@"提交" normalColor:white_color normalImageName:nil normalBackgroundImageName:@"login_btn_blue_bg" font:AdjustFont(16)];
    [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmBtn];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(KScaleW(343));
        make.height.offset(KScaleW(44));
        make.bottom.offset(-KScaleW(26)-SAFE_AREA_BOTTOM);
        make.centerX.offset(0);
    }];
    
    _tipsLabel = [UILabel labelWithTextColor:KRGB_153 andTextFontSize:AdjustFont(13) andNumblerOfLines:1 andText:@"感谢您的宝贵意见！"];
    [self.view addSubview:_tipsLabel];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.confirmBtn.mas_top).offset(-KScaleW(10));
        make.centerX.offset(0);
    }];
}

-(void)confirmBtnClick:(UIButton *)sender{
    NSLog(@"提交");
    
    if (IsEmptyString(_textView.text)) {
        [EasyHUD showInfoText:@"请输入一些意见或建议吧"];
    }else if(IsEmptyString(_phoneTF.text)){
        [EasyHUD showInfoText:@"请留下一个联系方式吧"];
    }else{
        
        if ([_phoneTF.text isMobileNumber] || [_phoneTF.text isEmailAddress]) {
            
            //请求数据
            [self loadFeedbackData];
           
        }else{
            
            [EasyHUD showInfoText:@"请输入正确的手机号或邮箱"];
           
        }
        
    }
    
}


/**
 意见反馈请求
 */
-(void)loadFeedbackData{
   
    
}


@end
