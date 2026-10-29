unit InfCteComp;

interface

uses
  CteTypes, ICMSCte;

type
  TCompComp = class(TCTeElement)
  protected
    FXNome: String;
    FVComp: TCTeFloat2;
  published
    property XNome: String read FXNome write FXNome;
    property VComp: TCTeFloat2 read FVComp write FVComp;
  end;

  TVPresComp = class(TCTeElement)
  protected
    FVTPrest: TCTeFloat2;
    FCompComp: TCTeElementItems;
  published
    property VTPrest: TCTeFloat2 read FVTPrest write FVTPrest;
    property CompComp: TCTeElementItems read FCompComp write FCompComp;
  end;
  TImpComp = class(TCTeElement)
  protected
    FICMSComp: TICMSImposto;
    FInfAdFisco: String;
  published
    property ICMSComp: TICMSImposto read FICMSComp write FICMSComp;
    property InfAdFisco: String read FInfAdFisco write FInfAdFisco;
  end;
  TInfCteComp = class(TCTeElementNoEmptys)
  protected
    FChave: String;
    FChCTe: String;
  published
    property Chave: String read FChave write FChave;
    property ChCTe: String read FChCTe write FChCTe;
  end;

implementation

end.
 