USE [Cozimax]
GO
/****** Object:  Trigger [dbo].[TGR_VENDAS_AD]    Script Date: 14/01/2021 16:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[TGR_VENDAS_AD]
ON [dbo].[ITEM_PEDIDO]
FOR DELETE
AS
  BEGIN
      DECLARE @VALOR DECIMAL(10, 2),
              @ID    INT

      SELECT @ID = D.ID_PEDIDO
             ,@VALOR = D.VLR_ITEM_PEDIDO_TOTAL
      FROM   DELETED D

      UPDATE PEDIDO
      SET    VLR_PEDIDO -=  isnull(@VALOR,0)  
      WHERE  ID_PEDIDO = @ID
	  
  END

