unit DocAnt;

interface

uses
  CteTypes, Envolvido;

type
  TIdDocAntPap = class(TCTeElement)
  protected
    FTpDoc: String;
    FSerie: String;
    FSubser: String;
    FNDoc: String;
    FDEmi: TCTeData;
  published
    property TpDoc: String read FTpDoc write FTpDoc;
    property Serie: String read FSerie write FSerie;
    property Subser: String read FSubser write FSubser;
    property NDoc: String read FNDoc write FNDoc;
    property DEmi: TCTeData read FDEmi write FDEmi;
  end;
  TIdDocAntEle = class(TCTeElement)
  protected
    FChave: String;
    FChCTe: String;
  published
    property Chave: String read FChave write FChave;
    property ChCTe: String read FChCTe write FChCTe;
  end;
  TIdDocAnt = class(TCTeElement)
  protected
    FIdDocAntPap: TCTeElementItems;
    FIdDocAntEle: TCTeElementItems;
  published
    property IdDocAntPap: TCTeElementItems read FIdDocAntPap write FIdDocAntPap;
    property IdDocAntEle: TCTeElementItems read FIdDocAntEle write FIdDocAntEle;
  end;
  TEmiDocAnt = class(TEnvolvido)
  protected
    FUF: String;
    FIdDocAnt: TCTeElementItems;
  published
    property CNPJ;
    property CPF;
    property IE;
    property UF: String read FUF write FUF;
    property XNome;
    property IdDocAnt: TCTeElementItems read FIdDocAnt write FIdDocAnt;
  end;
  TDocAnt = class(TCTeElement)
  protected
    FEmiDocAnt: TCTeElementItems;
  published
    property EmiDocAnt: TCTeElementItems read FEmiDocAnt write FEmiDocAnt;
  end;

implementation

end.
 