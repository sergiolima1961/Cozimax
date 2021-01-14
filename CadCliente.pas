unit CadCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  // Units Necessárias
  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.VCLUI.Wait, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdTelnet, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage,

  IdText, IdAttachmentFile, Vcl.ComCtrls, IdCustomTCPServer,
  IdSocksServer, IdHTTP, Vcl.Grids, Vcl.DBGrids;

type
  TEnderecoCompleto = record
    CEP, logradouro, complemento, bairro, localidade, uf, unidade,
      IBGE: string end;

  type
    TfCadCliente = class(TForm)
      DS_CLIENTE: TDataSource;
      GroupBox2: TGroupBox;
      Panel2: TPanel;
      Label1: TLabel;
      DBEdit1: TDBEdit;
      DBEdit12: TDBEdit;
      Panel1: TPanel;
      Label16: TLabel;
      Button1: TButton;
      Button2: TButton;
      Button3: TButton;
      Button4: TButton;
      Button5: TButton;
      DBGrid1: TDBGrid;
      Label15: TLabel;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FDQuery1AfterInsert(DataSet: TDataSet);
      procedure FDQuery1AfterPost(DataSet: TDataSet);
      procedure FDQuery1AfterCancel(DataSet: TDataSet);
      procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
      procedure FDQuery1AfterEdit(DataSet: TDataSet);
      procedure Button4Click(Sender: TObject);
      procedure DS_CLIENTEDataChange(Sender: TObject; Field: TField);
      procedure Button5Click(Sender: TObject);

    private
      { Private declarations }
      function GeneratorID(aName: string; Incrementa: Boolean): integer;

    var
      dadosEnderecoCompleto: TEnderecoCompleto;

      procedure mensagemAviso(mensagem: string);

    public
      { Public declarations }
      pAcao: string;
    end;

  var
    fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  System.RegularExpressions,
  InscricaoFiscal, uDM_testePratico;

procedure TfCadCliente.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);

  pAcao := 'I';
  DM_testepratico.FvCliente.Append;
  DBEdit1.SetFocus;
end;

procedure TfCadCliente.Button2Click(Sender: TObject);
begin
  DM_testepratico.FvCliente.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
end;

procedure TfCadCliente.Button3Click(Sender: TObject);
begin

  try
    try

      if (DM_testepratico.FvCliente.FieldByName('Nome').Value = '') or
        (DM_testepratico.FvCliente.FieldByName('Nome').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o Nome.');
        DBEdit1.SetFocus;
        exit;
      end;
      //
      DM_testepratico.FtCliente.Params.ParamByName('ACAO').Value := pAcao;
      DM_testepratico.FtCliente.Params.ParamByName('COD').Value :=
        DBEdit12.Text;
      DM_testepratico.FtCliente.Params.ParamByName('DSC').Value := DBEdit1.Text;
      DM_testepratico.FtCliente.Params.ParamByName('RET').Value := 0;
      DM_testepratico.FtCliente.ExecSQL;
      //
      Button1.Enabled := true;
      DBGrid1.Enabled := (Button1.Enabled);
      Button4.Enabled := (Button1.Enabled);
      Button5.Enabled := (Button1.Enabled);
      Button3.Enabled := not(Button1.Enabled);
      Button2.Enabled := not(Button1.Enabled);
      DM_testepratico.FvCliente.Cancel;;

      DM_testepratico.FvCliente.Active := false;
      DM_testepratico.FvCliente.Active := true;
      DM_testepratico.FvCliente.Locate('codigo', DBGrid1.Tag, []);

    except
      On E: Exception do
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, entre em contato com o administrador do sistema.');
        exit;
      end;
    end;

  finally
  end;

end;

procedure TfCadCliente.Button4Click(Sender: TObject);
begin
  DBGrid1.Enabled := false;
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);
  pAcao := 'A';
  DM_testepratico.FvCliente.Edit;
  DBEdit1.SetFocus;
end;

procedure TfCadCliente.Button5Click(Sender: TObject);
begin

  pAcao := '';
  if MessageDlg('Confirma a Exclusão em Defitivo ?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    pAcao := 'E';
    Button3Click(Self);
  end;

end;

procedure TfCadCliente.FDQuery1AfterCancel(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterEdit(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterInsert(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button4.Enabled);
  Button2.Enabled := Not(Button4.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterPost(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FvCliente.Close;
end;

procedure TfCadCliente.FormCreate(Sender: TObject);
begin
  DM_testepratico.FvCliente.Open;
end;

function TfCadCliente.GeneratorID(aName: string; Incrementa: Boolean): integer;
begin
end;

procedure TfCadCliente.DS_CLIENTEDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_testepratico.FvCliente.RecNo) + '/'
    + FormatFloat('0###', DM_testepratico.FvCliente.RecordCount);
end;

procedure TfCadCliente.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;

procedure TfCadCliente.mensagemAviso(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_OK + MB_ICONERROR);
end;

end.
