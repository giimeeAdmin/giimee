/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/9/26 0:32:22                            */
/*==============================================================*/


drop table if exists imeetlink_activity;

drop table if exists imeetlink_activity_message;

drop table if exists imeetlink_activity_refund;

drop table if exists imeetlink_activity_sponsorship;

drop table if exists imeetlink_activity_user;

drop table if exists imeetlink_admin;

drop table if exists imeetlink_circle;

drop table if exists imeetlink_circle_answer;

drop table if exists imeetlink_circle_chat;

drop table if exists imeetlink_circle_message;

drop table if exists imeetlink_circle_question;

drop table if exists imeetlink_circle_type;

drop table if exists imeetlink_circle_user;

drop table if exists imeetlink_config;

drop table if exists imeetlink_photo;

drop table if exists imeetlink_sequence;

drop table if exists imeetlink_token;

drop table if exists imeetlink_user;

drop table if exists imeetlink_user_append;

drop table if exists imeetlink_user_attention;

drop table if exists imeetlink_user_book;

drop table if exists imeetlink_user_chat;

drop table if exists imeetlink_user_custom;

drop table if exists imeetlink_user_feedback;

drop table if exists imeetlink_user_freetime;

drop table if exists imeetlink_user_gift;

drop table if exists imeetlink_user_message;

drop table if exists imeetlink_user_report;

drop table if exists imeetlink_user_website;

/*==============================================================*/
/* Table: imeetlink_activity                                    */
/*==============================================================*/
create table imeetlink_activity
(
   activity_id          varchar(50) not null comment '活动ID',
   user_id              varchar(50) comment '活动发起人',
   user_name            varchar(100) comment '活动发起人名称',
   theme                varchar(200) comment '活动主题',
   content              varchar(1200) comment '活动内容',
   activity_details     varchar(1000) comment '活动详细',
   begin_activity_time  datetime comment '活动时间',
   end_activity_time    datetime comment '活动时间止',
   country              varchar(100) comment '国家',
   city                 varchar(200) comment '城市',
   street               varchar(200) comment '街道',
   activity_more        varchar(2000) comment '活动更多',
   activy_require       varchar(400) comment '活动要求',
   payment_account      varchar(1000) comment '付款账户',
   fee                  decimal(18,2) comment '费用',
   refund_conditions    varchar(600) comment '退款条件',
   person_limit         int comment '人数限制',
   type                 varchar(50) comment '活动类型',
   classification       varchar(50) comment '活动分类',
   need_male            int comment '需要邀请男',
   need_women           int comment '需要邀请女',
   is_close_apply       varchar(20) comment '是否关闭报名',
   is_cancel            varchar(20) comment '是否取消活动',
   create_time          datetime comment '创建时间',
   primary key (activity_id)
);

alter table imeetlink_activity comment '活动';

/*==============================================================*/
/* Table: imeetlink_activity_message                            */
/*==============================================================*/
create table imeetlink_activity_message
(
   activy_message_id    varchar(50) not null comment '主键id',
   activy_id            varchar(50) comment '活动id',
   activy_name          varchar(200) comment '活动主题',
   type                 varchar(50) comment '消息类型   匿名邀请/实名邀请/修改活动/参加活动/取消活动',
   initiate_user_id     varchar(50) comment '发起人',
   initiate_user_name   varchar(100) comment '发起人名称',
   accept_user_id       varchar(50) comment '接受人',
   accept_user_name     varchar(100) comment '接收人名称',
   activy_type          varchar(50) comment '活动类型',
   create_time          datetime comment '创建时间',
   primary key (activy_message_id)
);

alter table imeetlink_activity_message comment '活动-活动消息';

/*==============================================================*/
/* Table: imeetlink_activity_refund                             */
/*==============================================================*/
create table imeetlink_activity_refund
(
   activy_refund_id     varchar(50) not null comment '主键id',
   apply_user_id        varchar(50) comment '申请人id',
   apply_user_name      varchar(100) comment '申请人名称',
   accept_user_id       varchar(50) comment '接受人id',
   accept_user_name     varchar(100) comment '接收人名称',
   status               varchar(50) comment '状态  创建/拒绝/已退款',
   activy_id            varchar(50) comment '活动id',
   activy_name          varchar(200) comment '活动名称',
   type                 varchar(50) comment '退款类型  微信/其他',
   refund_account       varchar(50) comment '退款账号',
   refund_reason        varchar(50) comment '退款原因',
   create_time          datetime comment '申请创建时间',
   primary key (activy_refund_id)
);

alter table imeetlink_activity_refund comment '活動退款';

/*==============================================================*/
/* Table: imeetlink_activity_sponsorship                        */
/*==============================================================*/
create table imeetlink_activity_sponsorship
(
   activity_sponsorship_id varchar(50) not null comment '主键id',
   activy_id            varchar(50) comment '活动id',
   activy_name          varchar(200) comment '活动名称',
   user_id              varchar(50) comment '赞助商id',
   user_name            varchar(100) comment '赞助商名称',
   content              varchar(500) comment '赞助内容',
   create_time          datetime comment '创建时间',
   primary key (activity_sponsorship_id)
);

alter table imeetlink_activity_sponsorship comment '活动-商家赞助';

/*==============================================================*/
/* Table: imeetlink_activity_user                               */
/*==============================================================*/
create table imeetlink_activity_user
(
   activity_user_id     varchar(50) not null comment '主键id',
   activity_id          varchar(50) comment '活动id',
   activity_name        varchar(200) comment '活动名称',
   participant_id       varchar(50) comment '参与人id',
   participant_name     varchar(100) comment '参与人名称',
   if_quit              varchar(10) comment '是否退出',
   if_pay               varchar(10) comment '是否付款',
   create_time          datetime comment '参与时间',
   primary key (activity_user_id)
);

alter table imeetlink_activity_user comment '活动-参与用户';

/*==============================================================*/
/* Table: imeetlink_admin                                       */
/*==============================================================*/
create table imeetlink_admin
(
   admin_id             varchar(50) not null comment '管理员id',
   admin_name           varchar(50) comment '管理员名称',
   admin_pwd            varchar(50) comment '管理员密码',
   create_time          datetime comment '创建时间',
   primary key (admin_id)
);

alter table imeetlink_admin comment '系统管理员';

/*==============================================================*/
/* Table: imeetlink_circle                                      */
/*==============================================================*/
create table imeetlink_circle
(
   circle_id            varchar(50) not null comment '圈子id',
   circle_short_id      varchar(50) comment '圈子短id',
   parent_type_id       varchar(50) comment '圈子父类型',
   child_type_id        char comment '圈子子类型',
   circle_qr_code       varchar(200) comment '圈子二维码',
   circle_name          varchar(200) comment '圈子名称',
   circle_name_hk       varchar(200) comment '圈子名称繁体',
   circle_name_en       varchar(200) comment '圈子名称英文',
   satus                varchar(50) comment '圈子状态',
   belong               varchar(50) comment '圈子所属',
   introduce            varchar(1200) comment '圈子介绍',
   rule                 varchar(50) comment '圈子规则',
   create_time          datetime comment '创建时间',
   primary key (circle_id)
);

alter table imeetlink_circle comment '圈子';

/*==============================================================*/
/* Table: imeetlink_circle_answer                               */
/*==============================================================*/
create table imeetlink_circle_answer
(
   circle_answer_id     varchar(50) not null comment '主键id',
   circle_id            varchar(50) comment '圈子id',
   user_id              varchar(50) comment '用户id',
   user_name            varchar(100) comment '用户名称',
   question_id          varchar(50) comment '问题id',
   answer               varchar(200) comment '回答',
   primary key (circle_answer_id)
);

alter table imeetlink_circle_answer comment '圈子-问题回答';

/*==============================================================*/
/* Table: imeetlink_circle_chat                                 */
/*==============================================================*/
create table imeetlink_circle_chat
(
   circle_chat_id       varchar(50) not null comment 'PK',
   circle_id            varchar(50) comment '圈子标识',
   type                 varchar(20) comment '消息类型',
   initiate_user_id     varchar(50) comment '发起人',
   initiate_user_name   varchar(100) comment '发起人名称',
   content              varchar(1600) comment '发起内容',
   create_time          datetime comment '创建时间',
   primary key (circle_chat_id)
);

alter table imeetlink_circle_chat comment '圈子-聊天信息';

/*==============================================================*/
/* Table: imeetlink_circle_message                              */
/*==============================================================*/
create table imeetlink_circle_message
(
   circle_message_id    varchar(50) not null comment '主键id',
   circle_id            varchar(50) comment '圈子id',
   circle_name          varchar(200) comment '圈子名稱',
   type                 varchar(20) comment '類型',
   initiate_user_id     varchar(50) comment '發起人id',
   initiate_user_name   varchar(100) comment '发起人名称',
   content              varchar(1600) comment '消息内容',
   create_time          datetime comment '创建时间',
   primary key (circle_message_id)
);

alter table imeetlink_circle_message comment '圈子-消息提醒';

/*==============================================================*/
/* Table: imeetlink_circle_question                             */
/*==============================================================*/
create table imeetlink_circle_question
(
   circle_question_id   varchar(50) not null comment '主键id',
   circle_id            varchar(50) comment '圈子id',
   question             varchar(2000) comment '问题',
   sort                 varchar(5) comment '排序',
   primary key (circle_question_id)
);

alter table imeetlink_circle_question comment '圈子-校验问题';

/*==============================================================*/
/* Table: imeetlink_circle_type                                 */
/*==============================================================*/
create table imeetlink_circle_type
(
   circle_type_id       varchar(50) not null comment '主鍵id',
   name                 varchar(50) comment '分类名称',
   parent_id            varchar(50) comment '父类型',
   sort                 varchar(10) comment '排序',
   primary key (circle_type_id)
);

alter table imeetlink_circle_type comment '圈子类型';

/*==============================================================*/
/* Table: imeetlink_circle_user                                 */
/*==============================================================*/
create table imeetlink_circle_user
(
   circle_user_id       varchar(50) not null comment '主鍵id',
   circle_id            varchar(50) comment '圈子id',
   user_id              varchar(50) comment '用戶id',
   user_name            varchar(100) comment '用户名称',
   type                 varchar(50) comment '用户类型  普通用户/管理员/圈主',
   if_disturb           varchar(20) comment '是否免打扰',
   create_time          datetime comment '创建时间',
   primary key (circle_user_id)
);

alter table imeetlink_circle_user comment '圈子-用戶';

/*==============================================================*/
/* Table: imeetlink_config                                      */
/*==============================================================*/
create table imeetlink_config
(
   config_id            varchar(50) not null comment '配置ID',
   config_type          varchar(50) comment '配置类型',
   config_name          varchar(50) comment '配置名称',
   config_key           varchar(50) comment '配置key',
   config_value         varchar(100) comment '配置value',
   primary key (config_id)
);

alter table imeetlink_config comment '系統配置文件';

/*==============================================================*/
/* Table: imeetlink_photo                                       */
/*==============================================================*/
create table imeetlink_photo
(
   photo_id             varchar(50) not null comment '图片id',
   source_id            varchar(50) comment '来源id',
   photo_type           varchar(20) comment '照片类型',
   sort                 int comment '序号',
   photo_url            varchar(200) comment '照片网址',
   create_time          datetime,
   primary key (photo_id)
);

alter table imeetlink_photo comment '系统-照片';

/*==============================================================*/
/* Table: imeetlink_sequence                                    */
/*==============================================================*/
create table imeetlink_sequence
(
   name                 varchar(30) comment '名称',
   current_value        int comment '当前编码',
   increment            int comment '自增值'
);

alter table imeetlink_sequence comment '编码表';

/*==============================================================*/
/* Table: imeetlink_token                                       */
/*==============================================================*/
create table imeetlink_token
(
   token                varchar(50) not null comment 'token',
   openid               varchar(50) comment 'openid',
   session_key          varchar(50) comment 'session_key',
   create_time          datetime comment '创建时间',
   user_id              varchar(50) comment '用户id',
   primary key (token)
);

alter table imeetlink_token comment '登录认证';

/*==============================================================*/
/* Table: imeetlink_user                                        */
/*==============================================================*/
create table imeetlink_user
(
   user_id              varchar(50) not null comment '用户id',
   member_id            varchar(20) comment '会员ID',
   qr_code              varchar(200) comment '会员二维码',
   user_name            varchar(100) comment '用户名称',
   password             varchar(50) comment '密码',
   user_type            varchar(10) comment '用户类型',
   email                varchar(100) comment '电邮',
   show_email           varchar(100) comment '展示邮箱',
   gender               varchar(10) comment '性别',
   marital_status       varchar(10) comment '婚姻状态',
   age                  int comment '年龄',
   height               int comment '身高',
   inches               varchar(10) comment '身高(寸)',
   country              varchar(100) comment '国家',
   state                varchar(100) comment '州/省',
   city                 varchar(200) comment '城市',
   street               varchar(200) comment '街道',
   job                  varchar(100) comment '职业',
   employer             varchar(200) comment '雇主',
   school               varchar(200) comment '学校',
   degree               varchar(100) comment '学位',
   national             varchar(100) comment '民族',
   religion             varchar(100) comment '宗教',
   introduction         varchar(1200) comment '自我介绍',
   hobby                varchar(1200) comment '兴趣爱好',
   ice_brea_topic       varchar(500) comment '破冰话题',
   phone                varchar(50) comment '联系电话',
   package_expiration_date datetime comment '套餐到期时间',
   flowers_count        int comment '套餐-剩余鲜花次数',
   anonymous_invited_count int comment '套餐-剩余匿名邀请次数',
   recommended_count    int comment '套餐-剩余特别推荐次数',
   pair_height          varchar(20) comment '配对-身高',
   pair_inches          varchar(20) comment '配對-身高(寸)',
   pair_sex             varchar(20) comment '配对-性别',
   pair_age             varchar(20) comment '配对-年龄范围',
   pair_country         varchar(100) comment '配對-國家',
   pair_state           varchar(500) comment '配對-州',
   pair_city            varchar(100) comment '配对-城市',
   pair_national        varchar(500) comment '配对-民族',
   pair_religion        varchar(500) comment '配对-宗教',
   create_time          datetime comment '创建时间',
   attractive_point     varchar(150) comment '吸引点',
   integration          int comment '积分',
   profession           varchar(50) comment '行业',
   openid               varchar(50) comment '微信id',
   inches_height        decimal(15,4) comment '尺寸转换的身高',
   update_time          datetime comment '更新的时间',
   activate             varchar(10) comment '是否参与匹配',
   primary key (user_id)
);

alter table imeetlink_user comment '系统用户表';

/*==============================================================*/
/* Table: imeetlink_user_append                                 */
/*==============================================================*/
create table imeetlink_user_append
(
   user_append_id       varchar(50) not null comment '主键id',
   initiate_user_id     varchar(50) comment '发起人id',
   initiate_user_name   varchar(50) comment '发起人名称',
   accept_user_id       varchar(50) comment '接受人id',
   accept_user_name     varchar(50) comment '接受人名称',
   status               varchar(20) comment '状态  未同意/拒绝/已同意',
   create_time          varchar(50) comment '创建日期',
   primary key (user_append_id)
);

alter table imeetlink_user_append comment '用户-添加好友';

/*==============================================================*/
/* Table: imeetlink_user_attention                              */
/*==============================================================*/
create table imeetlink_user_attention
(
   user_attention_id    varchar(50) not null comment '主键id',
   initiate_user_id     varchar(50) comment '发起人id',
   initiate_user_name   varchar(50) comment '发起人名称',
   accept_user_id       varchar(50) comment '接受人id',
   accept_user_name     varchar(50) comment '接受人名称',
   if_attention         varchar(20) comment '关系状态 已关注/未关注',
   souce                varchar(20) comment '关注来源 每日推荐/活动/圈子',
   create_time          datetime comment '创建时间',
   primary key (user_attention_id)
);

alter table imeetlink_user_attention comment '用户-关注';

/*==============================================================*/
/* Table: imeetlink_user_book                                   */
/*==============================================================*/
create table imeetlink_user_book
(
   user_book_id         varchar(50) not null comment '主键id',
   user_id              varchar(50) comment '用户id',
   user_name            varchar(100) comment '用户名称',
   friend_id            varchar(50) comment '好友id',
   friend_name          varchar(100) comment '好友名称',
   friend_remark        varchar(50) comment '好友备注名称',
   if_focus             varchar(20) comment '是否关注',
   if_shield            varchar(20) comment '是否屏蔽',
   if_friend            varchar(20) comment '是否好友',
   focus_time           char(10) comment '关注时间',
   primary key (user_book_id)
);

alter table imeetlink_user_book comment '用户-通讯录';

/*==============================================================*/
/* Table: imeetlink_user_chat                                   */
/*==============================================================*/
create table imeetlink_user_chat
(
   user_chat_id         varchar(50) not null comment '主键id',
   user_id              varchar(50) comment '发起人id',
   user_name            varchar(50) comment '发起人名称',
   accept_user_id       varchar(50) comment '接受人id',
   accept_user_name     varchar(50) comment '接受人名称',
   type                 varchar(50) comment '消息类型',
   content              varchar(200) comment '消息内容',
   create_time          datetime comment '创建时间',
   primary key (user_chat_id)
);

alter table imeetlink_user_chat comment '用户-聊天信息';

/*==============================================================*/
/* Table: imeetlink_user_custom                                 */
/*==============================================================*/
create table imeetlink_user_custom
(
   user_custom_id       varchar(50) not null comment '主键id',
   request              varchar(200) comment '需求',
   phone                varchar(20) comment '手机',
   contact_time         datetime comment '联系时间',
   primary key (user_custom_id)
);

alter table imeetlink_user_custom comment '用户-定制';

/*==============================================================*/
/* Table: imeetlink_user_feedback                               */
/*==============================================================*/
create table imeetlink_user_feedback
(
   user_feedback        varchar(50) not null comment '主键id',
   user_id              varchar(50) comment '用户id',
   user_name            varchar(50) comment '用户名称',
   feedback             varchar(200) comment '意见反馈',
   create_time          datetime comment '创建时间',
   primary key (user_feedback)
);

alter table imeetlink_user_feedback comment '系统用户-用户反馈';

/*==============================================================*/
/* Table: imeetlink_user_freetime                               */
/*==============================================================*/
create table imeetlink_user_freetime
(
   user_freetime_id     varchar(50) not null comment '主键id',
   user_id              varchar(50) comment '用户id',
   week                 varchar(100) comment '星期',
   time_phase           varchar(100) comment '时间阶段',
   primary key (user_freetime_id)
);

alter table imeetlink_user_freetime comment '系统用户-活动空闲表';

/*==============================================================*/
/* Table: imeetlink_user_gift                                   */
/*==============================================================*/
create table imeetlink_user_gift
(
   user_gift_id         varchar(50) not null comment '主键id',
   initiate_user_id     varchar(50) comment '发起人id',
   initiate_user_name   varchar(50) comment '发起人名称',
   accept_user_id       varchar(50) comment '接受人id',
   accept_user_name     varchar(50) comment '接受人名称',
   type                 varchar(20) comment '礼物类型',
   if_anonymous         varchar(20) comment '是否匿名',
   create_time          datetime comment '创建时间',
   primary key (user_gift_id)
);

alter table imeetlink_user_gift comment '用户-礼物';

/*==============================================================*/
/* Table: imeetlink_user_message                                */
/*==============================================================*/
create table imeetlink_user_message
(
   user_message_id      datetime not null comment '主键id',
   initiate_user_id     varchar(50) comment '发起方id',
   initiate_user_name   varchar(50) comment '发起方名称',
   accept_user_id       varchar(50) comment '接收方id',
   accept_user_name     varchar(50) comment '接收方名称',
   content              varchar(200) comment '发起内容',
   type                 varchar(20) comment '消息类型',
   create_time          datetime comment '创建时间',
   primary key (user_message_id)
);

alter table imeetlink_user_message comment '用户-消息';

/*==============================================================*/
/* Table: imeetlink_user_report                                 */
/*==============================================================*/
create table imeetlink_user_report
(
   user_report          varchar(50) comment '主键',
   report_id            varchar(50) comment '举报人Id',
   report_user_name     varchar(100) comment '举报人用户名',
   user_id              varchar(50) comment '被举报人id',
   user_name            varchar(100) comment '被举报人姓名',
   content              varchar(1000) comment '举报内容',
   create_time          datetime comment '时间'
);

alter table imeetlink_user_report comment '系统用户--用户举报';

/*==============================================================*/
/* Table: imeetlink_user_website                                */
/*==============================================================*/
create table imeetlink_user_website
(
   user_website_id      varchar(50) not null,
   user_id              varchar(50),
   website              varchar(200),
   remark               varchar(200) comment '个人简介',
   primary key (user_website_id)
);

alter table imeetlink_user_website comment '系统用户--个人网站';

