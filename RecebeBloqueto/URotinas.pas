unit URotinas;

interface

uses SysUtils;//, Dialogs;

type
  TRotinas = class
    private

    public
      Function Modulo11BB_CBarra(N : string) : string;
      Function Modulo10(N : string) : string;
      Function ValidaCPF(wCPF : String):Boolean;
      Function ValidaCGC(wCGC : String):Boolean;
      Function FormataTexto(wString: String; wTamanho: integer): String;
      Function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
      Function RemoveAcento(Texto:String):string;
      Function IntDecimais (wValor :String; wTamanho, wDecimais:integer): String;
      Function StrZero(S: string; n: Byte): string;
end;

//Var

implementation

//uses URecebeBloqueto_cl;

function TRotinas.Modulo11BB_CBarra(N : string) : string;
var Somatorio,m,f : Integer;
begin
  m := 2;
  Somatorio := 0;
  for f := Length(N) downto 1 do
  begin
    Somatorio := Somatorio + ( StrToInt(N[f]) * m );
    inc(m);
    if m > 9 then m := 2;
  end;

  m := Somatorio div 11;
  m := Somatorio - ( m * 11);
  m := 11 - m;

  if (m = 10) or (m = 11) then
     m := 1;

  Result := IntToStr(m);
end;


function TRotinas.Modulo10(N : string) : string;
var
  Somatorio,m,k,f : Integer;
begin
  Somatorio := 0;
  if Odd(Length(N))
    then m := 2
    else m := 1;
  for f := 1 to Length(N) do
    begin
      k := StrToInt(N[f]) * m;
      if k > 9 then k := 1 + (k - 10);
      Somatorio := Somatorio + k;
      if m = 1
        then m := 2
        else m := 1;
    end;
  m := 1000 - Somatorio;
  Result := Copy(IntToStr(m), Length(IntToStr(m)), 1);
end;


Function TRotinas.ValidaCPF(wCPF : String):Boolean;
var
  d1, d4, xx, nCount, resto, digito1, digito2 :Integer;
  Check: String;
begin
  d1:=0; d4:=0; xx:=1;
  for nCount:=1 to length(wCPF)-2 do
  begin
    If Pos( copy(wCPF, nCount, 1), '/-.')=0 then
    begin
      d1:=d1+(11-xx)*StrToInt(Copy(wCPF, nCount, 1));
      d4:=d4+(12-xx)*StrToInt(Copy(wCPF, nCount, 1));
      xx:=xx+1;
    end;
  end;
  resto:=(d1 mod 11);
  if resto < 2 then
     digito1:=0
  else
     digito1:=11-resto;

  d4:=d4+2*digito1;
  resto:=(d4 mod 11);
  if resto < 2 then
     digito2:=0
  else
     digito2 := 11-resto;

  Check := IntToStr(digito1) + IntToStr(digito2);
  result := not (Check <> Copy (wCPF,Length(wCPF)-1, 2));
  if result = False then
     raise exception.Create(wCPF+' - CPF Inválido!');
end;


Function TRotinas.ValidaCGC(wCGC : String):Boolean;
var
  d1, d4, xx, nCount, fator, resto, digito1, digito2: integer;
  Check: String;
begin
  d1:=0;
  d4:=0;
  xx:=1;
  for nCount:= 1 to Length (wCGC)-2 do
  begin
    if Pos (copy(wCGC, nCount, 1), '/-.') = 0 then
    begin
      if xx < 5 then
         fator:=6-xx
      else
         fator:=14-xx;

      d1:=d1+StrToInt(copy(wCGC, nCount, 1))*fator;
      if xx < 6 then
         fator:=7-xx
      else
         fator:=15-xx;

      d4:=d4+StrToInt(copy(wCGC, nCount, 1))*fator;
      xx:=xx+1;
    end;
  end;

  resto:=(d1 mod 11);

  if resto < 2 then
     digito1:=0
  else
     digito1:=11-resto;

  d4:=d4+2*digito1;
  resto:=(d4 mod 11);
  if resto < 2 then
     digito2:=0
  else
     digito2:=11-resto;
  Check:=IntToStr(Digito1)+IntToStr(digito2);
  result := not (Check <> copy (wCGC,Length(wCGC)-1, 2));
  if result = False then
     raise exception.Create('CGC Inválido!');
end;


function TRotinas.FormataTexto(wString: String; wTamanho: integer): String;
var
  Texto :String;
begin
  if length(wString)> wTamanho then
    Result:=Copy(wString,1,wTamanho)
  else
    begin
      Texto:=wString;
      while length(Texto)<wTamanho do
        begin
         Texto:=Texto+' ';
        end;
      Result:=Texto;
    end;
end;


function TRotinas.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var
  S,Aux : string;
  x,c : integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

  while Length(S) < Zeros do
      S := '0' + S;

  for x := 1 to Zeros do
    Aux := '0' + Aux;
  C := Length(S);
  for x:= Zeros downto 1 do
  Begin
    Aux[x] := S[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;
  S:= Aux;
  Result := S;
end;


// -------------------------------------------------------\\
{ Função remove acentos da string passada como parametro}
function TRotinas.RemoveAcento(Texto:String):string;
var i : integer;
begin
  // Abaixo a relação de alguns caracteres não suportado por mainframes em especial(BB)
  for i := 1 to length( Texto ) do
  case Texto[i] of
      'á' : Texto[i] := 'a';
      'é' : Texto[i] := 'e';
      'í' : Texto[i] := 'i';
      'ó' : Texto[i] := 'o';
      'ú' : Texto[i] := 'u';
      'à' : Texto[i] := 'a';
      'è' : Texto[i] := 'e';
      'ì' : Texto[i] := 'i';
      'ò' : Texto[i] := 'o';
      'ù' : Texto[i] := 'u';
      'â' : Texto[i] := 'a';
      'ê' : Texto[i] := 'e';
      'î' : Texto[i] := 'i';
      'ô' : Texto[i] := 'o';
      'û' : Texto[i] := 'u';
      'ä' : Texto[i] := 'a';
      'ë' : Texto[i] := 'e';
      'ï' : Texto[i] := 'i';
      'ö' : Texto[i] := 'o';
      'ü' : Texto[i] := 'u';
      'õ' : Texto[i] := 'o';
      'ñ' : Texto[i] := 'n';
      'ç' : Texto[i] := 'c';
      'Á' : Texto[i] := 'A';
      'É' : Texto[i] := 'E';
      'Í' : Texto[i] := 'I';
      'Ó' : Texto[i] := 'O';
      'Ú' : Texto[i] := 'U';
      'À' : Texto[i] := 'A';
      'È' : Texto[i] := 'E';
      'Ì' : Texto[i] := 'I';
      'Ò' : Texto[i] := 'O';
      'Ù' : Texto[i] := 'U';
      'Â' : Texto[i] := 'A';
      'Ê' : Texto[i] := 'E';
      'Î' : Texto[i] := 'I';
      'Ô' : Texto[i] := 'O';
      'Û' : Texto[i] := 'U';
      'Ä' : Texto[i] := 'A';
      'Ë' : Texto[i] := 'E';
      'Ï' : Texto[i] := 'I';
      'Ö' : Texto[i] := 'O';
      'Ü' : Texto[i] := 'U';
      'Ã' : Texto[i] := 'A';
      'Õ' : Texto[i] := 'O';
      'Ñ' : Texto[i] := 'N';
      'Ç' : Texto[i] := 'C';
      '&' : Texto[i] := ' ';
      '*' : Texto[i] := ' ';
      '_' : Texto[i] := ' ';
      '-' : Texto[i] := ' ';
      '@' : Texto[i] := ' ';
      '#' : Texto[i] := ' ';
      '$' : Texto[i] := ' ';
      '|' : Texto[i] := ' ';
  end;
  Result := Texto;
end;


{funçao formata uma string de um valor numerico em uma quantidade de numeros inteiros e decimais}
Function TRotinas.IntDecimais (wValor :String; wTamanho, wDecimais:integer): String;
var
  C, Cont, Posicao :integer;
  Res, Aux :String;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  If wValor <> '' then
  Begin
    Str(StrToFloat(Trim(wValor)):wTamanho:wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    Begin
      Posicao:= Pos('.', Res);
      Delete(Res,Posicao,1);
    End;

  C := Length(Res);
  for Cont:= wTamanho downto 1 do
  Begin
    Aux[Cont] := Res[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;

  End;
  Res:= Aux;
  Result := Res;
End;


Function TRotinas.StrZero(S: string; n: Byte): string;
var
  Zeros : string;
  f : Integer;
begin
  Zeros := '';
  for f := 1 to N do
    Zeros := Zeros + '0';
  S := Copy(Zeros, 1, n - Length(S)) + S;
  Result := S;
end;

end.
