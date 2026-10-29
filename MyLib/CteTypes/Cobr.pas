unit Cobr;

interface

uses
  CteTypes;

type
  TDup = class(TCTeElementNoEmptys)
  protected
    FNDup: Integer;
    FDVenc: TCTeData;
    FVDup: TCTeFloat2;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NDup: Integer read FNDup write FNDup;
    property DVenc: TCTeData read FDVenc write FDVenc;
    property VDup: TCTeFloat2 read FVDup write FVDup;
  end;

//  TDups = Array of TDup;

  TFat = class(TCTeElementNoEmptys)
  protected
    FNFat: Integer;
    FVOrig: TCTeFloat2;
    FVDesc: TCTeFloat2;
    FVLiq: TCTeFloat2;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NFat: Integer read FNFat write FNFat;
    property VOrig: TCTeFloat2 read FVOrig write FVOrig;
    property VDesc: TCTeFloat2 read FVDesc write FVDesc;
    property VLiq: TCTeFloat2 read FVLiq write FVLiq;
  end;

  TCobr = class(TCTeElement)
  protected
    FFat: TFat;
    FDup: TCTeElementItems;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Fat: TFat read FFat write FFat;
    property Dup: TCTeElementItems read FDup write FDup;
  end;
implementation

end.
