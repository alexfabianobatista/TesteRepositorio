unit Imposto;

interface

uses
  PIS, ICMS, ICMSST, IPI, NfeTypes, ISSQN, COFINS, TypInfo, II, IBSCBS, ISClass;

type
  //ID = M01
  TICMSUFDest = class(TNFeElement)
  private
  protected
    FVBCUFDest: TNFeFloat2;
    FVBCFCPUFDest: TNFeFloat2;
    FPFCPUFDest: TNFeFloat2;
    FPICMSUFDest: TNFeFloat2;
    FPICMSInter: TNFeFloat2;
    FPICMSInterPart: TNFeFloat2;
    FVFCPUFDest: TNFeFloat2;
    FVICMSUFDest: TNFeFloat2;
    FVICMSUFRemet: TNFeFloat2;
  published
    property VBCUFDest: TNFeFloat2 read FVBCUFDest write FVBCUFDest;
    property VBCFCPUFDest: TNFeFloat2 read FVBCFCPUFDest write FVBCFCPUFDest;
    property PFCPUFDest: TNFeFloat2 read FPFCPUFDest write FPFCPUFDest;
    property PICMSUFDest: TNFeFloat2 read FPICMSUFDest write FPICMSUFDest;
    property PICMSInter: TNFeFloat2 read FPICMSInter write FPICMSInter;
    property PICMSInterPart: TNFeFloat2 read FPICMSInterPart write FPICMSInterPart;
    property VFCPUFDest: TNFeFloat2 read FVFCPUFDest write FVFCPUFDest;
    property VICMSUFDest: TNFeFloat2 read FVICMSUFDest write FVICMSUFDest;
    property VICMSUFRemet: TNFeFloat2 read FVICMSUFRemet write FVICMSUFRemet;
  end;

  TImposto = class(TNFeElement)
  private
  protected
    FVTotTrib: TNFeFloat2;
    FCofins: TCOFINS;
    FCofinsST: TCOFINSST;
    FICMS: TICMSImposto;
    FII: TII; //Imposto de Importação (ainda não implementado)
    FIPI: TIPI;
    FISSQN: TISSQN; //ISSQN (ainda não implementado)
    FPIS: TPIS;
    FPISST: TObject; //Imposto PIS com substituição tributária (ainda não implementado)
    FICMSUFDest: TICMSUFDest;
    //FIS: TIS;
    FIBSCBS: TIBSCBS;
    function GetXMLName(Prop: TPropInfo): String; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VTotTrib: TNFeFloat2 read FVTotTrib write FVTotTrib;
    property ICMS: TICMSImposto read FIcms write FIcms;
    property IPI: TIPI read FIPI write FIPI;
    property II: TII read FII write FII;
    property ISSQN: TISSQN read FISSQN write FISSQN;
    property PIS: TPIS read FPIS write FPIS;
    property PISST: TObject read FPISST write FPISST;
    property Cofins: TCOFINS read FCofins write FCofins;
    property CofinsST: TCOFINSST read FCofinsST write FCofinsST;
    property ICMSUFDest: TICMSUFDest read FICMSUFDest write FICMSUFDest;
    //property IS: TIS read FIS write FIS;
    property IBSCBS: TIBSCBS read FIBSCBS write FIBSCBS;
  end;

implementation

{ TImposto }

function TImposto.GetXMLName(Prop: TPropInfo): String;
begin
  FSameName := ',icms';
  Result := inherited GetXMLName(Prop);
end;

end.
