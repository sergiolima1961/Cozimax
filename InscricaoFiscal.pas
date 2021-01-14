unit InscricaoFiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils;

type

  /// <summary>
  /// Classe base para validação da inscrição fiscal: CPF e CNPJ
  /// </summary>
  TInscricaoFiscal = class abstract(TObject)
  public
    function DocumentoValido(const ADocumento: string): Boolean;
      virtual; abstract;
  end;

  TCNPJ = class(TInscricaoFiscal)
  public
    function DocumentoValido(const ADocumento: string): Boolean; override;
  end;

  TCPF = class(TInscricaoFiscal)
  public
    function DocumentoValido(const ADocumento: string): Boolean; override;
  end;

implementation

{ TCNPJ }

function TCNPJ.DocumentoValido(const ADocumento: string): Boolean;
var
  v: array [1 .. 2] of Word;
  cnpj: array [1 .. 14] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(ADocumento) <> 14 then
  begin
    Exit;
  end;

  { Conferindo se todos dígitos são iguais }
  if ADocumento = StringOfChar('0', 14) then
    Exit;

  if ADocumento = StringOfChar('1', 14) then
    Exit;

  if ADocumento = StringOfChar('2', 14) then
    Exit;

  if ADocumento = StringOfChar('3', 14) then
    Exit;

  if ADocumento = StringOfChar('4', 14) then
    Exit;

  if ADocumento = StringOfChar('5', 14) then
    Exit;

  if ADocumento = StringOfChar('6', 14) then
    Exit;

  if ADocumento = StringOfChar('7', 14) then
    Exit;

  if ADocumento = StringOfChar('8', 14) then
    Exit;

  if ADocumento = StringOfChar('9', 14) then
    Exit;

  try
    for I := 1 to 14 do
      cnpj[I] := StrToInt(ADocumento[I]);

    // Nota: Calcula o primeiro dígito de verificação.
    v[1] := 5 * cnpj[1] + 4 * cnpj[2] + 3 * cnpj[3] + 2 * cnpj[4];
    v[1] := v[1] + 9 * cnpj[5] + 8 * cnpj[6] + 7 * cnpj[7] + 6 * cnpj[8];
    v[1] := v[1] + 5 * cnpj[9] + 4 * cnpj[10] + 3 * cnpj[11] + 2 * cnpj[12];
    v[1] := 11 - v[1] mod 11;
    If v[1] >= 10 Then
      v[1] := 0
    else
      v[1] := v[1];

    // Nota: Calcula o segundo dígito de verificação.
    v[2] := 6 * cnpj[1] + 5 * cnpj[2] + 4 * cnpj[3] + 3 * cnpj[4];
    v[2] := v[2] + 2 * cnpj[5] + 9 * cnpj[6] + 8 * cnpj[7] + 7 * cnpj[8];
    v[2] := v[2] + 6 * cnpj[9] + 5 * cnpj[10] + 4 * cnpj[11] + 3 * cnpj[12];
    v[2] := v[2] + 2 * v[1];
    v[2] := 11 - v[2] mod 11;
    If v[2] >= 10 Then
      v[2] := 0
    else
      v[2] := v[2];

    // Nota: Verdadeiro se os dígitos de verificação são os esperados.
    Result := ((v[1] = cnpj[13]) and (v[2] = cnpj[14]));
  except
    on E: Exception do
      Result := False;
  end;
end;

{ TCPF }

function TCPF.DocumentoValido(const ADocumento: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin

  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(ADocumento[I]);

    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    If v[0] >= 10 Then
      v[0] := 0
    else
      v[0] := v[0];

    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;

    if v[1] >= 10 then
      v[1] := 0
    else
      v[1] := v[1];

    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

end.
