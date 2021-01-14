unit uBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFBusca = class(TForm)
    dsBusca: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cb_Busca: TComboBox;
    EdBusca: TEdit;
    BtFechar: TButton;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure BtFecharClick(Sender: TObject);
    procedure cb_BuscaExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBusca: TFBusca;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFBusca.BtFecharClick(Sender: TObject);
begin

  case cb_Busca.ItemIndex of
    1:
      begin
        try
          strtoint(EdBusca.Text);
        except
          begin
            ShowMessage('Ocorreu um erro.' + #13 +
              'Por favor, informe numero valido.');
            exit;
          end;
        end;

        if EdBusca.Text = '' then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, numero de Pedido.');
          exit;
        end;
      end;
    2:
      begin
        if EdBusca.Text = '' then
        begin
          ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Nome do cliente.');
          exit;
        end;
      end;
    3:
      begin
        try
          StrToDate(EdBusca.Text);
        except
          ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Data valida.');
          exit;
        end;

        if EdBusca.Text = '' then
        begin
          ShowMessage('Ocorreu um erro.' + #13 +
            'Por favor, Data diferente de vazio.');
          exit;
        end;
      end;
  end;
  //
  DM_testepratico.FfPedido.CLOSE;
  DM_testepratico.FfPedido.Params.ParamByName('ACAO').Value := 'P';
  DM_testepratico.FfPedido.Params.ParamByName('RET').Value :=
    cb_Busca.ItemIndex;
  DM_testepratico.FfPedido.Params.ParamByName('BUS').Value := EdBusca.Text;
  DM_testepratico.FfPedido.open;

end;

procedure TFBusca.Button1Click(Sender: TObject);
begin
  //
  case cb_Busca.ItemIndex of
    0:
      begin
        DM_testepratico.FvPedido.CLOSE;
        DM_testepratico.FvPedido.Params.ParamByName('ACAO').Value := 'C';
        DM_testepratico.FvPedido.Params.ParamByName('RET').Value := 0;
        DM_testepratico.FvPedido.open;
      end;
    1 .. 4:
      begin
        if not DM_testepratico.FfPedido.Eof then
        begin
          DM_testepratico.FvPedido.CLOSE;
          DM_testepratico.FvPedido.Params.ParamByName('ACAO').Value := 'C';
          DM_testepratico.FvPedido.Params.ParamByName('RET').Value := 1;
          DM_testepratico.FvPedido.Params.ParamByName('BUS').Value :=
            DM_testepratico.FfPedido.FieldByName('PEDIDO').Value;
          DM_testepratico.FvPedido.open;

        end
      end;
  end;
  DM_testepratico.FfPedido.CLOSE;
  CLOSE;
end;

procedure TFBusca.cb_BuscaExit(Sender: TObject);
begin

  EdBusca.Clear;
  EdBusca.Width := 0;

  case cb_Busca.ItemIndex of
    1:
      begin
        EdBusca.Width := 80;
      end;
    2:
      begin
        EdBusca.Width := 360;
      end;
    3:
      begin
        EdBusca.Width := 80;
      end;
  end;

end;

procedure TFBusca.DBGrid1DblClick(Sender: TObject);
begin
  Button1Click(Self);
end;

end.
