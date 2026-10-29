unit DI;

interface

uses
  NfeTypes, Adi, TypInfo;

type

  TDI = class(TNFeElementNoEmptys)
  private
  protected
    FCExportador: String;
    FDDesemb: TNFeData;
    FTpViaTransp: Integer;
    FVAFRMM: TNFeFloat2;
    FTpIntermedio: Integer;
    FCNPJ: String;
    FUFTerceiro: String;
    FDDI: TNFeData;
    FNDI: String;
    FUFDesemb: String;
    FXLocDesemb: String;
    FAdi: TNFeElementItems;

  public
  function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NDI: String read FNDI write FNDI;
    property DDI: TNFeData read FDDI write FDDI;
    property xLocDesemb: String read FXLocDesemb write FXLocDesemb;
    property UFDesemb: String read FUFDesemb write FUFDesemb;
    property dDesemb: TNFeData read FDDesemb write FDDesemb;
    property TpViaTransp: Integer read FTpViaTransp write FTpViaTransp;
    property VAFRMM: TNFeFloat2 read FVAFRMM write FVAFRMM;
    property TpIntermedio: Integer read FTpIntermedio write FTpIntermedio;
    property CNPJ: String read FCNPJ write FCNPJ;
    property UFTerceiro: String read FUFTerceiro write FUFTerceiro;
    property cExportador: String read FCExportador write FCExportador;
    property adi : TNFeElementItems read FAdi write FAdi;
  end;

implementation

uses
  SysUtils, StrUtils;

{ TDI }

function TDI.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
var
  NEmptys: String;
begin
  NEmptys := ',vAFRMM,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
  Result := not (PosEx(',' + UpperCase(Prop.Name) + ',', UpperCase(NEmptys)) > 0);
  if Result then
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
 