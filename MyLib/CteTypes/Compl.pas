unit Compl;

interface

uses
  CteTypes, Entrega;

type
  TPass = class(TCTeElement)
  protected
    FXPass: String;
    FXDest: String;
    FXRota: String;
  published
    property XPass: String read FXPass write FXPass;
    property XDest: String read FXDest write FXDest;
    property XRota: String read FXRota write FXRota;
  end;
  TFluxo = class(TCTeElement)
  protected
    FXOrig: String;
    FPass: TCTeElementItems;
  published
    property XOrig: String read FXOrig write FXOrig;
    property Pass: TCTeElementItems read FPass write FPass;
  end;
  TObsCont = class(TCTeElement)
  protected
    FXCampo: String;
    FXTexto: String;
  published
    property XCampo: String read FXCampo write FXCampo;
    property XTexto: String read FXTexto write FXTexto;
  end;
  TObsFisco = class(TCTeElement)
  protected
    FXCampo: String;
    FXTexto: String;
  published
    property XCampo: String read FXCampo write FXCampo;
    property XTexto: String read FXTexto write FXTexto;
  end;


  TCompl = class(TCTeElement)
  protected
    FXCaracAd: String;
    FXCaracSer: String;
    FXEmi: String;
    FFluxo: TFluxo;
    FEntrega: TEntrega;
    FOrigCalc: String;
    FDestCalc: String;
    FXObs: String;
    FObsCont: TCTeElementItems;
    FObsFisco: TCTeElementItems;
  published
    property XCaracAd: String read FXCaracAd write FXCaracAd;
    property XCaracSer: String read FXCaracSer write FXCaracSer;
    property XEmi: String read FXEmi write FXEmi;
    property Fluxo: TFluxo read FFluxo write FFluxo;
    property Entrega: TEntrega read FEntrega write FEntrega;
    property OrigCalc: String read FOrigCalc write FOrigCalc;
    property DestCalc: String read FDestCalc write FDestCalc;
    property XObs: String read FXObs write FXObs;
    property ObsCont: TCTeElementItems read FObsCont write FObsCont;
    property ObsFisco: TCTeElementItems read FObsFisco write FObsFisco;
  end;

implementation

end.
