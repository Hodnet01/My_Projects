
CREATE TABLE [������������]
( 
	[����_���]           char(3)  NOT NULL ,
	[������������]       varchar(25)  NOT NULL 
)
go

CREATE TABLE [��������]
( 
	[��������#]          integer  NOT NULL ,
	[����_���]           char(4)  NOT NULL ,
	[�����]              nvarchar(25)  NOT NULL ,
	[������������]       nvarchar(30)  NOT NULL ,
	[������#]            tinyint  NOT NULL 
)
go

CREATE TABLE [�����]
( 
	[��������#]          integer  NOT NULL ,
	[������#]           integer  NOT NULL ,
	[�����]              char(18)  NOT NULL ,
	[�����]              tinyint  NOT NULL 
)
go

CREATE TABLE [����]
( 
	[����#]              integer  NOT NULL ,
	[��������_�����]     nvarchar(7)  NOT NULL ,
	[������#]            integer  NOT NULL ,
	[����_��������_�_������������] date  NOT NULL ,
	[������#]            tinyint  NOT NULL 
)
go

CREATE TABLE [���������]
( 
	[���������#]         tinyint  NOT NULL ,
	[������������]       nvarchar(30)  NOT NULL 
)
go

CREATE TABLE [��������]
( 
	[��������#]          integer  NOT NULL ,
	[�����]              Time  NOT NULL ,
	[������]             float  NOT NULL ,
	[�������]            float  NOT NULL ,
	[����_�����#]       tinyint  NOT NULL ,
	[�����_������������_��_�����] tinyint  NOT NULL ,
	[�����_��������]     tinyint  NOT NULL ,
	[�����_��������_������] tinyint  NOT NULL ,
	[�����_���������]    tinyint  NOT NULL ,
	[������#]           integer  NOT NULL ,
	[�������#]           integer  NOT NULL 
)
go

CREATE TABLE [������]
( 
	[������#]            integer  NOT NULL ,
	[������������]       nvarchar(30)  NOT NULL 
)
go

CREATE TABLE [��������_������]
( 
	[������#]            integer  NOT NULL ,
	[�����_�_�����_��������] nvarchar(10)  NOT NULL ,
	[�������]            varchar(24)  NOT NULL ,
	[���]                varchar(24)  NOT NULL ,
	[��������]           varchar(24)  NOT NULL ,
	[����_��������]      date  NOT NULL ,
	[��������#]          integer  NOT NULL 
)
go

CREATE TABLE [�������������_�����]
( 
	[�������#]           integer  NOT NULL 
)
go

CREATE TABLE [������_�������]
( 
	[�������#]           integer  NOT NULL ,
	[��������������_�������] nvarchar(300)  NULL 
)
go

CREATE TABLE [������_�������]
( 
	[�������#]           integer  NOT NULL ,
	[��������������_�����_�������] nvarchar(300)  NULL 
)
go

CREATE TABLE [��������]
( 
	[��������#]          integer  NOT NULL ,
	[�����_�_�����_��������] nvarchar(10)  NOT NULL ,
	[�������]            nvarchar(25)  NOT NULL ,
	[���]                nvarchar(25)  NOT NULL ,
	[��������]           nvarchar(25)  NOT NULL ,
	[����_��������]      date  NOT NULL ,
	[������#]            tinyint  NOT NULL ,
	[�����_��������]     nvarchar(18)  NOT NULL 
)
go

CREATE TABLE [������]
( 
	[������#]           integer  NOT NULL ,
	[����#]              integer  NOT NULL ,
	[������#]            integer  NOT NULL ,
	[����#]              integer  NOT NULL ,
	[����]               date  NOT NULL ,
	[�����]              Time  NOT NULL 
)
go

CREATE TABLE [�����������_��������]
( 
	[��������#]          integer  NOT NULL ,
	[��������#]          integer  NOT NULL ,
	[������_�����������] nvarchar(20)  NOT NULL ,
	[����������_������]  decimal()  NOT NULL 
)
go

CREATE TABLE [�����������_����_�������]
( 
	[��������#]          integer  NOT NULL ,
	[����_�������#]      integer  NOT NULL ,
	[������_�����������] nvarchar(20)  NOT NULL ,
	[����������_������]  decimal()  NOT NULL 
)
go

CREATE TABLE [�������_���������]
( 
	[�������#]           integer  NOT NULL ,
	[��������]           nvarchar(300)  NOT NULL ,
	[��������]           nvarchar(300)  NULL 
)
go

CREATE TABLE [����]
( 
	[����#]              integer  NOT NULL ,
	[��������_���]       char(6)  NOT NULL ,
	[����_���]           char(3)  NOT NULL ,
	[��������_�����������#] integer  NOT NULL ,
	[��������_����������#] integer  NOT NULL 
)
go

CREATE TABLE [������]
( 
	[������#]            tinyint  NOT NULL ,
	[������������]       nvarchar(29)  NOT NULL 
)
go

CREATE TABLE [����_�������]
( 
	[����_�������#]      integer  NOT NULL ,
	[�����_�_�����_��������] nvarchar(10)  NOT NULL ,
	[�������]            nvarchar(25)  NOT NULL ,
	[���]                nvarchar(25)  NOT NULL ,
	[��������]           nvarchar(25)  NOT NULL ,
	[����_��������]      date  NOT NULL ,
	[���������#]         tinyint  NOT NULL 
)
go

CREATE TABLE [������]
( 
	[����_�������#]      integer  NOT NULL ,
	[����#]              integer  NOT NULL ,
	[����_�����]         date  NOT NULL ,
	[�����_�����]        Time  NOT NULL 
)
go

CREATE TABLE [����_�����]
( 
	[����_�����#]       tinyint  NOT NULL ,
	[������������]       nvarchar(10)  NULL 
)
go

ALTER TABLE [������������]
	ADD CONSTRAINT [XPK������������] PRIMARY KEY  CLUSTERED ([����_���] ASC)
go

ALTER TABLE [��������]
	ADD CONSTRAINT [XPK��������] PRIMARY KEY  CLUSTERED ([��������#] ASC)
go

ALTER TABLE [�����]
	ADD CONSTRAINT [XPK�����] PRIMARY KEY  CLUSTERED ([��������#] ASC,[������#] ASC)
go

ALTER TABLE [����]
	ADD CONSTRAINT [XPK����] PRIMARY KEY  CLUSTERED ([����#] ASC)
go

ALTER TABLE [���������]
	ADD CONSTRAINT [XPK���������] PRIMARY KEY  CLUSTERED ([���������#] ASC)
go

ALTER TABLE [��������]
	ADD CONSTRAINT [XPK��������] PRIMARY KEY  CLUSTERED ([��������#] ASC)
go

ALTER TABLE [������]
	ADD CONSTRAINT [XPK������] PRIMARY KEY  CLUSTERED ([������#] ASC)
go

ALTER TABLE [��������_������]
	ADD CONSTRAINT [XPK��������_������] PRIMARY KEY  CLUSTERED ([������#] ASC)
go

ALTER TABLE [�������������_�����]
	ADD CONSTRAINT [XPK�������������_�����] PRIMARY KEY  CLUSTERED ([�������#] ASC)
go

ALTER TABLE [������_�������]
	ADD CONSTRAINT [XPK������_�������] PRIMARY KEY  CLUSTERED ([�������#] ASC)
go

ALTER TABLE [������_�������]
	ADD CONSTRAINT [XPK������_�������] PRIMARY KEY  CLUSTERED ([�������#] ASC)
go

ALTER TABLE [��������]
	ADD CONSTRAINT [XPK��������] PRIMARY KEY  CLUSTERED ([��������#] ASC)
go

ALTER TABLE [������]
	ADD CONSTRAINT [XPK������] PRIMARY KEY  CLUSTERED ([������#] ASC)
go

ALTER TABLE [�����������_��������]
	ADD CONSTRAINT [XPK�����������_��������] PRIMARY KEY  CLUSTERED ([��������#] ASC,[��������#] ASC)
go

ALTER TABLE [�����������_����_�������]
	ADD CONSTRAINT [XPK�����������_����_�������] PRIMARY KEY  CLUSTERED ([��������#] ASC,[����_�������#] ASC)
go

ALTER TABLE [�������_���������]
	ADD CONSTRAINT [XPK�������_���������] PRIMARY KEY  CLUSTERED ([�������#] ASC)
go

ALTER TABLE [����]
	ADD CONSTRAINT [XPK����] PRIMARY KEY  CLUSTERED ([����#] ASC)
go

ALTER TABLE [������]
	ADD CONSTRAINT [XPK������] PRIMARY KEY  CLUSTERED ([������#] ASC)
go

ALTER TABLE [����_�������]
	ADD CONSTRAINT [XPK����_�������] PRIMARY KEY  CLUSTERED ([����_�������#] ASC)
go

ALTER TABLE [������]
	ADD CONSTRAINT [XPK������] PRIMARY KEY  CLUSTERED ([����_�������#] ASC,[����#] ASC,[����_�����] ASC,[�����_�����] ASC)
go

ALTER TABLE [����_�����]
	ADD CONSTRAINT [XPK����_�����] PRIMARY KEY  CLUSTERED ([����_�����#] ASC)
go


ALTER TABLE [��������]
	ADD CONSTRAINT [R_45] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [�����]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([��������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [�����]
	ADD CONSTRAINT [R_44] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [����]
	ADD CONSTRAINT [R_46] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [����]
	ADD CONSTRAINT [R_52] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [��������]
	ADD CONSTRAINT [R_19] FOREIGN KEY ([����_�����#]) REFERENCES [����_�����]([����_�����#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [��������]
	ADD CONSTRAINT [R_48] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [��������]
	ADD CONSTRAINT [R_53] FOREIGN KEY ([�������#]) REFERENCES [�������_���������]([�������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [��������_������]
	ADD CONSTRAINT [R_51] FOREIGN KEY ([��������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [�������������_�����]
	ADD CONSTRAINT [R_39] FOREIGN KEY ([�������#]) REFERENCES [�������_���������]([�������#])
		ON DELETE RESTRICT
go


ALTER TABLE [������_�������]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([�������#]) REFERENCES [�������_���������]([�������#])
		ON DELETE RESTRICT
go


ALTER TABLE [������_�������]
	ADD CONSTRAINT [R_36] FOREIGN KEY ([�������#]) REFERENCES [�������_���������]([�������#])
		ON DELETE RESTRICT
go


ALTER TABLE [��������]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([������#]) REFERENCES [������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [������]
	ADD CONSTRAINT [R_41] FOREIGN KEY ([����#]) REFERENCES [����]([����#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [������]
	ADD CONSTRAINT [R_42] FOREIGN KEY ([����#]) REFERENCES [����]([����#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [������]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([������#]) REFERENCES [��������_������]([������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [�����������_��������]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([��������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [�����������_��������]
	ADD CONSTRAINT [R_49] FOREIGN KEY ([��������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [�����������_����_�������]
	ADD CONSTRAINT [R_27] FOREIGN KEY ([��������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [�����������_����_�������]
	ADD CONSTRAINT [R_50] FOREIGN KEY ([����_�������#]) REFERENCES [����_�������]([����_�������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [����]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([����_���]) REFERENCES [������������]([����_���])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [����]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([��������_����������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [����]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([��������_�����������#]) REFERENCES [��������]([��������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [����_�������]
	ADD CONSTRAINT [R_43] FOREIGN KEY ([���������#]) REFERENCES [���������]([���������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [������]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([����#]) REFERENCES [����]([����#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [������]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([����_�������#]) REFERENCES [����_�������]([����_�������#])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


CREATE TRIGGER tD_������������ ON ������������ FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ������������ */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ������������  ���� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000cf06", PARENT_OWNER="", PARENT_TABLE="������������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="����_���" */
    DELETE ����
      FROM ����,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.����_��� = deleted.����_���


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_������������ ON ������������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����_��� char(3),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ������������  ���� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017339", PARENT_OWNER="", PARENT_TABLE="������������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="����_���" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����_���)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����_��� = inserted.����_���
        FROM inserted
      UPDATE ����
      SET
        /*  %JoinFKPK(����,@ins," = ",",") */
        ����.����_��� = @ins����_���
      FROM ����,inserted,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.����_��� = deleted.����_���
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������������ update because more than one row has been affected.'
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




CREATE TRIGGER tD_�������� ON �������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on �������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ��������  ��������_������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00026c9d", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="��������_������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="��������#" */
    DELETE ��������_������
      FROM ��������_������,deleted
      WHERE
        /*  %JoinFKPK(��������_������,deleted," = "," AND") */
        ��������_������.��������# = deleted.��������#

    /* erwin Builtin Trigger */
    /* ��������  ���� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="��������_�����������#" */
    DELETE ����
      FROM ����,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.��������_�����������# = deleted.��������#

    /* erwin Builtin Trigger */
    /* ��������  ���� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="��������_����������#" */
    DELETE ����
      FROM ����,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.��������_����������# = deleted.��������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_�������� ON �������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �������� */
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
  /* ������  �������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0001604f", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������� because ������ does not exist.'
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


CREATE TRIGGER tU_�������� ON �������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ��������  ��������_������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00059232", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="��������_������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="��������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE ��������_������
      SET
        /*  %JoinFKPK(��������_������,@ins," = ",",") */
        ��������_������.��������# = @ins��������#
      FROM ��������_������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������_������,deleted," = "," AND") */
        ��������_������.��������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ���� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="��������_�����������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE ����
      SET
        /*  %JoinFKPK(����,@ins," = ",",") */
        ����.��������_�����������# = @ins��������#
      FROM ����,inserted,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.��������_�����������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ���� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="��������_����������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE ����
      SET
        /*  %JoinFKPK(����,@ins," = ",",") */
        ����.��������_����������# = @ins��������#
      FROM ����,inserted,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.��������_����������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������� because ������ does not exist.'
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




CREATE TRIGGER tI_����� ON ����� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ����� */
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
  /* ������  ����� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00029628", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ����� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ����� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ����� because �������� does not exist.'
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


CREATE TRIGGER tU_����� ON ����� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ����� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer, 
           @ins������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ������  ����� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002963d", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ����� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ����� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ����� because �������� does not exist.'
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




CREATE TRIGGER tD_���� ON ���� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ���� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ����  ������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00017a9b", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="����#" */
    DELETE ������
      FROM ������,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#

    /* erwin Builtin Trigger */
    /* ����  ������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="����#" */
    DELETE ������
      FROM ������,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_���� ON ���� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ���� */
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
  /* ������  ���� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00029f1e", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ���� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  ���� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ���� because ������ does not exist.'
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


CREATE TRIGGER tU_���� ON ���� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ���� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����  ������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00050f34", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="����#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����# = inserted.����#
        FROM inserted
      UPDATE ������
      SET
        /*  %JoinFKPK(������,@ins," = ",",") */
        ������.����# = @ins����#
      FROM ������,inserted,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ���� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="����#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����# = inserted.����#
        FROM inserted
      UPDATE ������
      SET
        /*  %JoinFKPK(������,@ins," = ",",") */
        ������.����# = @ins����#
      FROM ������,inserted,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ���� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  ���� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ���� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  ���� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ���� because ������ does not exist.'
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




CREATE TRIGGER tD_��������� ON ��������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ��������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ���������  ����_������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000f0ee", PARENT_OWNER="", PARENT_TABLE="���������"
    CHILD_OWNER="", CHILD_TABLE="����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="���������#" */
    DELETE ����_�������
      FROM ����_�������,deleted
      WHERE
        /*  %JoinFKPK(����_�������,deleted," = "," AND") */
        ����_�������.���������# = deleted.���������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_��������� ON ��������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ��������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins���������# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ���������  ����_������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00019a8f", PARENT_OWNER="", PARENT_TABLE="���������"
    CHILD_OWNER="", CHILD_TABLE="����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="���������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(���������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins���������# = inserted.���������#
        FROM inserted
      UPDATE ����_�������
      SET
        /*  %JoinFKPK(����_�������,@ins," = ",",") */
        ����_�������.���������# = @ins���������#
      FROM ����_�������,inserted,deleted
      WHERE
        /*  %JoinFKPK(����_�������,deleted," = "," AND") */
        ����_�������.���������# = deleted.���������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ��������� update because more than one row has been affected.'
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




CREATE TRIGGER tD_�������� ON �������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on �������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ��������  �����������_����_������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001d696", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="��������#" */
    DELETE �����������_����_�������
      FROM �����������_����_�������,deleted
      WHERE
        /*  %JoinFKPK(�����������_����_�������,deleted," = "," AND") */
        �����������_����_�������.��������# = deleted.��������#

    /* erwin Builtin Trigger */
    /* ��������  �����������_�������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="��������#" */
    DELETE �����������_��������
      FROM �����������_��������,deleted
      WHERE
        /*  %JoinFKPK(�����������_��������,deleted," = "," AND") */
        �����������_��������.��������# = deleted.��������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_�������� ON �������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �������� */
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
  /* �������_���������  �������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000409c8", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������� because �������_��������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����_�����  �������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����_�����"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="����_�����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�����
        WHERE
          /* %JoinFKPK(inserted,����_�����) */
          inserted.����_�����# = ����_�����.����_�����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������� because ����_����� does not exist.'
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


CREATE TRIGGER tU_�������� ON �������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ��������  �����������_����_������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000744bf", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="��������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE �����������_����_�������
      SET
        /*  %JoinFKPK(�����������_����_�������,@ins," = ",",") */
        �����������_����_�������.��������# = @ins��������#
      FROM �����������_����_�������,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����������_����_�������,deleted," = "," AND") */
        �����������_����_�������.��������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  �����������_�������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="��������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE �����������_��������
      SET
        /*  %JoinFKPK(�����������_��������,@ins," = ",",") */
        �����������_��������.��������# = @ins��������#
      FROM �����������_��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����������_��������,deleted," = "," AND") */
        �����������_��������.��������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* �������_���������  �������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������� because �������_��������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������� because ������ does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����_�����  �������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����_�����"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="����_�����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�����
        WHERE
          /* %JoinFKPK(inserted,����_�����) */
          inserted.����_�����# = ����_�����.����_�����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������� because ����_����� does not exist.'
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




CREATE TRIGGER tD_������ ON ������ FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ������ */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ������  ���� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000dc50", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="������#" */
    DELETE ����
      FROM ����,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.������# = deleted.������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_������ ON ������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ������  ���� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017471", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ����
      SET
        /*  %JoinFKPK(����,@ins," = ",",") */
        ����.������# = @ins������#
      FROM ����,inserted,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
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




CREATE TRIGGER tD_��������_������ ON ��������_������ FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ��������_������ */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ��������_������  ������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000d4ae", PARENT_OWNER="", PARENT_TABLE="��������_������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="������#" */
    DELETE ������
      FROM ������,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.������# = deleted.������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_��������_������ ON ��������_������ FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ��������_������ */
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
  /* ��������  ��������_������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000165d5", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="��������_������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ��������_������ because �������� does not exist.'
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


CREATE TRIGGER tU_��������_������ ON ��������_������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ��������_������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ��������_������  ������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0002d2de", PARENT_OWNER="", PARENT_TABLE="��������_������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ������
      SET
        /*  %JoinFKPK(������,@ins," = ",",") */
        ������.������# = @ins������#
      FROM ������,inserted,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ��������_������ update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ��������_������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="��������_������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ��������_������ because �������� does not exist.'
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




CREATE TRIGGER tI_�������������_����� ON �������������_����� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �������������_����� */
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
  /* �������_���������  �������������_����� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00019310", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="�������������_�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������������_����� because �������_��������� does not exist.'
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


CREATE TRIGGER tU_�������������_����� ON �������������_����� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �������������_����� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* �������_���������  �������������_����� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00019188", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="�������������_�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������������_����� because �������_��������� does not exist.'
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




CREATE TRIGGER tI_������_������� ON ������_������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ������_������� */
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
  /* �������_���������  ������_������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000185d6", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������_������� because �������_��������� does not exist.'
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


CREATE TRIGGER tU_������_������� ON ������_������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������_������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* �������_���������  ������_������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00017ee4", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������_������� because �������_��������� does not exist.'
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




CREATE TRIGGER tI_������_������� ON ������_������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ������_������� */
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
  /* �������_���������  ������_������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00018569", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������_������� because �������_��������� does not exist.'
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


CREATE TRIGGER tU_������_������� ON ������_������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������_������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* �������_���������  ������_������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001860a", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,�������_���������
        WHERE
          /* %JoinFKPK(inserted,�������_���������) */
          inserted.�������# = �������_���������.�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������_������� because �������_��������� does not exist.'
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




CREATE TRIGGER tD_�������� ON �������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on �������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ��������  �����������_�������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001b6e9", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="��������#" */
    DELETE �����������_��������
      FROM �����������_��������,deleted
      WHERE
        /*  %JoinFKPK(�����������_��������,deleted," = "," AND") */
        �����������_��������.��������# = deleted.��������#

    /* erwin Builtin Trigger */
    /* ��������  ����� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="��������#" */
    DELETE �����
      FROM �����,deleted
      WHERE
        /*  %JoinFKPK(�����,deleted," = "," AND") */
        �����.��������# = deleted.��������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_�������� ON �������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �������� */
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
  /* ������  �������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00016462", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �������� because ������ does not exist.'
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


CREATE TRIGGER tU_�������� ON �������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ��������  �����������_�������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00042836", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="��������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE �����������_��������
      SET
        /*  %JoinFKPK(�����������_��������,@ins," = ",",") */
        �����������_��������.��������# = @ins��������#
      FROM �����������_��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����������_��������,deleted," = "," AND") */
        �����������_��������.��������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ����� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="��������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins��������# = inserted.��������#
        FROM inserted
      UPDATE �����
      SET
        /*  %JoinFKPK(�����,@ins," = ",",") */
        �����.��������# = @ins��������#
      FROM �����,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����,deleted," = "," AND") */
        �����.��������# = deleted.��������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������
        WHERE
          /* %JoinFKPK(inserted,������) */
          inserted.������# = ������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �������� because ������ does not exist.'
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




CREATE TRIGGER tD_������ ON ������ FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ������ */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ������  �������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000194e2", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="������#" */
    DELETE ��������
      FROM ��������,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#

    /* erwin Builtin Trigger */
    /* ������  ����� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="������#" */
    DELETE �����
      FROM �����,deleted
      WHERE
        /*  %JoinFKPK(�����,deleted," = "," AND") */
        �����.������# = deleted.������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_������ ON ������ FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ������ */
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
  /* ����  ������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0003c646", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������ because ���� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������ because ���� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������_������  ������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������_������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������_������
        WHERE
          /* %JoinFKPK(inserted,��������_������) */
          inserted.������# = ��������_������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������ because ��������_������ does not exist.'
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


CREATE TRIGGER tU_������ ON ������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ������  �������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0006589b", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ��������
      SET
        /*  %JoinFKPK(��������,@ins," = ",",") */
        ��������.������# = @ins������#
      FROM ��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  ����� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE �����
      SET
        /*  %JoinFKPK(�����,@ins," = ",",") */
        �����.������# = @ins������#
      FROM �����,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����,deleted," = "," AND") */
        �����.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������ because ���� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_41", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������ because ���� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������_������  ������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������_������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������_������
        WHERE
          /* %JoinFKPK(inserted,��������_������) */
          inserted.������# = ��������_������.������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������ because ��������_������ does not exist.'
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




CREATE TRIGGER tI_�����������_�������� ON �����������_�������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �����������_�������� */
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
  /* ��������  �����������_�������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002cddc", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �����������_�������� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  �����������_�������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �����������_�������� because �������� does not exist.'
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


CREATE TRIGGER tU_�����������_�������� ON �����������_�������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �����������_�������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer, 
           @ins��������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ��������  �����������_�������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002e23b", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �����������_�������� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  �����������_�������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �����������_�������� because �������� does not exist.'
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




CREATE TRIGGER tI_�����������_����_������� ON �����������_����_������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on �����������_����_������� */
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
  /* ����_�������  �����������_����_������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002e74f", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="����_�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�������
        WHERE
          /* %JoinFKPK(inserted,����_�������) */
          inserted.����_�������# = ����_�������.����_�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �����������_����_������� because ����_������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  �����������_����_������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert �����������_����_������� because �������� does not exist.'
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


CREATE TRIGGER tU_�����������_����_������� ON �����������_����_������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �����������_����_������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins��������# integer, 
           @ins����_�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����_�������  �����������_����_������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002fced", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="����_�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�������
        WHERE
          /* %JoinFKPK(inserted,����_�������) */
          inserted.����_�������# = ����_�������.����_�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �����������_����_������� because ����_������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  �����������_����_������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="��������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update �����������_����_������� because �������� does not exist.'
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




CREATE TRIGGER tD_�������_��������� ON �������_��������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on �������_��������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* �������_���������  �������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00040292", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="�������#" */
    DELETE ��������
      FROM ��������,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.�������# = deleted.�������#

    /* erwin Builtin Trigger */
    /* �������_���������  �������������_����� on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="�������������_�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="�������#" */
    IF EXISTS (
      SELECT * FROM deleted,�������������_�����
      WHERE
        /*  %JoinFKPK(�������������_�����,deleted," = "," AND") */
        �������������_�����.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete �������_��������� because �������������_����� exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* �������_���������  ������_������� on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="�������#" */
    IF EXISTS (
      SELECT * FROM deleted,������_�������
      WHERE
        /*  %JoinFKPK(������_�������,deleted," = "," AND") */
        ������_�������.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete �������_��������� because ������_������� exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* �������_���������  ������_������� on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="�������#" */
    IF EXISTS (
      SELECT * FROM deleted,������_�������
      WHERE
        /*  %JoinFKPK(������_�������,deleted," = "," AND") */
        ������_�������.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete �������_��������� because ������_������� exists.'
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


CREATE TRIGGER tU_�������_��������� ON �������_��������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on �������_��������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* �������_���������  �������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00050d86", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins�������# = inserted.�������#
        FROM inserted
      UPDATE ��������
      SET
        /*  %JoinFKPK(��������,@ins," = ",",") */
        ��������.�������# = @ins�������#
      FROM ��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.�������# = deleted.�������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade �������_��������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* �������_���������  �������������_����� on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="�������������_�����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,�������������_�����
      WHERE
        /*  %JoinFKPK(�������������_�����,deleted," = "," AND") */
        �������������_�����.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update �������_��������� because �������������_����� exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* �������_���������  ������_������� on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,������_�������
      WHERE
        /*  %JoinFKPK(������_�������,deleted," = "," AND") */
        ������_�������.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update �������_��������� because ������_������� exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* �������_���������  ������_������� on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="�������_���������"
    CHILD_OWNER="", CHILD_TABLE="������_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(�������#)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,������_�������
      WHERE
        /*  %JoinFKPK(������_�������,deleted," = "," AND") */
        ������_�������.�������# = deleted.�������#
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update �������_��������� because ������_������� exists.'
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




CREATE TRIGGER tD_���� ON ���� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ���� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ����  ������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000cf52", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="����#" */
    DELETE ������
      FROM ������,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_���� ON ���� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ���� */
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
  /* ��������  ���� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0004033c", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="��������_�����������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������_�����������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������_�����������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ���� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ���� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="��������_����������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������_����������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������_����������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ���� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������������  ���� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="����_���" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_���)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������������
        WHERE
          /* %JoinFKPK(inserted,������������) */
          inserted.����_��� = ������������.����_���
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ���� because ������������ does not exist.'
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


CREATE TRIGGER tU_���� ON ���� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ���� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����  ������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00055bb0", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="����#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����# = inserted.����#
        FROM inserted
      UPDATE ������
      SET
        /*  %JoinFKPK(������,@ins," = ",",") */
        ������.����# = @ins����#
      FROM ������,inserted,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����# = deleted.����#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ���� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ���� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="��������_�����������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������_�����������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������_�����������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ���� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ��������  ���� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="��������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="��������_����������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(��������_����������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,��������
        WHERE
          /* %JoinFKPK(inserted,��������) */
          inserted.��������_����������# = ��������.��������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ���� because �������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������������  ���� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="����_���" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_���)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,������������
        WHERE
          /* %JoinFKPK(inserted,������������) */
          inserted.����_��� = ������������.����_���
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ���� because ������������ does not exist.'
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




CREATE TRIGGER tD_������ ON ������ FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ������ */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ������  ���� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00024ef9", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="������#" */
    DELETE ����
      FROM ����,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.������# = deleted.������#

    /* erwin Builtin Trigger */
    /* ������  �������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="������#" */
    DELETE ��������
      FROM ��������,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#

    /* erwin Builtin Trigger */
    /* ������  �������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="������#" */
    DELETE ��������
      FROM ��������,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_������ ON ������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins������# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ������  ���� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00040724", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="����"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_46", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ����
      SET
        /*  %JoinFKPK(����,@ins," = ",",") */
        ����.������# = @ins������#
      FROM ����,inserted,deleted
      WHERE
        /*  %JoinFKPK(����,deleted," = "," AND") */
        ����.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ��������
      SET
        /*  %JoinFKPK(��������,@ins," = ",",") */
        ��������.������# = @ins������#
      FROM ��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ������  �������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="������"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins������# = inserted.������#
        FROM inserted
      UPDATE ��������
      SET
        /*  %JoinFKPK(��������,@ins," = ",",") */
        ��������.������# = @ins������#
      FROM ��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.������# = deleted.������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ������ update because more than one row has been affected.'
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




CREATE TRIGGER tD_����_������� ON ����_������� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ����_������� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ����_�������  �����������_����_������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001d61f", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="����_�������#" */
    DELETE �����������_����_�������
      FROM �����������_����_�������,deleted
      WHERE
        /*  %JoinFKPK(�����������_����_�������,deleted," = "," AND") */
        �����������_����_�������.����_�������# = deleted.����_�������#

    /* erwin Builtin Trigger */
    /* ����_�������  ������ on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="����_�������#" */
    DELETE ������
      FROM ������,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����_�������# = deleted.����_�������#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tI_����_������� ON ����_������� FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ����_������� */
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
  /* ���������  ����_������� on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="000180dd", PARENT_OWNER="", PARENT_TABLE="���������"
    CHILD_OWNER="", CHILD_TABLE="����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="���������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(���������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,���������
        WHERE
          /* %JoinFKPK(inserted,���������) */
          inserted.���������# = ���������.���������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ����_������� because ��������� does not exist.'
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


CREATE TRIGGER tU_����_������� ON ����_������� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ����_������� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����_�������# integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����_�������  �����������_����_������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00048c0e", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="�����������_����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="����_�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����_�������# = inserted.����_�������#
        FROM inserted
      UPDATE �����������_����_�������
      SET
        /*  %JoinFKPK(�����������_����_�������,@ins," = ",",") */
        �����������_����_�������.����_�������# = @ins����_�������#
      FROM �����������_����_�������,inserted,deleted
      WHERE
        /*  %JoinFKPK(�����������_����_�������,deleted," = "," AND") */
        �����������_����_�������.����_�������# = deleted.����_�������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ����_������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����_�������  ������ on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="����_�������#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����_�������# = inserted.����_�������#
        FROM inserted
      UPDATE ������
      SET
        /*  %JoinFKPK(������,@ins," = ",",") */
        ������.����_�������# = @ins����_�������#
      FROM ������,inserted,deleted
      WHERE
        /*  %JoinFKPK(������,deleted," = "," AND") */
        ������.����_�������# = deleted.����_�������#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ����_������� update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ���������  ����_������� on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="���������"
    CHILD_OWNER="", CHILD_TABLE="����_�������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="���������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(���������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,���������
        WHERE
          /* %JoinFKPK(inserted,���������) */
          inserted.���������# = ���������.���������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ����_������� because ��������� does not exist.'
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




CREATE TRIGGER tI_������ ON ������ FOR INSERT AS
/* erwin Builtin Trigger */
/* INSERT trigger on ������ */
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
  /* ����_�������  ������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="0002aaba", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="����_�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�������
        WHERE
          /* %JoinFKPK(inserted,����_�������) */
          inserted.����_�������# = ����_�������.����_�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������ because ����_������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on child insert restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," and") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30002,
             @errmsg = 'Cannot insert ������ because ���� does not exist.'
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


CREATE TRIGGER tU_������ ON ������ FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ������ */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����_�������# integer, 
           @ins����# integer, 
           @ins����_����� date, 
           @ins�����_����� Time,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����_�������  ������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002bb82", PARENT_OWNER="", PARENT_TABLE="����_�������"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="����_�������#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����_�������#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����_�������
        WHERE
          /* %JoinFKPK(inserted,����_�������) */
          inserted.����_�������# = ����_�������.����_�������#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������ because ����_������� does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* ����  ������ on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="����"
    CHILD_OWNER="", CHILD_TABLE="������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="����#" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(����#)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,����
        WHERE
          /* %JoinFKPK(inserted,����) */
          inserted.����# = ����.����#
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update ������ because ���� does not exist.'
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




CREATE TRIGGER tD_����_����� ON ����_����� FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ����_����� */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ����_�����  �������� on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000eabb", PARENT_OWNER="", PARENT_TABLE="����_�����"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="����_�����#" */
    DELETE ��������
      FROM ��������,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.����_�����# = deleted.����_�����#


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_����_����� ON ����_����� FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ����_����� */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @ins����_�����# tinyint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ����_�����  �������� on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0001885d", PARENT_OWNER="", PARENT_TABLE="����_�����"
    CHILD_OWNER="", CHILD_TABLE="��������"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="����_�����#" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(����_�����#)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @ins����_�����# = inserted.����_�����#
        FROM inserted
      UPDATE ��������
      SET
        /*  %JoinFKPK(��������,@ins," = ",",") */
        ��������.����_�����# = @ins����_�����#
      FROM ��������,inserted,deleted
      WHERE
        /*  %JoinFKPK(��������,deleted," = "," AND") */
        ��������.����_�����# = deleted.����_�����#
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade ����_����� update because more than one row has been affected.'
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


