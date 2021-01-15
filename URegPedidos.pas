unit URegPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFRegPedidos = class(TForm)
    DSPEDIDOS: TDataSource;
    dsCliente: TDataSource;
    DSProdutos: TDataSource;
    dsItemPedido: TDataSource;
    Panel7: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText3: TDBText;
    DBText5: TDBText;
    DBEdit1: TDBEdit;
    dblCliente: TDBLookupComboBox;
    Panel3: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    pnlCustoItem: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    pnl_item: TPanel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLCBProduto: TDBLookupComboBox;
    BtFechar: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Label5: TLabel;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    DBText2: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPEDIDOSDataChange(Sender: TObject; Field: TField);
    procedure DBLCBProdutoExit(Sender: TObject);
    procedure PG_RegPedidosChange(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
    procedure dblClienteExit(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegPedidos: TFRegPedidos;

implementation

{$R *.dfm}

uses
  Main,
  uDM_testePratico, ubusca;

procedure TFRegPedidos.Button10Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do Item?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    Button7.Enabled := true;
    Button10.Enabled := (Button7.Enabled);
    Button8.Enabled := not(Button7.Enabled);
    Button8Click(Self);
  end;
end;

procedure TFRegPedidos.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  pnlCustoItem.Enabled := (Button1.Enabled);

  DM_testepratico.FvPedido.Append;
  DM_testepratico.FvPedido.FieldByName('DATA PEDIDO').value := now;
  dblCliente.SetFocus;

end;

procedure TFRegPedidos.Button2Click(Sender: TObject);
begin
  DM_testepratico.FvPedido.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  pnlCustoItem.Enabled := (Button1.Enabled);
end;

procedure TFRegPedidos.Button3Click(Sender: TObject);
Var
  pacao: string;
begin
  try

    with DM_testepratico do
    begin

      if dblCliente.KeyValue = Null then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Selecione o Cliente.');
        dblCliente.SetFocus;
        exit;
      end;

      pacao := 'E';

      IF FvPedido.State = dsInsert THEN
        pacao := 'I';
      IF FvPedido.State = dsEdit then
        pacao := 'A';

      DM_testepratico.FtPedido.CLOSE;
      DM_testepratico.FtPedido.Params.ParamByName('ACAO').value := pacao;
      DM_testepratico.FtPedido.Params.ParamByName('PED').value :=
        DM_testepratico.FvPedido.FieldByName('PEDIDO').value;
      DM_testepratico.FtPedido.Params.ParamByName('CLI').value :=
        DM_testepratico.FvPedido.FieldByName('ID_CLIENTE').value;
      DM_testepratico.FtPedido.ExecSQL;

      FvPedido.Cancel;
      FvPedido.CLOSE;
      FvPedido.Open;
    end;
    Button1.Enabled := true;
    Button4.Enabled := (Button1.Enabled);
    Button5.Enabled := (Button1.Enabled);
    Button3.Enabled := not(Button1.Enabled);
    Button2.Enabled := not(Button1.Enabled);
    BtFechar.Enabled := (Button1.Enabled);
    pnlCustoItem.Enabled := (Button1.Enabled);

  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFRegPedidos.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  BtFechar.Enabled := (Button1.Enabled);
  pnlCustoItem.Enabled := (Button1.Enabled);
  DM_testepratico.FvPedido.Edit;
  dblCliente.SetFocus;
end;

procedure TFRegPedidos.Button5Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do Pedido ?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    DM_testepratico.FvItemPedido.CLOSE;
    Button3Click(Self);
    DM_testepratico.FvItemPedido.Open;
  end;
end;

procedure TFRegPedidos.Button6Click(Sender: TObject);
begin

  DM_testepratico.FvItemPedido.Append;

  Button6.Enabled := false;
  Button10.Enabled := (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);

end;

procedure TFRegPedidos.Button7Click(Sender: TObject);
begin
  DM_testepratico.FvItemPedido.Cancel;
  Button6.Enabled := true;
  Button10.Enabled := (Button6.Enabled);
  Button7.Enabled := not(Button6.Enabled);
  Button8.Enabled := not(Button6.Enabled);

end;

procedure TFRegPedidos.Button8Click(Sender: TObject);
var
  VACAO: string;

begin
  try

    VACAO := 'E';
    IF DM_testepratico.FvItemPedido.State = dsInsert THEN
      VACAO := 'I';

    if (DM_testepratico.FvItemPedido.FieldByName('Qtd').value = 0) or
      (DM_testepratico.FvItemPedido.FieldByName('Qtd').IsNull) then
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, Informe a Quantidade.');
      DBEdit3.SetFocus;
      exit;
    end;
    //
    if (DM_testepratico.FvItemPedido.FieldByName('Unitario').value = 0) or
      (DM_testepratico.FvItemPedido.FieldByName('Unitario').IsNull) then
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, Informe a Valor Unitario.');
      DBEdit2.SetFocus;
      exit;
    end;
    //
    if (DM_testepratico.FvItemPedido.FieldByName('ID_PRODUTO').value = 0) or
      (DM_testepratico.FvItemPedido.FieldByName('ID_PRODUTO').IsNull) then
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, Informe a Codigo do Produto.');
      DBLCBProduto.SetFocus;
      exit;
    end;
    //
    if VACAO = 'I' then
    Begin
      if DM_testepratico.verifica_produto(DM_testepratico.FvPedidoPEDIDO.value,
        DM_testepratico.FvItemPedido.FieldByName('ID_PRODUTO').value) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Produto ja informado, Verifique.');
        DBLCBProduto.SetFocus;
        exit;
      end;
    End;

    DBGrid1.Tag := DM_testepratico.FvPedidoPEDIDO.value;

    DM_testepratico.FtItemPedido.CLOSE;
    DM_testepratico.FtItemPedido.Params.ParamByName('ACAO').value := VACAO;
    DM_testepratico.FtItemPedido.Params.ParamByName('IDIT').value :=
      DM_testepratico.FvItemPedido.FieldByName('CODIGO').value;
    DM_testepratico.FtItemPedido.Params.ParamByName('IDPE').value :=
      DM_testepratico.FvPedidoPEDIDO.value;
    DM_testepratico.FtItemPedido.Params.ParamByName('IDPR').value :=
      DM_testepratico.FvItemPedido.FieldByName('ID_PRODUTO').value;
    DM_testepratico.FtItemPedido.Params.ParamByName('QTD').value :=
      DM_testepratico.FvItemPedido.FieldByName('Qtd').value;
    DM_testepratico.FtItemPedido.Params.ParamByName('UNT').value :=
      DM_testepratico.FvItemPedido.FieldByName('Unitario').value;
    DM_testepratico.FtItemPedido.ExecSQL;
    //
    DM_testepratico.FvItemPedido.Cancel;
    DM_testepratico.FvItemPedido.CLOSE;
    DM_testepratico.FvItemPedido.Open;
    //
    DM_testepratico.FvPedido.CLOSE;
    DM_testepratico.FvPedido.Open;
    DM_testepratico.FvPedido.Locate('PEDIDO', DBGrid1.Tag, []);
    //
    Button6.Enabled := true;
    Button10.Enabled := (Button6.Enabled);
    Button7.Enabled := not(Button6.Enabled);
    Button8.Enabled := not(Button6.Enabled);
  except
    On E: Exception do
    begin
      ShowMessage('Ocorreu um erro.' + #13 +
        'Por favor, entre em contato com o administrador do sistema.');
    end;
  end;

end;

procedure TFRegPedidos.BtFecharClick(Sender: TObject);
var
  FB: TForm;
begin
  FB := TFBusca.Create(Application);
  FB.ShowModal;
  FreeAndNil(FB);
end;

procedure TFRegPedidos.DBLCBProdutoExit(Sender: TObject);
begin

  DM_testepratico.FvItemPedidoUnitario.AsCurrency :=
    DM_testepratico.FvProdutoValor.AsCurrency;
end;

procedure TFRegPedidos.dblClienteExit(Sender: TObject);
begin
  DM_testepratico.FvPedidoNOMECLIENTE.value :=
    DM_testepratico.FvCliente.FieldByName('nome').value;
end;

procedure TFRegPedidos.DSPEDIDOSDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FvPedido.RecNo) + '/' +
    FormatFloat('0###', DM_testepratico.FvPedido.RecordCount);
end;

procedure TFRegPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FvProduto.CLOSE;
  DM_testepratico.FvCliente.CLOSE;
  DM_testepratico.FvPedido.CLOSE;
  DM_testepratico.FvItemPedido.CLOSE;
end;

procedure TFRegPedidos.FormCreate(Sender: TObject);
begin
  DM_testepratico.FvProduto.Open;
  DM_testepratico.FvCliente.Open;
  DM_testepratico.FvPedido.Open;
  DM_testepratico.FvItemPedido.Open;
end;

procedure TFRegPedidos.PG_RegPedidosChange(Sender: TObject);
begin

  Button1.Enabled := BtFechar.Enabled;
  Button4.Enabled := Button1.Enabled;
  Button5.Enabled := Button1.Enabled;

  DM_testepratico.FvPedido.CLOSE;
  DM_testepratico.FvPedido.Open;

end;

end.
