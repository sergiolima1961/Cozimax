unit uDM_testePratico;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TDM_testepratico = class(TDataModule)
    FD_SQLlocal: TFDConnection;
    FvCliente: TFDQuery;
    FvProduto: TFDQuery;
    FvClienteCodigo: TFDAutoIncField;
    FvProdutoCodigo: TFDAutoIncField;
    FvProdutoProduto: TStringField;
    FvProdutoValor: TFMTBCDField;
    FtCliente: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField22: TStringField;
    FvClienteNome: TStringField;
    FtProduto: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    StringField23: TStringField;
    FMTBCDField1: TFMTBCDField;
    FvPedido: TFDQuery;
    FvPedidoPEDIDO: TFDAutoIncField;
    FvPedidoID_CLIENTE: TIntegerField;
    FvPedidoNOMECLIENTE: TStringField;
    FvPedidoVALORPEDIDO: TFMTBCDField;
    FvPedidoDATAPEDIDO: TSQLTimeStampField;
    FtPedido: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FMTBCDField2: TFMTBCDField;
    SQLTimeStampField2: TSQLTimeStampField;
    FvItemPedido: TFDQuery;
    FvItemPedidoCODIGO: TFDAutoIncField;
    FvItemPedidoPEDIDO: TIntegerField;
    FvItemPedidoID_PRODUTO: TIntegerField;
    FvItemPedidoDescrição: TStringField;
    FvItemPedidoQtd: TIntegerField;
    FvItemPedidoUnitario: TBCDField;
    FvItemPedidoTotal: TFMTBCDField;
    FtItemPedido: TFDQuery;
    FDAutoIncField4: TFDAutoIncField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField2: TStringField;
    IntegerField5: TIntegerField;
    BCDField1: TBCDField;
    FMTBCDField3: TFMTBCDField;
    FfPedido: TFDQuery;
    FfPedidoPedido: TFDAutoIncField;
    FfPedidoDataPedido: TStringField;
    FfPedidoValorPedido: TFMTBCDField;
    FfPedidoCliente: TStringField;
    procedure FDDetalheDoPedidoAfterPost(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterCancel(DataSet: TDataSet);
    procedure FDDetalheDoPedidoAfterDelete(DataSet: TDataSet);
    procedure FvPedidoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function verifica_produto(idPed, IdPro: integer): boolean;
  end;

var
  DM_testepratico: TDM_testepratico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses CadCliente, Main,
  InscricaoFiscal;

{$R *.dfm}

procedure TDM_testepratico.FDDetalheDoPedidoAfterCancel(DataSet: TDataSet);
begin

  FvPedido.Close;
  FvPedido.open;
  FvPedido.Filtered := true;
  FvPedido.Filtered := false;

end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterDelete(DataSet: TDataSet);
begin
  FvPedido.Close;
  FvPedido.open;
  FvPedido.Filtered := true;
  FvPedido.Filtered := false;
end;

procedure TDM_testepratico.FDDetalheDoPedidoAfterPost(DataSet: TDataSet);
begin
  FvPedido.Close;
  FvPedido.open;
end;

procedure TDM_testepratico.FvPedidoAfterScroll(DataSet: TDataSet);
begin
  FvItemPedido.Close;
  FvItemPedido.Params.ParamByName('ACAO').Value := 'C';
  FvItemPedido.Params.ParamByName('IDIT').Clear;
  FvItemPedido.Params.ParamByName('IDPE').Value := FvPedidoPEDIDO.Value;
  FvItemPedido.Params.ParamByName('IDPR').Clear;
  FvItemPedido.Params.ParamByName('QTD').Clear;
  FvItemPedido.Params.ParamByName('UNT').Clear;
  FvItemPedido.Params.ParamByName('TOT').Clear;
  FvItemPedido.Params.ParamByName('RET').Clear;
  FvItemPedido.ExecSQL;
  FvItemPedido.open;

end;

function TDM_testepratico.verifica_produto(idPed, IdPro: integer): boolean;
var
  qPesquisa: TFDQuery;
begin
  qPesquisa := TFDQuery.create(nil);
  qPesquisa.Connection := FD_SQLlocal;

  with qPesquisa, qPesquisa.SQL do
  begin
    qPesquisa.Close;
    qPesquisa.SQL.Text := '' + 'DECLARE @ID_PEDIDO  INT = :ped, ' +
      '        @ID_PRODUTO INT = :pro ' + '' +
      'SELECT CONVERT(BIT, IIF (EXISTS(SELECT 1 ' +
      '                                FROM   ITEM_PEDIDO IPE ' +
      '                                WHERE  IPE.ID_PEDIDO = @ID_PEDIDO ' +
      '                                       AND IPE.ID_PRODUTO = @ID_PRODUTO), 1, 0)) Tem';

    qPesquisa.Params.ParamByName('ped').Value := idPed;
    qPesquisa.Params.ParamByName('pro').Value := IdPro;
    qPesquisa.open;

    Result := qPesquisa.FieldByName('tem').AsBoolean;

    FreeAndNil(qPesquisa);
  end;

end;

end.
