//
//  PayConfig.h
//  alipaydemo
//
//  Created by Zeug on 14/6/18.
//  Copyright (c) 2014年 Northfaith. All rights reserved.
//

#ifndef alipaydemo_PayConfig_h
#define alipaydemo_PayConfig_h

//合作身份者id，以2088开头的16位纯数字
#define PartnerID @"2088411812546712"
//收款支付宝账号
#define SellerID @"cde_home@126.com"

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @"ky9xi1p7k0mk7n2jte8u21egiuuhq5gu"

//商户私钥，自助生成
#define PartnerPrivKey                                                         \
  @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALAUoJ/"                   \
  @"SnYjFJ5eaMbbKDktvVq+Kcuh5bVHWv81K89PhTmGuJwpk+16XP9CclWscjE+/"             \
  @"66bt18cX+9IWJ4U0PtMAYOQ4Xz4MLvRGi+VimV2+"                                  \
  @"GDNMT5ZF7Kot47oxEZcxx4AnGqJj0eud04D3V8v3a3VCGAwrZBWXZFa0NcrspHQBAgMBAAEC"  \
  @"gYB2cSmq2E3HlncPb1VJk5kR/"                                                 \
  @"Q7efc7VufhjOIVEXsqtF71Vz4PLZioActUmSm3n4wgvDPZDD3I6JlPp+"                  \
  @"aUT4RTwVBJyNaiXb97jFLL2ugR10iCDLMTSQneB9XbSq1OvqIQ2BeWJqqdv4Cb8ackAvLFI0"  \
  @"toL0om9OUICARZfCnEVwQJBAODc62/wYt1wx7ahMmnDmbn4Xs+rnzlKrE/"                \
  @"iqpZRbBVBZX2ZPBEH8r3hldqpmfsV9+"                                           \
  @"PvV8fQmbWhL8QeGM2VWYUCQQDIdnCMQVhtZkixs8RvHmDop6OJiEJcIh3woPbgg9ml94ltEV"  \
  @"k4snNKbjXPXkBydjWvKbYO2mbL3Mb8llYQAZtNAkEAhurGsMFQ8ICss52AfAkKgZTOflgBDw"  \
  @"UI4l2j8NElwpMcbAG3EpjsQpXJrgs5Angp5i9DQfadY2c1G7zbMO69aQJASNOGhd3Dg1MSe8"  \
  @"SES54stLkaV3+yJAic+etwZRZhfsMUIRSZZlimO9cYI3LpVOwPCsjLhE/"                 \
  @"h4pQdkmwHbh83TQJAQlqHyFekJ5AFExTwmZ1ydYiEX8l4nujcl71MElEC+"                \
  @"H7zbqwtVnjnaEvZSiOD2LhWtcAuZA80WTTZKY2bSF086A=="

//支付宝公钥
#define AlipayPubKey                                                           \
  @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/"                     \
  @"y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/"   \
  @"PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/"           \
  @"B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"
#endif
