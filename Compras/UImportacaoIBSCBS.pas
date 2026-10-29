unit UImportacaoIBSCBS;

interface

uses SysUtils, DB, XMLIntf;

type
  TIBSCBSImportado = record
    Presente: Boolean;
    CST, ClassTrib: string;
    Base, IBSUF, IBSMun, CBS: Currency;
  end;

function LeIBSCBS(const Imposto: IXMLNode): TIBSCBSImportado;
procedure GravaIBSCBS(Item: TDataSet; const Tributo: TIBSCBSImportado;
  FracaoAnterior, FracaoAtual: Double);
function PreservaIBSCBSXML(Item: TDataSet; const XML: string): Boolean;

implementation

uses XMLDoc;

function Filho(const Node: IXMLNode; const Nome: string): IXMLNode;
begin
  Result := nil;
  if Node <> nil then
    Result := Node.ChildNodes.FindNode(Nome);
end;

function Texto(const Node: IXMLNode; const Nome: string): string;
var N: IXMLNode;
begin
  Result := '';
  N := Filho(Node, Nome);
  if N <> nil then
    Result := Trim(N.Text);
end;

function Valor(const Node: IXMLNode; const Nome: string): Currency;
var S: string;
begin
  Result := 0;
  S := Texto(Node, Nome);
  if S <> '' then
    Result := StrToCurr(StringReplace(S, '.', DecimalSeparator, [rfReplaceAll]));
end;

function LeIBSCBS(const Imposto: IXMLNode): TIBSCBSImportado;
var N, Grupo: IXMLNode;
begin
  N := Filho(Imposto, 'IBSCBS');
  Result.Presente := N <> nil;
  Result.CST := Texto(N, 'CST');
  Result.ClassTrib := Texto(N, 'cClassTrib');
  Grupo := Filho(N, 'gIBSCBS');
  Result.Base := Valor(Grupo, 'vBC');
  Result.IBSUF := Valor(Filho(Grupo, 'gIBSUF'), 'vIBSUF');
  Result.IBSMun := Valor(Filho(Grupo, 'gIBSMun'), 'vIBSMun');
  Result.CBS := Valor(Filho(Grupo, 'gCBS'), 'vCBS');
end;

function Rateia(Valor: Currency; Anterior, Atual: Double): Currency;
begin
  // Diferenca entre acumulados: preserva os centavos do item ao dividir lotes.
  Result := (Round(Valor * Atual * 100) - Round(Valor * Anterior * 100)) / 100;
end;

procedure GravaIBSCBS(Item: TDataSet; const Tributo: TIBSCBSImportado;
  FracaoAnterior, FracaoAtual: Double);
begin
  if not Tributo.Presente then
    Exit;
  Item.FieldByName('NUM_CST_IBS_CBS').AsString := Tributo.CST;
  Item.FieldByName('NUM_CLASS_TRIB_IBS_CBS').AsString := Tributo.ClassTrib;
  Item.FieldByName('VAL_BC_IBS_CBS').AsCurrency := Rateia(Tributo.Base, FracaoAnterior, FracaoAtual);
  Item.FieldByName('VAL_IBS_EST').AsCurrency := Rateia(Tributo.IBSUF, FracaoAnterior, FracaoAtual);
  Item.FieldByName('VAL_IBS_MUN').AsCurrency := Rateia(Tributo.IBSMun, FracaoAnterior, FracaoAtual);
  Item.FieldByName('VAL_CBS').AsCurrency := Rateia(Tributo.CBS, FracaoAnterior, FracaoAtual);
end;

function PreservaIBSCBSXML(Item: TDataSet; const XML: string): Boolean;
var
  Doc: IXMLDocument;
  Inf, Det, Tributo: IXMLNode;
  I: Integer;
begin
  Result := False;
  if (Trim(XML) = '')
    or (Item.FieldByName('NUM_CST_IBS_CBS').AsString = '')
    or Item.FieldByName('VAL_BC_IBS_CBS').IsNull then
    Exit;
  // Confere a origem tambem ao reabrir a nota. XMLs antigos continuam
  // utilizando o calculo existente, mesmo com campos ja preenchidos.
  Doc := LoadXMLData(XML);
  Inf := Filho(Filho(Doc.DocumentElement, 'NFe'), 'infNFe');
  if Inf = nil then
    Exit;
  for I := 0 to Inf.ChildNodes.Count - 1 do
  begin
    Det := Inf.ChildNodes[I];
    if Det.LocalName = 'det' then
    begin
      Tributo := Filho(Filho(Det, 'imposto'), 'IBSCBS');
      if (Tributo <> nil)
        and (Texto(Tributo, 'CST') = Item.FieldByName('NUM_CST_IBS_CBS').AsString)
        and (Texto(Tributo, 'cClassTrib') = Item.FieldByName('NUM_CLASS_TRIB_IBS_CBS').AsString) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

end.
