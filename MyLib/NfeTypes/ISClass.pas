unit ISClass;

interface

uses
  NfeConsts, NfeTypes, TypInfo;

type
  // ===========================================================================
  // UB01 - Grupo de Informações do Imposto Seletivo
  // ===========================================================================
  TIS = class(TNFeElement)
  private
    FCSTIS: String;
    FCClassTribIS: String;
    FVBCIS: TNFeFloat2;
    FPIS: TNFeFloat4;
    FPISEspec: TNFeFloat4;
    FUTrib: String;
    FQTrib: TNFeFloat4;
    FVIS: TNFeFloat2;
  published
    property CSTIS: String read FCSTIS write FCSTIS;                // Código Situação Tributária do Imposto Seletivo
    property CClassTribIS: String read FCClassTribIS write FCClassTribIS;  // Código da Classe de Tributação
    property VBCIS: TNFeFloat2 read FVBCIS write FVBCIS;                // Valor da base de cálculo do IS
    property PIS: TNFeFloat4 read FPIS write FPIS;                      // Alíquota percentual do IS
    property PISEspec: TNFeFloat4 read FPISEspec write FPISEspec;       // Alíquota específica (por valor)
    property UTrib: String read FUTrib write FUTrib;                // Unidade de medida
    property QTrib: TNFeFloat4 read FQTrib write FQTrib;                // Quantidade tributável
    property VIS: TNFeFloat2 read FVIS write FVIS;                      // Valor do Imposto Seletivo
  end;

implementation

end.
