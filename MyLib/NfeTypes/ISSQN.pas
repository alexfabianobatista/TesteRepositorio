unit ISSQN;

interface

uses
  NfeTypes;

type
  TISSQN = class(TNFeElementNoEmptys)
  protected
    FVBC: Extended;
    FVAliq: Extended;
    FVISSQN: Extended;
    FCMunFG: Integer;
    FCListServ: String;
    FVDeducao: TNFeFloat2;
    FVOutro: TNFeFloat2;
    FVDescIncond: TNFeFloat2;
    FVDescCond: TNFeFloat2;
    FVISSRet: TNFeFloat2;
    FIndISS: Integer; // 1=Exigível, 2=Não incidência; 3=Isenção; 4=Exportação; 5=Imunidade; 6=Exigibilidade Suspensa por Decisão Judicial;
                      // 7=Exigibilidade Suspensa por Processo Administrativo;
    FCServico: String;
    FCMun: Integer; // Tabela do IBGE. Informar "9999999" para serviço fora do País.
    FCPais: Integer; // Tabela do BACEN. Infomar somente se o município da prestação do serviço for "9999999".
    FNProcesso: String;  //Informar somente quando declarada a suspensão da exigibilidade do ISSQN.
    FIndIncentivo: Integer; //  1=Sim; 2=Não;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property VAliq: Extended read FVAliq write FVAliq;
    property VISSQN: Extended read FVISSQN write FVISSQN;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property CListServ: String read FCListServ write FCListServ;
    property VDeducao: TNFeFloat2 read FVDeducao write FVDeducao;
    property VOutro: TNFeFloat2 read FVOutro write FVOutro;
    property VDescIncond: TNFeFloat2 read FVDescIncond write FVDescIncond;
    property VDescCond: TNFeFloat2 read FVDescCond write FVDescCond;
    property VISSRet: TNFeFloat2 read FVISSRet write FVISSRet;
    property IndISS: Integer read FIndISS write FIndISS;
    property CServico: String read FCServico write FCServico;
    property CMun: Integer read FCMun write FCMun;
    property CPais: Integer read FCPais write FCPais;
    property NProcesso: String read FNProcesso write FNProcesso;
    property IndIncentivo: Integer read FIndIncentivo write FIndIncentivo;
  end;

implementation

end.
