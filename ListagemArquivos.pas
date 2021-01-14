unit ListagemArquivos;

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
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfListarArquivos = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    ActionList1: TActionList;
    ActionListar: TAction;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    FileOpenDialog2: TFileOpenDialog;
    procedure ActionListarExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListarArquivos: TfListarArquivos;

implementation

{$R *.dfm}

procedure TfListarArquivos.ActionListarExecute(Sender: TObject);
var
  x   : TSearchRec;
  iRet: Integer;
begin
  Self.Memo1.Clear;
  try
    iRet := FindFirst(Self.Edit1.Text + '\*.*', faAnyFile, x);
    while iRet = 0 do
    begin
      Self.Memo1.Lines.Add(x.Name);
      iRet := FindNext(x);
    end;
  finally
    FindClose(x);
  end;
end;

procedure TfListarArquivos.Button2Click(Sender: TObject);
begin
  if Self.FileOpenDialog2.Execute(Self.Handle) then
  begin
    Self.Edit1.Text := Self.FileOpenDialog2.FileName;
  end;
end;

end.
