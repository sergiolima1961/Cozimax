USE [Cozimax]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PRODUTO]    Script Date: 14/01/2021 15:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_IAEC_PRODUTO] (@ACAO         CHAR(1)='C'
                                  ,@ID_PRODUTO  INT
                                  ,@DSC_PRODUTO VARCHAR(150)
                                  ,@VLR_PRODUTO DECIMAL(18, 2)
                                  ,@ID_RETORN   INT)
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PRODUTO
                   (DSC_PRODUTO
                    ,VLR_PRODUTO)
            VALUES(@DSC_PRODUTO
                   ,@VLR_PRODUTO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PRODUTO
            SET    DSC_PRODUTO = @DSC_PRODUTO
                   ,VLR_PRODUTO = @VLR_PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(30), DSC_PRODUTO ) [Produto]
                   ,VLR_PRODUTO [Valor]
            FROM   PRODUTO (NOLOCK)
			ORDER BY  2
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_PRODUTO
            SET @PESQUISA += '%'

            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(50), DSC_PRODUTO ) [Produto]
            FROM   PRODUTO (NOLOCK)
            WHERE  DSC_PRODUTO LIKE @PESQUISA
			ORDER BY  2
        END
  END

