USE [Cozimax]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CLIENTE]    Script Date: 14/01/2021 15:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_IAEC_CLIENTE](@ACAO         CHAR(1)='C'
                                ,@ID_CLIENTE  INT
                                ,@DSC_CLIENTE VARCHAR(150)
                                ,@ID_RETORN   INT  )
AS
  BEGIN
      DECLARE @PESQUISA VARCHAR(150)=''

      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      SET @ID_RETORN = @ID_CLIENTE;

      IF @ACAO = 'I'
        BEGIN
            INSERT CLIENTE
                   (DSC_CLIENTE)
            VALUES(@DSC_CLIENTE );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE CLIENTE
            SET    DSC_CLIENTE = @DSC_CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_CLIENTE [Codigo]
                   ,CONVERT(varchar(100),  DSC_CLIENTE ) [Nome]
            FROM   CLIENTE CLIENTE (NOLOCK)
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_CLIENTE
            SET @PESQUISA += '%'

            SELECT ID_CLIENTE [Codigo]
                   ,CONVERT(varchar(100),  DSC_CLIENTE ) [Nome]
            FROM   CLIENTE (NOLOCK)
            WHERE  DSC_CLIENTE LIKE @PESQUISA
        END
  END

