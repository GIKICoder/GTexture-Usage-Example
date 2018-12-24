// To parse this JSON:
//
//   NSError *error;
//   ZYResponse *welcome = [ZYResponse fromJSON:json encoding:NSUTF8Encoding error:&error];
//   https://app.quicktype.io/
#import <Foundation/Foundation.h>

@class ZYResponse;
@class ZYData;
@class ZYList;
@class ZYGodReview;
@class ZYImg;
@class ZYFmt;
@class ZYURLValue;
@class ZYVideo;
@class ZYQuality;
@class ZYURLElement;
@class ZYGodRid;
@class ZYMember;
@class ZYRUrls;
@class ZYAspectLow;
@class ZYEpaulet;
@class ZYPostLabel;
@class ZYTopic;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface ZYFmt : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (ZYFmt *)gif;
+ (ZYFmt *)jpeg;
@end

#pragma mark - Object interfaces

@interface ZYResponse : NSObject
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, strong) ZYData *data;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface ZYData : NSObject
@property (nonatomic, copy) NSArray<ZYList *> *list;
@property (nonatomic, copy) NSString *tips;
@end

@interface ZYList : NSObject
@property (nonatomic, strong)           ZYMember *member;
@property (nonatomic, strong)           ZYTopic *topic;
@property (nonatomic, copy)             NSArray<ZYGodReview *> *godReviews;
@property (nonatomic, copy)             NSArray *fineReviews;
@property (nonatomic, nullable, copy)   NSArray<ZYPostLabel *> *postLabels;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, ZYVideo *> *videos;
@property (nonatomic, assign)           NSInteger theID;
@property (nonatomic, assign)           NSInteger identifier;
@property (nonatomic, assign)           NSInteger mid;
@property (nonatomic, assign)           NSInteger tid;
@property (nonatomic, assign)           NSInteger ct;
@property (nonatomic, assign)           NSInteger ut;
@property (nonatomic, assign)           NSInteger reviews;
@property (nonatomic, nullable, strong) NSNumber *likes;
@property (nonatomic, nullable, strong) NSNumber *up;
@property (nonatomic, nullable, strong) NSNumber *down;
@property (nonatomic, assign)           NSInteger share;
@property (nonatomic, assign)           NSInteger status;
@property (nonatomic, nullable, strong) NSNumber *type;
@property (nonatomic, assign)           NSInteger vdStat;
@property (nonatomic, copy)             NSString *content;
@property (nonatomic, copy)             NSArray<ZYImg *> *imgs;
@property (nonatomic, assign)           NSInteger cType;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, ZYGodRid *> *godRids;
@property (nonatomic, nullable, strong) NSNumber *hot;
@end

@interface ZYGodReview : NSObject
@property (nonatomic, assign)           NSInteger avatar;
@property (nonatomic, assign)           NSInteger gender;
@property (nonatomic, copy)             NSString *mname;
@property (nonatomic, assign)           NSInteger pos;
@property (nonatomic, assign)           NSInteger theID;
@property (nonatomic, assign)           NSInteger identifier;
@property (nonatomic, assign)           NSInteger pid;
@property (nonatomic, assign)           NSInteger mid;
@property (nonatomic, assign)           NSInteger ct;
@property (nonatomic, assign)           NSInteger ut;
@property (nonatomic, assign)           NSInteger godt;
@property (nonatomic, assign)           NSInteger svut;
@property (nonatomic, assign)           NSInteger likes;
@property (nonatomic, assign)           NSInteger up;
@property (nonatomic, assign)           NSInteger down;
@property (nonatomic, assign)           NSInteger isgod;
@property (nonatomic, assign)           NSInteger godcheck;
@property (nonatomic, assign)           NSInteger subreviewcnt;
@property (nonatomic, assign)           NSInteger status;
@property (nonatomic, nullable, strong) NSNumber *vdStat;
@property (nonatomic, assign)           double score;
@property (nonatomic, assign)           NSInteger disp;
@property (nonatomic, copy)             NSString *review;
@property (nonatomic, copy)             NSString *source;
@property (nonatomic, copy)             NSString *ip;
@property (nonatomic, nullable, copy)   NSArray<ZYImg *> *imgs;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, ZYVideo *> *videos;
@end

@interface ZYImg : NSObject
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, assign) NSInteger h;
@property (nonatomic, assign) NSInteger w;
@property (nonatomic, assign) NSInteger video;
@property (nonatomic, assign) NSInteger dancnt;
@property (nonatomic, assign) NSInteger mp4;
@property (nonatomic, assign) ZYFmt *fmt;
@property (nonatomic, copy)   NSDictionary<NSString *, ZYURLValue *> *urls;
@end

@interface ZYURLValue : NSObject
@property (nonatomic, assign) NSInteger h;
@property (nonatomic, assign) NSInteger w;
@property (nonatomic, copy)   NSArray<NSString *> *urls;
@end

@interface ZYVideo : NSObject
@property (nonatomic, assign)         NSInteger dur;
@property (nonatomic, assign)         NSInteger thumb;
@property (nonatomic, assign)         NSInteger playcnt;
@property (nonatomic, copy)           NSString *url;
@property (nonatomic, assign)         NSInteger priority;
@property (nonatomic, copy)           NSString *urlsrc;
@property (nonatomic, copy)           NSString *urlext;
@property (nonatomic, copy)           NSString *urlwm;
@property (nonatomic, nullable, copy) NSArray<NSString *> *coverUrls;
@property (nonatomic, copy)           NSArray<ZYQuality *> *qualities;
@end

@interface ZYQuality : NSObject
@property (nonatomic, assign) NSInteger resolution;
@property (nonatomic, copy)   NSArray<ZYURLElement *> *urls;
@end

@interface ZYURLElement : NSObject
@property (nonatomic, copy) NSString *url;
@end

@interface ZYGodRid : NSObject
@property (nonatomic, assign) NSInteger ct;
@property (nonatomic, assign) NSInteger audited;
@end

@interface ZYMember : NSObject
@property (nonatomic, assign)           NSInteger atted;
@property (nonatomic, assign)           NSInteger identifier;
@property (nonatomic, assign)           NSInteger isreg;
@property (nonatomic, assign)           NSInteger ct;
@property (nonatomic, assign)           NSInteger rt;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, assign)           NSInteger gender;
@property (nonatomic, nullable, copy)   NSString *sign;
@property (nonatomic, assign)           NSInteger avatar;
@property (nonatomic, nullable, strong) NSNumber *cover;
@property (nonatomic, nullable, strong) NSNumber *atts;
@property (nonatomic, assign)           NSInteger fans;
@property (nonatomic, nullable, strong) ZYEpaulet *epaulet;
@property (nonatomic, nullable, strong) NSNumber *juryAd;
@property (nonatomic, nullable, strong) NSNumber *juryAttack;
@property (nonatomic, strong)           ZYRUrls *avatarUrls;
@property (nonatomic, copy)             NSString *zyid;
@property (nonatomic, nullable, strong) NSNumber *godReviewJury;
@property (nonatomic, nullable, strong) NSNumber *age;
@property (nonatomic, nullable, strong) NSNumber *genderFixed;
@end

@interface ZYRUrls : NSObject
@property (nonatomic, strong) ZYAspectLow *aspectLow;
@property (nonatomic, strong) ZYAspectLow *origin;
@end

@interface ZYAspectLow : NSObject
@property (nonatomic, copy) NSArray<NSString *> *urls;
@end

@interface ZYEpaulet : NSObject
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *clickURL;
@end

@interface ZYPostLabel : NSObject
@property (nonatomic, copy)   NSString *labelName;
@property (nonatomic, assign) NSInteger labelID;
@end

@interface ZYTopic : NSObject
@property (nonatomic, assign)           NSInteger identifier;
@property (nonatomic, copy)             NSString *topic;
@property (nonatomic, assign)           NSInteger cover;
@property (nonatomic, assign)           NSInteger posts;
@property (nonatomic, assign)           NSInteger atts;
@property (nonatomic, assign)           NSInteger partners;
@property (nonatomic, copy)             NSString *attsTitle;
@property (nonatomic, assign)           NSInteger ct;
@property (nonatomic, assign)           NSInteger ut;
@property (nonatomic, assign)           NSInteger skin;
@property (nonatomic, copy)             NSArray<NSNumber *> *admins;
@property (nonatomic, assign)           NSInteger flag;
@property (nonatomic, copy)             NSString *addition;
@property (nonatomic, assign)           NSInteger share;
@property (nonatomic, assign)           NSInteger type;
@property (nonatomic, nullable, strong) NSNumber *recruiting;
@property (nonatomic, nullable, strong) NSNumber *smallRecruiting;
@property (nonatomic, nullable, copy)   NSString *brief;
@property (nonatomic, nullable, strong) NSNumber *partid;
@property (nonatomic, assign)           NSInteger enableBlack;
@property (nonatomic, copy)             NSString *listShow;
@property (nonatomic, copy)             NSString *clickCb;
@property (nonatomic, copy)             NSArray<NSNumber *> *publishCtypes;
@property (nonatomic, assign)           NSInteger partNum;
@property (nonatomic, assign)           NSInteger searchable;
@property (nonatomic, assign)           NSInteger status;
@property (nonatomic, assign)           NSInteger postsStat;
@property (nonatomic, assign)           NSInteger recommendPostsStat;
@property (nonatomic, nullable, strong) ZYRUrls *coverUrls;
@property (nonatomic, nullable, strong) NSNumber *bigRecruiting;
@property (nonatomic, nullable, strong) NSNumber *maxAdmins;
@property (nonatomic, nullable, strong) NSNumber *guardRecruiting;
@property (nonatomic, nullable, strong) NSNumber *enableGuard;
@property (nonatomic, nullable, strong) NSNumber *isActive;
@end

NS_ASSUME_NONNULL_END
