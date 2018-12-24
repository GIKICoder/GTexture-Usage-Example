#import "ZYResponse.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface ZYResponse (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYList (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYGodReview (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYImg (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYURLValue (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYVideo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYQuality (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYURLElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYGodRid (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYMember (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYRUrls (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYAspectLow (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYEpaulet (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYPostLabel (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface ZYTopic (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation ZYFmt
+ (NSDictionary<NSString *, ZYFmt *> *)values
{
    static NSDictionary<NSString *, ZYFmt *> *values;
    return values = values ? values : @{
                                        @"gif": [[ZYFmt alloc] initWithValue:@"gif"],
                                        @"jpeg": [[ZYFmt alloc] initWithValue:@"jpeg"],
                                        };
}

+ (ZYFmt *)gif { return ZYFmt.values[@"gif"]; }
+ (ZYFmt *)jpeg { return ZYFmt.values[@"jpeg"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return ZYFmt.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

ZYResponse *_Nullable ZYResponseFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [ZYResponse fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

ZYResponse *_Nullable ZYResponseFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return ZYResponseFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable ZYResponseToData(ZYResponse *welcome, NSError **error)
{
    @try {
        id json = [welcome JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable ZYResponseToJSON(ZYResponse *welcome, NSStringEncoding encoding, NSError **error)
{
    NSData *data = ZYResponseToData(welcome, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation ZYResponse
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"ret": @"ret",
                                                    @"data": @"data",
                                                    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return ZYResponseFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return ZYResponseFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYResponse alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = [ZYData fromJSONDictionary:(id)_data];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYResponse.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"data": [_data JSONDictionary],
                                     }];
    
    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return ZYResponseToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return ZYResponseToJSON(self, encoding, error);
}
@end

@implementation ZYData
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"list": @"list",
                                                    @"tips": @"tips",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYData alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _list = map(_list, λ(id x, [ZYList fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYData.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"list": map(_list, λ(id x, [x JSONDictionary])),
                                     }];
    
    return dict;
}
@end

@implementation ZYList
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"member": @"member",
                                                    @"topic": @"topic",
                                                    @"god_reviews": @"godReviews",
                                                    @"fine_reviews": @"fineReviews",
                                                    @"post_labels": @"postLabels",
                                                    @"videos": @"videos",
                                                    @"_id": @"theID",
                                                    @"id": @"identifier",
                                                    @"mid": @"mid",
                                                    @"tid": @"tid",
                                                    @"ct": @"ct",
                                                    @"ut": @"ut",
                                                    @"reviews": @"reviews",
                                                    @"likes": @"likes",
                                                    @"up": @"up",
                                                    @"down": @"down",
                                                    @"share": @"share",
                                                    @"status": @"status",
                                                    @"type": @"type",
                                                    @"vd_stat": @"vdStat",
                                                    @"content": @"content",
                                                    @"imgs": @"imgs",
                                                    @"c_type": @"cType",
                                                    @"god_rids": @"godRids",
                                                    @"hot": @"hot",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYList alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _member = [ZYMember fromJSONDictionary:(id)_member];
        _topic = [ZYTopic fromJSONDictionary:(id)_topic];
        _godReviews = map(_godReviews, λ(id x, [ZYGodReview fromJSONDictionary:x]));
        _postLabels = map(_postLabels, λ(id x, [ZYPostLabel fromJSONDictionary:x]));
        _videos = map(_videos, λ(id x, [ZYVideo fromJSONDictionary:x]));
        _imgs = map(_imgs, λ(id x, [ZYImg fromJSONDictionary:x]));
        _godRids = map(_godRids, λ(id x, [ZYGodRid fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYList.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYList.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYList.properties) {
        id propertyName = ZYList.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"member": [_member JSONDictionary],
                                     @"topic": [_topic JSONDictionary],
                                     @"god_reviews": map(_godReviews, λ(id x, [x JSONDictionary])),
                                     @"post_labels": NSNullify(map(_postLabels, λ(id x, [x JSONDictionary]))),
                                     @"videos": NSNullify(map(_videos, λ(id x, [x JSONDictionary]))),
                                     @"imgs": map(_imgs, λ(id x, [x JSONDictionary])),
                                     @"god_rids": NSNullify(map(_godRids, λ(id x, [x JSONDictionary]))),
                                     }];
    
    return dict;
}
@end

@implementation ZYGodReview
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"avatar": @"avatar",
                                                    @"gender": @"gender",
                                                    @"mname": @"mname",
                                                    @"pos": @"pos",
                                                    @"_id": @"theID",
                                                    @"id": @"identifier",
                                                    @"pid": @"pid",
                                                    @"mid": @"mid",
                                                    @"ct": @"ct",
                                                    @"ut": @"ut",
                                                    @"godt": @"godt",
                                                    @"svut": @"svut",
                                                    @"likes": @"likes",
                                                    @"up": @"up",
                                                    @"down": @"down",
                                                    @"isgod": @"isgod",
                                                    @"godcheck": @"godcheck",
                                                    @"subreviewcnt": @"subreviewcnt",
                                                    @"status": @"status",
                                                    @"vd_stat": @"vdStat",
                                                    @"score": @"score",
                                                    @"disp": @"disp",
                                                    @"review": @"review",
                                                    @"source": @"source",
                                                    @"ip": @"ip",
                                                    @"imgs": @"imgs",
                                                    @"videos": @"videos",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYGodReview alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _imgs = map(_imgs, λ(id x, [ZYImg fromJSONDictionary:x]));
        _videos = map(_videos, λ(id x, [ZYVideo fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYGodReview.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYGodReview.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYGodReview.properties) {
        id propertyName = ZYGodReview.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"imgs": NSNullify(map(_imgs, λ(id x, [x JSONDictionary]))),
                                     @"videos": NSNullify(map(_videos, λ(id x, [x JSONDictionary]))),
                                     }];
    
    return dict;
}
@end

@implementation ZYImg
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"id": @"identifier",
                                                    @"h": @"h",
                                                    @"w": @"w",
                                                    @"video": @"video",
                                                    @"dancnt": @"dancnt",
                                                    @"mp4": @"mp4",
                                                    @"fmt": @"fmt",
                                                    @"urls": @"urls",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYImg alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _fmt = [ZYFmt withValue:(id)_fmt];
        _urls = map(_urls, λ(id x, [ZYURLValue fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYImg.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYImg.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYImg.properties) {
        id propertyName = ZYImg.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"fmt": [_fmt value],
                                     @"urls": map(_urls, λ(id x, [x JSONDictionary])),
                                     }];
    
    return dict;
}
@end

@implementation ZYURLValue
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"h": @"h",
                                                    @"w": @"w",
                                                    @"urls": @"urls",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYURLValue alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:ZYURLValue.properties.allValues];
}
@end

@implementation ZYVideo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"dur": @"dur",
                                                    @"thumb": @"thumb",
                                                    @"playcnt": @"playcnt",
                                                    @"url": @"url",
                                                    @"priority": @"priority",
                                                    @"urlsrc": @"urlsrc",
                                                    @"urlext": @"urlext",
                                                    @"urlwm": @"urlwm",
                                                    @"cover_urls": @"coverUrls",
                                                    @"qualities": @"qualities",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYVideo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _qualities = map(_qualities, λ(id x, [ZYQuality fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYVideo.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYVideo.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYVideo.properties) {
        id propertyName = ZYVideo.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"qualities": map(_qualities, λ(id x, [x JSONDictionary])),
                                     }];
    
    return dict;
}
@end

@implementation ZYQuality
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"resolution": @"resolution",
                                                    @"urls": @"urls",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYQuality alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _urls = map(_urls, λ(id x, [ZYURLElement fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYQuality.properties.allValues] mutableCopy];
    
    [dict addEntriesFromDictionary:@{
                                     @"urls": map(_urls, λ(id x, [x JSONDictionary])),
                                     }];
    
    return dict;
}
@end

@implementation ZYURLElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"url": @"url",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYURLElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:ZYURLElement.properties.allValues];
}
@end

@implementation ZYGodRid
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"ct": @"ct",
                                                    @"audited": @"audited",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYGodRid alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:ZYGodRid.properties.allValues];
}
@end

@implementation ZYMember
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"atted": @"atted",
                                                    @"id": @"identifier",
                                                    @"isreg": @"isreg",
                                                    @"ct": @"ct",
                                                    @"rt": @"rt",
                                                    @"name": @"name",
                                                    @"gender": @"gender",
                                                    @"sign": @"sign",
                                                    @"avatar": @"avatar",
                                                    @"cover": @"cover",
                                                    @"atts": @"atts",
                                                    @"fans": @"fans",
                                                    @"epaulet": @"epaulet",
                                                    @"jury_ad": @"juryAd",
                                                    @"jury_attack": @"juryAttack",
                                                    @"avatar_urls": @"avatarUrls",
                                                    @"zyid": @"zyid",
                                                    @"god_review_jury": @"godReviewJury",
                                                    @"age": @"age",
                                                    @"gender_fixed": @"genderFixed",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYMember alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _epaulet = [ZYEpaulet fromJSONDictionary:(id)_epaulet];
        _avatarUrls = [ZYRUrls fromJSONDictionary:(id)_avatarUrls];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYMember.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYMember.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYMember.properties) {
        id propertyName = ZYMember.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"epaulet": NSNullify([_epaulet JSONDictionary]),
                                     @"avatar_urls": [_avatarUrls JSONDictionary],
                                     }];
    
    return dict;
}
@end

@implementation ZYRUrls
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"aspect_low": @"aspectLow",
                                                    @"origin": @"origin",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYRUrls alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _aspectLow = [ZYAspectLow fromJSONDictionary:(id)_aspectLow];
        _origin = [ZYAspectLow fromJSONDictionary:(id)_origin];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYRUrls.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYRUrls.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYRUrls.properties) {
        id propertyName = ZYRUrls.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"aspect_low": [_aspectLow JSONDictionary],
                                     @"origin": [_origin JSONDictionary],
                                     }];
    
    return dict;
}
@end

@implementation ZYAspectLow
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"urls": @"urls",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYAspectLow alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:ZYAspectLow.properties.allValues];
}
@end

@implementation ZYEpaulet
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"type": @"type",
                                                    @"name": @"name",
                                                    @"click_url": @"clickURL",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYEpaulet alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYEpaulet.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYEpaulet.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYEpaulet.properties) {
        id propertyName = ZYEpaulet.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    return dict;
}
@end

@implementation ZYPostLabel
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"label_name": @"labelName",
                                                    @"label_id": @"labelID",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYPostLabel alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYPostLabel.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYPostLabel.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYPostLabel.properties) {
        id propertyName = ZYPostLabel.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    return dict;
}
@end

@implementation ZYTopic
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
                                                    @"id": @"identifier",
                                                    @"topic": @"topic",
                                                    @"cover": @"cover",
                                                    @"posts": @"posts",
                                                    @"atts": @"atts",
                                                    @"partners": @"partners",
                                                    @"atts_title": @"attsTitle",
                                                    @"ct": @"ct",
                                                    @"ut": @"ut",
                                                    @"skin": @"skin",
                                                    @"admins": @"admins",
                                                    @"flag": @"flag",
                                                    @"addition": @"addition",
                                                    @"share": @"share",
                                                    @"type": @"type",
                                                    @"recruiting": @"recruiting",
                                                    @"small_recruiting": @"smallRecruiting",
                                                    @"brief": @"brief",
                                                    @"partid": @"partid",
                                                    @"enable_black": @"enableBlack",
                                                    @"list_show": @"listShow",
                                                    @"click_cb": @"clickCb",
                                                    @"publish_ctypes": @"publishCtypes",
                                                    @"part_num": @"partNum",
                                                    @"searchable": @"searchable",
                                                    @"status": @"status",
                                                    @"posts_stat": @"postsStat",
                                                    @"recommend_posts_stat": @"recommendPostsStat",
                                                    @"cover_urls": @"coverUrls",
                                                    @"big_recruiting": @"bigRecruiting",
                                                    @"max_admins": @"maxAdmins",
                                                    @"guard_recruiting": @"guardRecruiting",
                                                    @"enable_guard": @"enableGuard",
                                                    @"is_active": @"isActive",
                                                    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[ZYTopic alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _coverUrls = [ZYRUrls fromJSONDictionary:(id)_coverUrls];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = ZYTopic.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:ZYTopic.properties.allValues] mutableCopy];
    
    for (id jsonName in ZYTopic.properties) {
        id propertyName = ZYTopic.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    
    [dict addEntriesFromDictionary:@{
                                     @"cover_urls": NSNullify([_coverUrls JSONDictionary]),
                                     }];
    
    return dict;
}
@end

NS_ASSUME_NONNULL_END
