unit PisCofinsM700;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM700 = class(TRegistro)
  private
  public
    COD_CONT: string; //C(2)
    VL_CONT_APUR_DIFER: Double; //N(X,2)
    NAT_CRED_DESC: string; //C(2)
    VL_CRED_DESC_DIFER: Double; //N(X,2)
    VL_CONT_DIFER_ANT: Double; //N(X,2)
    PER_APUR: Integer; //N(6)
    DT_RECEB: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM700.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CONT, 2);
  addCampo(VL_CONT_APUR_DIFER, 2);
  addCampo(NAT_CRED_DESC, 2);
  addCampo(VL_CRED_DESC_DIFER, 2);
  addCampo(VL_CONT_DIFER_ANT, 2);
  addCampo(PER_APUR, 6);
  addCampo(DT_RECEB, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

