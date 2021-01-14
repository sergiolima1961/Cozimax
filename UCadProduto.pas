unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type

  TFCadProduto = class(TForm)
    DSProduto: TDataSource;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;

    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSProdutoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadProduto: TFCadProduto;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFCadProduto.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DM_testepratico.FvProduto.Append;
  DM_testepratico.FvProdutoValor.Value := 0;

end;

procedure TFCadProduto.Button2Click(Sender: TObject);
begin
  DM_testepratico.FvProduto.Cancel;

  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
end;

procedure TFCadProduto.Button3Click(Sender: TObject);
VAR
  vacao: STRING;
begin

  try
    try

      with DM_testepratico do
      begin

        if (DM_testepratico.FvProduto.FieldByName('Valor').Value = 0 ) or
          (DM_testepratico.FvProduto.FieldByName('Valor').IsNull) then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, Informe a Valor Unitario.');
          DBEdit5.SetFocus;
          exit;
        end;
        //
        if (DM_testepratico.FvProduto.FieldByName('Produto').Value = '') or
          (DM_testepratico.FvProduto.FieldByName('Produto').IsNull) then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, Informe a Descrição.');
          DBEdit2.SetFocus;
          exit;
        end;
        //

        vacao := 'E';

        IF FvProduto.State = dsInsert THEN
          vacao := 'I';

        if FvProduto.State = dsEdit then
          vacao := 'A';

        FtProduto.Params.ParamByName('ACAO').Value := vacao;
        FtProduto.Params.ParamByName('COD').Value :=
          FvProduto.FieldByName('Codigo').Value;
        FtProduto.Params.ParamByName('DSC').Value :=
          FvProduto.FieldByName('Produto').Value;
        FtProduto.Params.ParamByName('VLR').Value :=
          FvProduto.FieldByName('Valor').Value;
        FtProduto.ExecSQL;
      end;
    except
      On E: Exception do
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, entre em contato com o administrador do sistema.');
        exit;
      end;
    end;

    Button1.Enabled := true;
    Button4.Enabled := (Button1.Enabled);
    Button5.Enabled := (Button1.Enabled);
    Button3.Enabled := not(Button1.Enabled);
    Button2.Enabled := not(Button1.Enabled);
    with DM_testepratico do
    begin
      FvProduto.Cancel;
      FvProduto.close;
      FvProduto.open;
    end;

  finally

  end;

end;

procedure TFCadProduto.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DM_testepratico.FvProduto.Edit;
end;

procedure TFCadProduto.Button5Click(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    Button3Click(Self);
  end;
end;

procedure TFCadProduto.DSProdutoDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FvProduto.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FvProduto.RecordCount);
end;

procedure TFCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FvProduto.close;
end;

procedure TFCadProduto.FormCreate(Sender: TObject);
begin
  DM_testepratico.FvProduto.open;
end;

end.
