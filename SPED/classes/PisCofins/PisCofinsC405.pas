unit PisCofinsC405;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC405 = class(TRegistro)
  private
  public
    DT_DOC: TDate; //N(8)
    CRO: Integer; //N(3)
    CRZ: Integer; //N(6)
    NUM_COO_FIN: Integer; //N(6)
    GT_FIN: Double; //N(X,2)
    VL_BRT: Double; //N(X,2)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC405 }

procedure TPisCofinsC405.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_DOC, 'D');
  addCampo(CRO, 3);
  addCampo(CRZ, 6);
  addCampo(NUM_COO_FIN, 6);
  addCampo(GT_FIN, 2);
  addCampo(VL_BRT, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
