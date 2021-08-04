
CREATE TABLE [Авиакомпания]
( 
	[ИАТА_код]           char(3)  NOT NULL ,
	[Наименование]       varchar(25)  NOT NULL 
)
go

CREATE TABLE [Аэропорт]
( 
	[Аэропорт#]          integer  NOT NULL ,
	[ИКАО_код]           char(4)  NOT NULL ,
	[Город]              nvarchar(25)  NOT NULL ,
	[Наименование]       nvarchar(30)  NOT NULL ,
	[Страна#]            tinyint  NOT NULL 
)
go

CREATE TABLE [Билет]
( 
	[Пассажир#]          integer  NOT NULL ,
	[Перелёт#]           integer  NOT NULL ,
	[Класс]              char(18)  NOT NULL ,
	[Место]              tinyint  NOT NULL 
)
go

CREATE TABLE [Борт]
( 
	[Борт#]              integer  NOT NULL ,
	[Бортовой_номер]     nvarchar(7)  NOT NULL ,
	[Модель#]            integer  NOT NULL ,
	[Дата_введения_в_эксплуатацию] date  NOT NULL ,
	[Страна#]            tinyint  NOT NULL 
)
go

CREATE TABLE [Должность]
( 
	[Должность#]         tinyint  NOT NULL ,
	[Наименование]       nvarchar(30)  NOT NULL 
)
go

CREATE TABLE [Инцидент]
( 
	[Инцидент#]          integer  NOT NULL ,
	[Время]              Time  NOT NULL ,
	[Широта]             float  NOT NULL ,
	[Долгота]            float  NOT NULL ,
	[Этап_полёта#]       tinyint  NOT NULL ,
	[Число_пострадавших_на_земле] tinyint  NOT NULL ,
	[Число_погибших]     tinyint  NOT NULL ,
	[Число_понесших_травмы] tinyint  NOT NULL ,
	[Число_сохранных]    tinyint  NOT NULL ,
	[Перелёт#]           integer  NOT NULL ,
	[Причина#]           integer  NOT NULL 
)
go

CREATE TABLE [Модель]
( 
	[Модель#]            integer  NOT NULL ,
	[Наименование]       nvarchar(30)  NOT NULL 
)
go

CREATE TABLE [Наземный_техник]
( 
	[Техник#]            integer  NOT NULL ,
	[Серия_и_номер_паспорта] nvarchar(10)  NOT NULL ,
	[Фамилия]            varchar(24)  NOT NULL ,
	[Имя]                varchar(24)  NOT NULL ,
	[Отчество]           varchar(24)  NOT NULL ,
	[Дата_рождения]      date  NOT NULL ,
	[Аэропорт#]          integer  NOT NULL 
)
go

CREATE TABLE [Неисправность_борта]
( 
	[Причина#]           integer  NOT NULL 
)
go

CREATE TABLE [Ошибка_техника]
( 
	[Причина#]           integer  NOT NULL ,
	[Объяснительная_техника] nvarchar(300)  NULL 
)
go

CREATE TABLE [Ошибка_экипажа]
( 
	[Причина#]           integer  NOT NULL ,
	[Объяснительная_члена_экипажа] nvarchar(300)  NULL 
)
go

CREATE TABLE [Пассажир]
( 
	[Пассажир#]          integer  NOT NULL ,
	[Серия_и_номер_паспорта] nvarchar(10)  NOT NULL ,
	[Фамилия]            nvarchar(25)  NOT NULL ,
	[Имя]                nvarchar(25)  NOT NULL ,
	[Отчество]           nvarchar(25)  NOT NULL ,
	[Дата_рождения]      date  NOT NULL ,
	[Страна#]            tinyint  NOT NULL ,
	[Номер_телефона]     nvarchar(18)  NOT NULL 
)
go

CREATE TABLE [Перелёт]
( 
	[Перелёт#]           integer  NOT NULL ,
	[Рейс#]              integer  NOT NULL ,
	[Техник#]            integer  NOT NULL ,
	[Борт#]              integer  NOT NULL ,
	[Дата]               date  NOT NULL ,
	[Время]              Time  NOT NULL 
)
go

CREATE TABLE [Потерпевший_пассажир]
( 
	[Инцидент#]          integer  NOT NULL ,
	[Пассажир#]          integer  NOT NULL ,
	[Статус_повреждения] nvarchar(20)  NOT NULL ,
	[Возмещение_ущерба]  decimal()  NOT NULL 
)
go

CREATE TABLE [Потерпевший_член_экипажа]
( 
	[Инцидент#]          integer  NOT NULL ,
	[Член_экипажа#]      integer  NOT NULL ,
	[Статус_повреждения] nvarchar(20)  NOT NULL ,
	[Возмещение_ущерба]  decimal()  NOT NULL 
)
go

CREATE TABLE [Причина_инцидента]
( 
	[Причина#]           integer  NOT NULL ,
	[Описание]           nvarchar(300)  NOT NULL ,
	[Название]           nvarchar(300)  NULL 
)
go

CREATE TABLE [Рейс]
( 
	[Рейс#]              integer  NOT NULL ,
	[Цифровой_код]       char(6)  NOT NULL ,
	[ИАТА_код]           char(3)  NOT NULL ,
	[Аэропорт_отправления#] integer  NOT NULL ,
	[Аэропорт_назначения#] integer  NOT NULL 
)
go

CREATE TABLE [Страна]
( 
	[Страна#]            tinyint  NOT NULL ,
	[Наименование]       nvarchar(29)  NOT NULL 
)
go

CREATE TABLE [Член_экипажа]
( 
	[Член_экипажа#]      integer  NOT NULL ,
	[Серия_и_номер_паспорта] nvarchar(10)  NOT NULL ,
	[Фамилия]            nvarchar(25)  NOT NULL ,
	[Имя]                nvarchar(25)  NOT NULL ,
	[Отчество]           nvarchar(25)  NOT NULL ,
	[Дата_рождения]      date  NOT NULL ,
	[Должность#]         tinyint  NOT NULL 
)
go

CREATE TABLE [Экипаж]
( 
	[Член_экипажа#]      integer  NOT NULL ,
	[Борт#]              integer  NOT NULL ,
	[Дата_смены]         date  NOT NULL ,
	[Время_смены]        Time  NOT NULL 
)
go

CREATE TABLE [Этап_полёта]
( 
	[Этап_полёта#]       tinyint  NOT NULL ,
	[Наименование]       nvarchar(10)  NULL 
)
go

ALTER TABLE [Авиакомпания]
	ADD CONSTRAINT [XPKАвиакомпания] PRIMARY KEY  CLUSTERED ([ИАТА_код] ASC)
go

ALTER TABLE [Аэропорт]
	ADD CONSTRAINT [XPKАэропорт] PRIMARY KEY  CLUSTERED ([Аэропорт#] ASC)
go

ALTER TABLE [Билет]
	ADD CONSTRAINT [XPKБилет] PRIMARY KEY  CLUSTERED ([Пассажир#] ASC,[Перелёт#] ASC)
go

ALTER TABLE [Борт]
	ADD CONSTRAINT [XPKБорт] PRIMARY KEY  CLUSTERED ([Борт#] ASC)
go

ALTER TABLE [Должность]
	ADD CONSTRAINT [XPKДолжность] PRIMARY KEY  CLUSTERED ([Должность#] ASC)
go

ALTER TABLE [Инцидент]
	ADD CONSTRAINT [XPKИнцидент] PRIMARY KEY  CLUSTERED ([Инцидент#] ASC)
go

ALTER TABLE [Модель]
	ADD CONSTRAINT [XPKМодель] PRIMARY KEY  CLUSTERED ([Модель#] ASC)
go

ALTER TABLE [Наземный_техник]
	ADD CONSTRAINT [XPKНаземный_техник] PRIMARY KEY  CLUSTERED ([Техник#] ASC)
go

ALTER TABLE [Неисправность_борта]
	ADD CONSTRAINT [XPKНеисправность_борта] PRIMARY KEY  CLUSTERED ([Причина#] ASC)
go

ALTER TABLE [Ошибка_техника]
	ADD CONSTRAINT [XPKОшибка_техника] PRIMARY KEY  CLUSTERED ([Причина#] ASC)
go

ALTER TABLE [Ошибка_экипажа]
	ADD CONSTRAINT [XPKОшибка_экипажа] PRIMARY KEY  CLUSTERED ([Причина#] ASC)
go

ALTER TABLE [Пассажир]
	ADD CONSTRAINT [XPKПассажир] PRIMARY KEY  CLUSTERED ([Пассажир#] ASC)
go

ALTER TABLE [Перелёт]
	ADD CONSTRAINT [XPKПерелёт] PRIMARY KEY  CLUSTERED ([Перелёт#] ASC)
go

ALTER TABLE [Потерпевший_пассажир]
	ADD CONSTRAINT [XPKПотерпевший_пассажир] PRIMARY KEY  CLUSTERED ([Инцидент#] ASC,[Пассажир#] ASC)
go

ALTER TABLE [Потерпевший_член_экипажа]
	ADD CONSTRAINT [XPKПотерпевший_член_экипажа] PRIMARY KEY  CLUSTERED ([Инцидент#] ASC,[Член_экипажа#] ASC)
go

ALTER TABLE [Причина_инцидента]
	ADD CONSTRAINT [XPKПричина_инцидента] PRIMARY KEY  CLUSTERED ([Причина#] ASC)
go

ALTER TABLE [Рейс]
	ADD CONSTRAINT [XPKРейс] PRIMARY KEY  CLUSTERED ([Рейс#] ASC)
go

ALTER TABLE [Страна]
	ADD CONSTRAINT [XPKСтрана] PRIMARY KEY  CLUSTERED ([Страна#] ASC)
go

ALTER TABLE [Член_экипажа]
	ADD CONSTRAINT [XPKЧлен_экипажа] PRIMARY KEY  CLUSTERED ([Член_экипажа#] ASC)
go

ALTER TABLE [Экипаж]
	ADD CONSTRAINT [XPKЭкипаж] PRIMARY KEY  CLUSTERED ([Член_экипажа#] ASC,[Борт#] ASC,[Дата_смены] ASC,[Время_смены] ASC)
go

ALTER TABLE [Этап_полёта]
	ADD CONSTRAINT [XPKЭтап_полёта] PRIMARY KEY  CLUSTERED ([Этап_полёта#] ASC)
go


ALTER TABLE [Аэропорт]
	ADD CONSTRAINT [R_45] FOREIGN KEY ([Страна#]) REFERENCES [Страна]([Страна#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Билет]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([Пассажир#]) REFERENCES [Пассажир]([Пассажир#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Билет]
	ADD CONSTRAINT [R_44] FOREIGN KEY ([Перелёт#]) REFERENCES [Перелёт]([Перелёт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Борт]
	ADD CONSTRAINT [R_46] FOREIGN KEY ([Страна#]) REFERENCES [Страна]([Страна#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Борт]
	ADD CONSTRAINT [R_52] FOREIGN KEY ([Модель#]) REFERENCES [Модель]([Модель#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Инцидент]
	ADD CONSTRAINT [R_19] FOREIGN KEY ([Этап_полёта#]) REFERENCES [Этап_полёта]([Этап_полёта#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Инцидент]
	ADD CONSTRAINT [R_48] FOREIGN KEY ([Перелёт#]) REFERENCES [Перелёт]([Перелёт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Инцидент]
	ADD CONSTRAINT [R_53] FOREIGN KEY ([Причина#]) REFERENCES [Причина_инцидента]([Причина#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Наземный_техник]
	ADD CONSTRAINT [R_51] FOREIGN KEY ([Аэропорт#]) REFERENCES [Аэропорт]([Аэропорт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Неисправность_борта]
	ADD CONSTRAINT [R_39] FOREIGN KEY ([Причина#]) REFERENCES [Причина_инцидента]([Причина#])
		ON DELETE RESTRICT
go


ALTER TABLE [Ошибка_техника]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([Причина#]) REFERENCES [Причина_инцидента]([Причина#])
		ON DELETE RESTRICT
go


ALTER TABLE [Ошибка_экипажа]
	ADD CONSTRAINT [R_36] FOREIGN KEY ([Причина#]) REFERENCES [Причина_инцидента]([Причина#])
		ON DELETE RESTRICT
go


ALTER TABLE [Пассажир]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([Страна#]) REFERENCES [Страна]([Страна#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Перелёт]
	ADD CONSTRAINT [R_41] FOREIGN KEY ([Борт#]) REFERENCES [Борт]([Борт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Перелёт]
	ADD CONSTRAINT [R_42] FOREIGN KEY ([Рейс#]) REFERENCES [Рейс]([Рейс#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Перелёт]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([Техник#]) REFERENCES [Наземный_техник]([Техник#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Потерпевший_пассажир]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([Инцидент#]) REFERENCES [Инцидент]([Инцидент#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Потерпевший_пассажир]
	ADD CONSTRAINT [R_49] FOREIGN KEY ([Пассажир#]) REFERENCES [Пассажир]([Пассажир#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Потерпевший_член_экипажа]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([Инцидент#]) REFERENCES [Инцидент]([Инцидент#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Потерпевший_член_экипажа]
	ADD CONSTRAINT [R_50] FOREIGN KEY ([Член_экипажа#]) REFERENCES [Член_экипажа]([Член_экипажа#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Рейс]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([ИАТА_код]) REFERENCES [Авиакомпания]([ИАТА_код])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Рейс]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([Аэропорт_назначения#]) REFERENCES [Аэропорт]([Аэропорт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Рейс]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([Аэропорт_отправления#]) REFERENCES [Аэропорт]([Аэропорт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Член_экипажа]
	ADD CONSTRAINT [R_43] FOREIGN KEY ([Должность#]) REFERENCES [Должность]([Должность#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Экипаж]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([Борт#]) REFERENCES [Борт]([Борт#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Экипаж]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([Член_экипажа#]) REFERENCES [Член_экипажа]([Член_экипажа#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


CREATE TRIGGER tD_Авиакомпания ON Авиакомпания FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Авиакомпания */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Авиакомпания  Рейс on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000cf06", PARENT_OWNER="", PARENT_TABLE="Авиакомпания"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="ИАТА_код" */
    DELETE Рейс
      FROM Рейс,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.ИАТА_код = deleted.ИАТА_код


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Авиакомпания ON Авиакомпания FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Авиакомпания */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insИАТА_код char(3),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Авиакомпания  Рейс on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017339", PARENT_OWNER="", PARENT_TABLE="Авиакомпания"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="ИАТА_код" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ИАТА_код)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insИАТА_код = inserted.ИАТА_код
        FROM inserted
      UPDATE Рейс
      SET
        /*  %JoinFKPK(Рейс,@ins," = ",",") */
        Рейс.ИАТА_код = @insИАТА_код
      FROM Рейс,inserted,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.ИАТА_код = deleted.ИАТА_код
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Авиакомпания update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Аэропорт ON Аэропорт FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Аэропорт */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Аэропорт  Наземный_техник on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00026c9d", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Наземный_техник"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="Аэропорт#" */
    DELETE Наземный_техник
      FROM Наземный_техник,deleted
      WHERE
        /*  %JoinFKPK(Наземный_техник,deleted," = "," AND") */
        Наземный_техник.Аэропорт# = deleted.Аэропорт#

    /* erwin Builtin Trigger */
    /* Аэропорт  Рейс on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="Аэропорт_отправления#" */
    DELETE Рейс
      FROM Рейс,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.Аэропорт_отправления# = deleted.Аэропорт#

    /* erwin Builtin Trigger */
    /* Аэропорт  Рейс on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Аэропорт_назначения#" */
    DELETE Рейс
      FROM Рейс,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.Аэропорт_назначения# = deleted.Аэропорт#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Аэропорт ON Аэропорт FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Аэропорт */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Страна  Аэропорт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0001604f", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Аэропорт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Аэропорт because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Аэропорт ON Аэропорт FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Аэропорт */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insАэропорт# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Аэропорт  Наземный_техник on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00059232", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Наземный_техник"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="Аэропорт#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Аэропорт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insАэропорт# = inserted.Аэропорт#
        FROM inserted
      UPDATE Наземный_техник
      SET
        /*  %JoinFKPK(Наземный_техник,@ins," = ",",") */
        Наземный_техник.Аэропорт# = @insАэропорт#
      FROM Наземный_техник,inserted,deleted
      WHERE
        /*  %JoinFKPK(Наземный_техник,deleted," = "," AND") */
        Наземный_техник.Аэропорт# = deleted.Аэропорт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Аэропорт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="Аэропорт_отправления#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Аэропорт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insАэропорт# = inserted.Аэропорт#
        FROM inserted
      UPDATE Рейс
      SET
        /*  %JoinFKPK(Рейс,@ins," = ",",") */
        Рейс.Аэропорт_отправления# = @insАэропорт#
      FROM Рейс,inserted,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.Аэропорт_отправления# = deleted.Аэропорт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Аэропорт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Аэропорт_назначения#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Аэропорт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insАэропорт# = inserted.Аэропорт#
        FROM inserted
      UPDATE Рейс
      SET
        /*  %JoinFKPK(Рейс,@ins," = ",",") */
        Рейс.Аэропорт_назначения# = @insАэропорт#
      FROM Рейс,inserted,deleted
      WHERE
        /*  %JoinFKPK(Рейс,deleted," = "," AND") */
        Рейс.Аэропорт_назначения# = deleted.Аэропорт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Аэропорт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Аэропорт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Аэропорт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Аэропорт because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Билет ON Билет FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Билет */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Перелёт  Билет on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00029628", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="Перелёт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Перелёт
        WHERE
          /* %JoinFKPK(inserted,Перелёт) */
          inserted.Перелёт# = Перелёт.Перелёт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Билет because Перелёт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Пассажир  Билет on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Пассажир#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Пассажир
        WHERE
          /* %JoinFKPK(inserted,Пассажир) */
          inserted.Пассажир# = Пассажир.Пассажир#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Билет because Пассажир does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Билет ON Билет FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Билет */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПассажир# integer, 
           @insПерелёт# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Перелёт  Билет on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002963d", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="Перелёт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Перелёт
        WHERE
          /* %JoinFKPK(inserted,Перелёт) */
          inserted.Перелёт# = Перелёт.Перелёт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Билет because Перелёт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Пассажир  Билет on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Пассажир#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Пассажир
        WHERE
          /* %JoinFKPK(inserted,Пассажир) */
          inserted.Пассажир# = Пассажир.Пассажир#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Билет because Пассажир does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Борт ON Борт FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Борт */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Борт  Перелёт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00017a9b", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="Борт#" */
    DELETE Перелёт
      FROM Перелёт,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Борт# = deleted.Борт#

    /* erwin Builtin Trigger */
    /* Борт  Экипаж on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Борт#" */
    DELETE Экипаж
      FROM Экипаж,deleted
      WHERE
        /*  %JoinFKPK(Экипаж,deleted," = "," AND") */
        Экипаж.Борт# = deleted.Борт#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Борт ON Борт FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Борт */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Модель  Борт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00029f1e", PARENT_OWNER="", PARENT_TABLE="Модель"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="Модель#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Модель#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Модель
        WHERE
          /* %JoinFKPK(inserted,Модель) */
          inserted.Модель# = Модель.Модель#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Борт because Модель does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Борт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Борт because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Борт ON Борт FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Борт */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insБорт# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Борт  Перелёт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00050f34", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="Борт#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insБорт# = inserted.Борт#
        FROM inserted
      UPDATE Перелёт
      SET
        /*  %JoinFKPK(Перелёт,@ins," = ",",") */
        Перелёт.Борт# = @insБорт#
      FROM Перелёт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Борт# = deleted.Борт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Борт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Борт  Экипаж on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Борт#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insБорт# = inserted.Борт#
        FROM inserted
      UPDATE Экипаж
      SET
        /*  %JoinFKPK(Экипаж,@ins," = ",",") */
        Экипаж.Борт# = @insБорт#
      FROM Экипаж,inserted,deleted
      WHERE
        /*  %JoinFKPK(Экипаж,deleted," = "," AND") */
        Экипаж.Борт# = deleted.Борт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Борт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Модель  Борт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Модель"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="Модель#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Модель#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Модель
        WHERE
          /* %JoinFKPK(inserted,Модель) */
          inserted.Модель# = Модель.Модель#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Борт because Модель does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Борт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Борт because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Должность ON Должность FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Должность */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Должность  Член_экипажа on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000f0ee", PARENT_OWNER="", PARENT_TABLE="Должность"
    CHILD_OWNER="", CHILD_TABLE="Член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="Должность#" */
    DELETE Член_экипажа
      FROM Член_экипажа,deleted
      WHERE
        /*  %JoinFKPK(Член_экипажа,deleted," = "," AND") */
        Член_экипажа.Должность# = deleted.Должность#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Должность ON Должность FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Должность */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insДолжность# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Должность  Член_экипажа on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00019a8f", PARENT_OWNER="", PARENT_TABLE="Должность"
    CHILD_OWNER="", CHILD_TABLE="Член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="Должность#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Должность#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insДолжность# = inserted.Должность#
        FROM inserted
      UPDATE Член_экипажа
      SET
        /*  %JoinFKPK(Член_экипажа,@ins," = ",",") */
        Член_экипажа.Должность# = @insДолжность#
      FROM Член_экипажа,inserted,deleted
      WHERE
        /*  %JoinFKPK(Член_экипажа,deleted," = "," AND") */
        Член_экипажа.Должность# = deleted.Должность#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Должность update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Инцидент ON Инцидент FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Инцидент */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Инцидент  Потерпевший_член_экипажа on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001d696", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="Инцидент#" */
    DELETE Потерпевший_член_экипажа
      FROM Потерпевший_член_экипажа,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_член_экипажа,deleted," = "," AND") */
        Потерпевший_член_экипажа.Инцидент# = deleted.Инцидент#

    /* erwin Builtin Trigger */
    /* Инцидент  Потерпевший_пассажир on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="Инцидент#" */
    DELETE Потерпевший_пассажир
      FROM Потерпевший_пассажир,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_пассажир,deleted," = "," AND") */
        Потерпевший_пассажир.Инцидент# = deleted.Инцидент#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Инцидент ON Инцидент FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Инцидент */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Инцидент on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000409c8", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Инцидент because Причина_инцидента does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Перелёт  Инцидент on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="Перелёт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Перелёт
        WHERE
          /* %JoinFKPK(inserted,Перелёт) */
          inserted.Перелёт# = Перелёт.Перелёт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Инцидент because Перелёт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Этап_полёта  Инцидент on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Этап_полёта"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="Этап_полёта#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Этап_полёта#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Этап_полёта
        WHERE
          /* %JoinFKPK(inserted,Этап_полёта) */
          inserted.Этап_полёта# = Этап_полёта.Этап_полёта#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Инцидент because Этап_полёта does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Инцидент ON Инцидент FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Инцидент */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insИнцидент# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_член_экипажа on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000744bf", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="Инцидент#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insИнцидент# = inserted.Инцидент#
        FROM inserted
      UPDATE Потерпевший_член_экипажа
      SET
        /*  %JoinFKPK(Потерпевший_член_экипажа,@ins," = ",",") */
        Потерпевший_член_экипажа.Инцидент# = @insИнцидент#
      FROM Потерпевший_член_экипажа,inserted,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_член_экипажа,deleted," = "," AND") */
        Потерпевший_член_экипажа.Инцидент# = deleted.Инцидент#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Инцидент update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_пассажир on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="Инцидент#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insИнцидент# = inserted.Инцидент#
        FROM inserted
      UPDATE Потерпевший_пассажир
      SET
        /*  %JoinFKPK(Потерпевший_пассажир,@ins," = ",",") */
        Потерпевший_пассажир.Инцидент# = @insИнцидент#
      FROM Потерпевший_пассажир,inserted,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_пассажир,deleted," = "," AND") */
        Потерпевший_пассажир.Инцидент# = deleted.Инцидент#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Инцидент update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Причина_инцидента  Инцидент on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Инцидент because Причина_инцидента does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Перелёт  Инцидент on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="Перелёт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Перелёт
        WHERE
          /* %JoinFKPK(inserted,Перелёт) */
          inserted.Перелёт# = Перелёт.Перелёт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Инцидент because Перелёт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Этап_полёта  Инцидент on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Этап_полёта"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="Этап_полёта#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Этап_полёта#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Этап_полёта
        WHERE
          /* %JoinFKPK(inserted,Этап_полёта) */
          inserted.Этап_полёта# = Этап_полёта.Этап_полёта#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Инцидент because Этап_полёта does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Модель ON Модель FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Модель */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Модель  Борт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000dc50", PARENT_OWNER="", PARENT_TABLE="Модель"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="Модель#" */
    DELETE Борт
      FROM Борт,deleted
      WHERE
        /*  %JoinFKPK(Борт,deleted," = "," AND") */
        Борт.Модель# = deleted.Модель#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Модель ON Модель FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Модель */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insМодель# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Модель  Борт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017471", PARENT_OWNER="", PARENT_TABLE="Модель"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="Модель#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Модель#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insМодель# = inserted.Модель#
        FROM inserted
      UPDATE Борт
      SET
        /*  %JoinFKPK(Борт,@ins," = ",",") */
        Борт.Модель# = @insМодель#
      FROM Борт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Борт,deleted," = "," AND") */
        Борт.Модель# = deleted.Модель#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Модель update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Наземный_техник ON Наземный_техник FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Наземный_техник */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Наземный_техник  Перелёт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000d4ae", PARENT_OWNER="", PARENT_TABLE="Наземный_техник"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Техник#" */
    DELETE Перелёт
      FROM Перелёт,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Техник# = deleted.Техник#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Наземный_техник ON Наземный_техник FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Наземный_техник */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Аэропорт  Наземный_техник on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000165d5", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Наземный_техник"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="Аэропорт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Наземный_техник because Аэропорт does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Наземный_техник ON Наземный_техник FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Наземный_техник */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insТехник# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Наземный_техник  Перелёт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0002d2de", PARENT_OWNER="", PARENT_TABLE="Наземный_техник"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Техник#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Техник#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insТехник# = inserted.Техник#
        FROM inserted
      UPDATE Перелёт
      SET
        /*  %JoinFKPK(Перелёт,@ins," = ",",") */
        Перелёт.Техник# = @insТехник#
      FROM Перелёт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Техник# = deleted.Техник#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Наземный_техник update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Наземный_техник on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Наземный_техник"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="Аэропорт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Наземный_техник because Аэропорт does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Неисправность_борта ON Неисправность_борта FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Неисправность_борта */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Неисправность_борта on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00019310", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Неисправность_борта"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Неисправность_борта because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Неисправность_борта ON Неисправность_борта FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Неисправность_борта */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПричина# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Неисправность_борта on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00019188", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Неисправность_борта"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Неисправность_борта because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Ошибка_техника ON Ошибка_техника FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Ошибка_техника */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_техника on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000185d6", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_техника"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Ошибка_техника because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Ошибка_техника ON Ошибка_техника FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ошибка_техника */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПричина# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_техника on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00017ee4", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_техника"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ошибка_техника because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Ошибка_экипажа ON Ошибка_экипажа FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Ошибка_экипажа */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_экипажа on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00018569", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Ошибка_экипажа because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Ошибка_экипажа ON Ошибка_экипажа FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ошибка_экипажа */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПричина# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_экипажа on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001860a", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="Причина#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Причина_инцидента
        WHERE
          /* %JoinFKPK(inserted,Причина_инцидента) */
          inserted.Причина# = Причина_инцидента.Причина#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ошибка_экипажа because Причина_инцидента does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Пассажир ON Пассажир FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Пассажир */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Пассажир  Потерпевший_пассажир on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001b6e9", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="Пассажир#" */
    DELETE Потерпевший_пассажир
      FROM Потерпевший_пассажир,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_пассажир,deleted," = "," AND") */
        Потерпевший_пассажир.Пассажир# = deleted.Пассажир#

    /* erwin Builtin Trigger */
    /* Пассажир  Билет on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Пассажир#" */
    DELETE Билет
      FROM Билет,deleted
      WHERE
        /*  %JoinFKPK(Билет,deleted," = "," AND") */
        Билет.Пассажир# = deleted.Пассажир#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Пассажир ON Пассажир FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Пассажир */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Страна  Пассажир on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00016462", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Пассажир because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Пассажир ON Пассажир FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Пассажир */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПассажир# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Пассажир  Потерпевший_пассажир on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00042836", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="Пассажир#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insПассажир# = inserted.Пассажир#
        FROM inserted
      UPDATE Потерпевший_пассажир
      SET
        /*  %JoinFKPK(Потерпевший_пассажир,@ins," = ",",") */
        Потерпевший_пассажир.Пассажир# = @insПассажир#
      FROM Потерпевший_пассажир,inserted,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_пассажир,deleted," = "," AND") */
        Потерпевший_пассажир.Пассажир# = deleted.Пассажир#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Пассажир update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Пассажир  Билет on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="Пассажир#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insПассажир# = inserted.Пассажир#
        FROM inserted
      UPDATE Билет
      SET
        /*  %JoinFKPK(Билет,@ins," = ",",") */
        Билет.Пассажир# = @insПассажир#
      FROM Билет,inserted,deleted
      WHERE
        /*  %JoinFKPK(Билет,deleted," = "," AND") */
        Билет.Пассажир# = deleted.Пассажир#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Пассажир update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Пассажир on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="Страна#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Страна
        WHERE
          /* %JoinFKPK(inserted,Страна) */
          inserted.Страна# = Страна.Страна#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Пассажир because Страна does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Перелёт ON Перелёт FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Перелёт */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Перелёт  Инцидент on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000194e2", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="Перелёт#" */
    DELETE Инцидент
      FROM Инцидент,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Перелёт# = deleted.Перелёт#

    /* erwin Builtin Trigger */
    /* Перелёт  Билет on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="Перелёт#" */
    DELETE Билет
      FROM Билет,deleted
      WHERE
        /*  %JoinFKPK(Билет,deleted," = "," AND") */
        Билет.Перелёт# = deleted.Перелёт#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Перелёт ON Перелёт FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Перелёт */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Рейс  Перелёт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0003c646", PARENT_OWNER="", PARENT_TABLE="Рейс"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Рейс#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Рейс#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Рейс
        WHERE
          /* %JoinFKPK(inserted,Рейс) */
          inserted.Рейс# = Рейс.Рейс#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Перелёт because Рейс does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Борт  Перелёт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="Борт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Борт
        WHERE
          /* %JoinFKPK(inserted,Борт) */
          inserted.Борт# = Борт.Борт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Перелёт because Борт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Наземный_техник  Перелёт on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Наземный_техник"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Техник#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Техник#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Наземный_техник
        WHERE
          /* %JoinFKPK(inserted,Наземный_техник) */
          inserted.Техник# = Наземный_техник.Техник#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Перелёт because Наземный_техник does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Перелёт ON Перелёт FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Перелёт */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПерелёт# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Перелёт  Инцидент on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0006589b", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="Перелёт#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insПерелёт# = inserted.Перелёт#
        FROM inserted
      UPDATE Инцидент
      SET
        /*  %JoinFKPK(Инцидент,@ins," = ",",") */
        Инцидент.Перелёт# = @insПерелёт#
      FROM Инцидент,inserted,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Перелёт# = deleted.Перелёт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Перелёт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Перелёт  Билет on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Перелёт"
    CHILD_OWNER="", CHILD_TABLE="Билет"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="Перелёт#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Перелёт#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insПерелёт# = inserted.Перелёт#
        FROM inserted
      UPDATE Билет
      SET
        /*  %JoinFKPK(Билет,@ins," = ",",") */
        Билет.Перелёт# = @insПерелёт#
      FROM Билет,inserted,deleted
      WHERE
        /*  %JoinFKPK(Билет,deleted," = "," AND") */
        Билет.Перелёт# = deleted.Перелёт#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Перелёт update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Рейс  Перелёт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Рейс"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Рейс#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Рейс#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Рейс
        WHERE
          /* %JoinFKPK(inserted,Рейс) */
          inserted.Рейс# = Рейс.Рейс#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Перелёт because Рейс does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Борт  Перелёт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="Борт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Борт
        WHERE
          /* %JoinFKPK(inserted,Борт) */
          inserted.Борт# = Борт.Борт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Перелёт because Борт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Наземный_техник  Перелёт on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Наземный_техник"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Техник#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Техник#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Наземный_техник
        WHERE
          /* %JoinFKPK(inserted,Наземный_техник) */
          inserted.Техник# = Наземный_техник.Техник#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Перелёт because Наземный_техник does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Потерпевший_пассажир ON Потерпевший_пассажир FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Потерпевший_пассажир */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Пассажир  Потерпевший_пассажир on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002cddc", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="Пассажир#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Пассажир
        WHERE
          /* %JoinFKPK(inserted,Пассажир) */
          inserted.Пассажир# = Пассажир.Пассажир#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Потерпевший_пассажир because Пассажир does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_пассажир on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="Инцидент#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Инцидент
        WHERE
          /* %JoinFKPK(inserted,Инцидент) */
          inserted.Инцидент# = Инцидент.Инцидент#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Потерпевший_пассажир because Инцидент does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Потерпевший_пассажир ON Потерпевший_пассажир FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Потерпевший_пассажир */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insИнцидент# integer, 
           @insПассажир# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Пассажир  Потерпевший_пассажир on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002e23b", PARENT_OWNER="", PARENT_TABLE="Пассажир"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="Пассажир#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Пассажир#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Пассажир
        WHERE
          /* %JoinFKPK(inserted,Пассажир) */
          inserted.Пассажир# = Пассажир.Пассажир#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Потерпевший_пассажир because Пассажир does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_пассажир on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="Инцидент#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Инцидент
        WHERE
          /* %JoinFKPK(inserted,Инцидент) */
          inserted.Инцидент# = Инцидент.Инцидент#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Потерпевший_пассажир because Инцидент does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Потерпевший_член_экипажа ON Потерпевший_член_экипажа FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Потерпевший_член_экипажа */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Член_экипажа  Потерпевший_член_экипажа on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002e74f", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Член_экипажа
        WHERE
          /* %JoinFKPK(inserted,Член_экипажа) */
          inserted.Член_экипажа# = Член_экипажа.Член_экипажа#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Потерпевший_член_экипажа because Член_экипажа does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_член_экипажа on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="Инцидент#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Инцидент
        WHERE
          /* %JoinFKPK(inserted,Инцидент) */
          inserted.Инцидент# = Инцидент.Инцидент#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Потерпевший_член_экипажа because Инцидент does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Потерпевший_член_экипажа ON Потерпевший_член_экипажа FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Потерпевший_член_экипажа */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insИнцидент# integer, 
           @insЧлен_экипажа# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Член_экипажа  Потерпевший_член_экипажа on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002fced", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Член_экипажа
        WHERE
          /* %JoinFKPK(inserted,Член_экипажа) */
          inserted.Член_экипажа# = Член_экипажа.Член_экипажа#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Потерпевший_член_экипажа because Член_экипажа does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Инцидент  Потерпевший_член_экипажа on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Инцидент"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="Инцидент#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Инцидент#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Инцидент
        WHERE
          /* %JoinFKPK(inserted,Инцидент) */
          inserted.Инцидент# = Инцидент.Инцидент#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Потерпевший_член_экипажа because Инцидент does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Причина_инцидента ON Причина_инцидента FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Причина_инцидента */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Причина_инцидента  Инцидент on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00040292", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="Причина#" */
    DELETE Инцидент
      FROM Инцидент,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Причина# = deleted.Причина#

    /* erwin Builtin Trigger */
    /* Причина_инцидента  Неисправность_борта on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Неисправность_борта"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="Причина#" */
    IF EXISTS (
      SELECT * FROM deleted,Неисправность_борта
      WHERE
        /*  %JoinFKPK(Неисправность_борта,deleted," = "," AND") */
        Неисправность_борта.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Причина_инцидента because Неисправность_борта exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Причина_инцидента  Ошибка_техника on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_техника"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="Причина#" */
    IF EXISTS (
      SELECT * FROM deleted,Ошибка_техника
      WHERE
        /*  %JoinFKPK(Ошибка_техника,deleted," = "," AND") */
        Ошибка_техника.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Причина_инцидента because Ошибка_техника exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Причина_инцидента  Ошибка_экипажа on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="Причина#" */
    IF EXISTS (
      SELECT * FROM deleted,Ошибка_экипажа
      WHERE
        /*  %JoinFKPK(Ошибка_экипажа,deleted," = "," AND") */
        Ошибка_экипажа.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Причина_инцидента because Ошибка_экипажа exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Причина_инцидента ON Причина_инцидента FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Причина_инцидента */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insПричина# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Причина_инцидента  Инцидент on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00050d86", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="Причина#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insПричина# = inserted.Причина#
        FROM inserted
      UPDATE Инцидент
      SET
        /*  %JoinFKPK(Инцидент,@ins," = ",",") */
        Инцидент.Причина# = @insПричина#
      FROM Инцидент,inserted,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Причина# = deleted.Причина#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Причина_инцидента update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Причина_инцидента  Неисправность_борта on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Неисправность_борта"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="Причина#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Неисправность_борта
      WHERE
        /*  %JoinFKPK(Неисправность_борта,deleted," = "," AND") */
        Неисправность_борта.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Причина_инцидента because Неисправность_борта exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_техника on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_техника"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="Причина#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ошибка_техника
      WHERE
        /*  %JoinFKPK(Ошибка_техника,deleted," = "," AND") */
        Ошибка_техника.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Причина_инцидента because Ошибка_техника exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Причина_инцидента  Ошибка_экипажа on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Причина_инцидента"
    CHILD_OWNER="", CHILD_TABLE="Ошибка_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="Причина#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Причина#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ошибка_экипажа
      WHERE
        /*  %JoinFKPK(Ошибка_экипажа,deleted," = "," AND") */
        Ошибка_экипажа.Причина# = deleted.Причина#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Причина_инцидента because Ошибка_экипажа exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Рейс ON Рейс FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Рейс */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Рейс  Перелёт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000cf52", PARENT_OWNER="", PARENT_TABLE="Рейс"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Рейс#" */
    DELETE Перелёт
      FROM Перелёт,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Рейс# = deleted.Рейс#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Рейс ON Рейс FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Рейс */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0004033c", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="Аэропорт_отправления#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт_отправления#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт_отправления# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Рейс because Аэропорт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Аэропорт_назначения#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт_назначения#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт_назначения# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Рейс because Аэропорт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Авиакомпания  Рейс on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Авиакомпания"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="ИАТА_код" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ИАТА_код)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Авиакомпания
        WHERE
          /* %JoinFKPK(inserted,Авиакомпания) */
          inserted.ИАТА_код = Авиакомпания.ИАТА_код
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Рейс because Авиакомпания does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Рейс ON Рейс FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Рейс */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insРейс# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Рейс  Перелёт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00055bb0", PARENT_OWNER="", PARENT_TABLE="Рейс"
    CHILD_OWNER="", CHILD_TABLE="Перелёт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="Рейс#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Рейс#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insРейс# = inserted.Рейс#
        FROM inserted
      UPDATE Перелёт
      SET
        /*  %JoinFKPK(Перелёт,@ins," = ",",") */
        Перелёт.Рейс# = @insРейс#
      FROM Перелёт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Перелёт,deleted," = "," AND") */
        Перелёт.Рейс# = deleted.Рейс#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Рейс update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="Аэропорт_отправления#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт_отправления#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт_отправления# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Рейс because Аэропорт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Аэропорт  Рейс on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Аэропорт"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="Аэропорт_назначения#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Аэропорт_назначения#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Аэропорт
        WHERE
          /* %JoinFKPK(inserted,Аэропорт) */
          inserted.Аэропорт_назначения# = Аэропорт.Аэропорт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Рейс because Аэропорт does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Авиакомпания  Рейс on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Авиакомпания"
    CHILD_OWNER="", CHILD_TABLE="Рейс"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="ИАТА_код" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ИАТА_код)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Авиакомпания
        WHERE
          /* %JoinFKPK(inserted,Авиакомпания) */
          inserted.ИАТА_код = Авиакомпания.ИАТА_код
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Рейс because Авиакомпания does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Страна ON Страна FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Страна */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Страна  Борт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00024ef9", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="Страна#" */
    DELETE Борт
      FROM Борт,deleted
      WHERE
        /*  %JoinFKPK(Борт,deleted," = "," AND") */
        Борт.Страна# = deleted.Страна#

    /* erwin Builtin Trigger */
    /* Страна  Аэропорт on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Аэропорт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="Страна#" */
    DELETE Аэропорт
      FROM Аэропорт,deleted
      WHERE
        /*  %JoinFKPK(Аэропорт,deleted," = "," AND") */
        Аэропорт.Страна# = deleted.Страна#

    /* erwin Builtin Trigger */
    /* Страна  Пассажир on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="Страна#" */
    DELETE Пассажир
      FROM Пассажир,deleted
      WHERE
        /*  %JoinFKPK(Пассажир,deleted," = "," AND") */
        Пассажир.Страна# = deleted.Страна#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Страна ON Страна FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Страна */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insСтрана# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Страна  Борт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00040724", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Борт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="Страна#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insСтрана# = inserted.Страна#
        FROM inserted
      UPDATE Борт
      SET
        /*  %JoinFKPK(Борт,@ins," = ",",") */
        Борт.Страна# = @insСтрана#
      FROM Борт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Борт,deleted," = "," AND") */
        Борт.Страна# = deleted.Страна#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Страна update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Аэропорт on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Аэропорт"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="Страна#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insСтрана# = inserted.Страна#
        FROM inserted
      UPDATE Аэропорт
      SET
        /*  %JoinFKPK(Аэропорт,@ins," = ",",") */
        Аэропорт.Страна# = @insСтрана#
      FROM Аэропорт,inserted,deleted
      WHERE
        /*  %JoinFKPK(Аэропорт,deleted," = "," AND") */
        Аэропорт.Страна# = deleted.Страна#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Страна update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Страна  Пассажир on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Страна"
    CHILD_OWNER="", CHILD_TABLE="Пассажир"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="Страна#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Страна#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insСтрана# = inserted.Страна#
        FROM inserted
      UPDATE Пассажир
      SET
        /*  %JoinFKPK(Пассажир,@ins," = ",",") */
        Пассажир.Страна# = @insСтрана#
      FROM Пассажир,inserted,deleted
      WHERE
        /*  %JoinFKPK(Пассажир,deleted," = "," AND") */
        Пассажир.Страна# = deleted.Страна#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Страна update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Член_экипажа ON Член_экипажа FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Член_экипажа */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Член_экипажа  Потерпевший_член_экипажа on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001d61f", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="Член_экипажа#" */
    DELETE Потерпевший_член_экипажа
      FROM Потерпевший_член_экипажа,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_член_экипажа,deleted," = "," AND") */
        Потерпевший_член_экипажа.Член_экипажа# = deleted.Член_экипажа#

    /* erwin Builtin Trigger */
    /* Член_экипажа  Экипаж on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="Член_экипажа#" */
    DELETE Экипаж
      FROM Экипаж,deleted
      WHERE
        /*  %JoinFKPK(Экипаж,deleted," = "," AND") */
        Экипаж.Член_экипажа# = deleted.Член_экипажа#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_Член_экипажа ON Член_экипажа FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Член_экипажа */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Должность  Член_экипажа on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000180dd", PARENT_OWNER="", PARENT_TABLE="Должность"
    CHILD_OWNER="", CHILD_TABLE="Член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="Должность#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Должность#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Должность
        WHERE
          /* %JoinFKPK(inserted,Должность) */
          inserted.Должность# = Должность.Должность#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Член_экипажа because Должность does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Член_экипажа ON Член_экипажа FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Член_экипажа */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insЧлен_экипажа# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Член_экипажа  Потерпевший_член_экипажа on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00048c0e", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Потерпевший_член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insЧлен_экипажа# = inserted.Член_экипажа#
        FROM inserted
      UPDATE Потерпевший_член_экипажа
      SET
        /*  %JoinFKPK(Потерпевший_член_экипажа,@ins," = ",",") */
        Потерпевший_член_экипажа.Член_экипажа# = @insЧлен_экипажа#
      FROM Потерпевший_член_экипажа,inserted,deleted
      WHERE
        /*  %JoinFKPK(Потерпевший_член_экипажа,deleted," = "," AND") */
        Потерпевший_член_экипажа.Член_экипажа# = deleted.Член_экипажа#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Член_экипажа update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Член_экипажа  Экипаж on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insЧлен_экипажа# = inserted.Член_экипажа#
        FROM inserted
      UPDATE Экипаж
      SET
        /*  %JoinFKPK(Экипаж,@ins," = ",",") */
        Экипаж.Член_экипажа# = @insЧлен_экипажа#
      FROM Экипаж,inserted,deleted
      WHERE
        /*  %JoinFKPK(Экипаж,deleted," = "," AND") */
        Экипаж.Член_экипажа# = deleted.Член_экипажа#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Член_экипажа update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Должность  Член_экипажа on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Должность"
    CHILD_OWNER="", CHILD_TABLE="Член_экипажа"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="Должность#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Должность#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Должность
        WHERE
          /* %JoinFKPK(inserted,Должность) */
          inserted.Должность# = Должность.Должность#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Член_экипажа because Должность does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tI_Экипаж ON Экипаж FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on Экипаж */
BEGIN
   DECLARE @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Член_экипажа  Экипаж on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002aaba", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Член_экипажа
        WHERE
          /* %JoinFKPK(inserted,Член_экипажа) */
          inserted.Член_экипажа# = Член_экипажа.Член_экипажа#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Экипаж because Член_экипажа does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Борт  Экипаж on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Борт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Борт
        WHERE
          /* %JoinFKPK(inserted,Борт) */
          inserted.Борт# = Борт.Борт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert Экипаж because Борт does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Экипаж ON Экипаж FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Экипаж */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insЧлен_экипажа# integer, 
           @insБорт# integer, 
           @insДата_смены date, 
           @insВремя_смены Time,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Член_экипажа  Экипаж on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002bb82", PARENT_OWNER="", PARENT_TABLE="Член_экипажа"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="Член_экипажа#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Член_экипажа#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Член_экипажа
        WHERE
          /* %JoinFKPK(inserted,Член_экипажа) */
          inserted.Член_экипажа# = Член_экипажа.Член_экипажа#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Экипаж because Член_экипажа does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Борт  Экипаж on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Борт"
    CHILD_OWNER="", CHILD_TABLE="Экипаж"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="Борт#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Борт#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Борт
        WHERE
          /* %JoinFKPK(inserted,Борт) */
          inserted.Борт# = Борт.Борт#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Экипаж because Борт does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Этап_полёта ON Этап_полёта FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Этап_полёта */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Этап_полёта  Инцидент on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000eabb", PARENT_OWNER="", PARENT_TABLE="Этап_полёта"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="Этап_полёта#" */
    DELETE Инцидент
      FROM Инцидент,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Этап_полёта# = deleted.Этап_полёта#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Этап_полёта ON Этап_полёта FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Этап_полёта */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insЭтап_полёта# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Этап_полёта  Инцидент on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0001885d", PARENT_OWNER="", PARENT_TABLE="Этап_полёта"
    CHILD_OWNER="", CHILD_TABLE="Инцидент"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="Этап_полёта#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Этап_полёта#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insЭтап_полёта# = inserted.Этап_полёта#
        FROM inserted
      UPDATE Инцидент
      SET
        /*  %JoinFKPK(Инцидент,@ins," = ",",") */
        Инцидент.Этап_полёта# = @insЭтап_полёта#
      FROM Инцидент,inserted,deleted
      WHERE
        /*  %JoinFKPK(Инцидент,deleted," = "," AND") */
        Инцидент.Этап_полёта# = deleted.Этап_полёта#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Этап_полёта update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


