unit Cobranca;

interface

uses
  NfeTypes;

type
  TDup = class(TNFeElementNoEmptys)
  protected
    FNDup: TNFeIntegerComZero;
    FDVenc: TNFeData;
    FVDup: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NDup: TNFeIntegerComZero read FNDup write FNDup;
    property DVenc: TNFeData read FDVenc write FDVenc;
    property VDup: Extended read FVDup write FVDup;
  end;

//  TDups = Array of TDup;

  TFat = class(TNFeElementNoEmptys)
  protected
    FNFat: Integer;
    FVOrig: Extended;
    FVDesc: TNFeFloat2;
    FVLiq: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NFat: Integer read FNFat write FNFat;
    property VOrig: Extended read FVOrig write FVOrig;
    property VDesc: TNFeFloat2 read FVDesc write FVDesc;
    property VLiq: Extended read FVLiq write FVLiq;
  end;

  TCobr = class(TNFeElement)
  protected
    FFat: TFat;
    FDup: TNFeElementItems;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Fat: TFat read FFat write FFat;
    property Dup: TNFeElementItems read FDup write FDup;
  end;

implementation

end.
